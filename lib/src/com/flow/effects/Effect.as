﻿/**
 * Copyright (c) 2011 Tuomas Artman, http://artman.fi
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

package com.flow.effects {
	
	import com.flow.managers.LayoutManager;
	import com.flow.motion.Tween;
	
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	[DefaultProperty("children")]
	public class Effect extends EventDispatcher{
		
		private var _value:Number;
		protected var _target:DisplayObject;
		private var _children:Vector.<Effect>;
		private var assignedFilters:Array = [];
		private var _alpha:Number;
		private var _followTargetAlpha:Boolean;
		public var parent:Effect = null;
		private var _composition:String = EffectComposition.SHARE_VALUE;
		public var invalidated:Boolean = false;
		private var propertiesInvalidated:Boolean;
		
		public function Effect(target:DisplayObject = null){
			_children = new Vector.<Effect>();
			this.target = target;
			_alpha = 1;
			_value = 1;
			propertiesInvalidated = true;
		}
		
		public function get target():DisplayObject {
			return _target;
		}
		public function set target(value:DisplayObject):void {
			if(value != _target) {
				if(_target) {
					dispose();
					_target.removeEventListener(Event.REMOVED_FROM_STAGE, removedFromStage);
					_target.removeEventListener(Event.ADDED_TO_STAGE, validate);
				}
				_target = value;
				if(_target) {
					_target.addEventListener(Event.REMOVED_FROM_STAGE, removedFromStage, false, 0, true);
					_target.addEventListener(Event.ADDED_TO_STAGE, validate);
					assignedFilters = _target.filters;
					invalidate();
				}
				for(var i:int = 0; i<_children.length; i++) {
					_children[i].target = _target;
				}
			}
		}
		
		[ArrayElementType("com.flow.effects.Effect")]
		public function get children():Vector.<Effect> {
			return _children;
		}
		public function set children(value:Vector.<Effect>):void {
			_children = new Vector.<Effect>();
			for(var i:int = 0; i<value.length; i++) {
				addChild(value[i]);
			}
			invalidate();
		}
		
		public function addChild(effect:Effect, composition:String = "shareValue"):void {
			effect.parent = this;
			effect.composition = composition;
			effect.target = target;
			children.push(effect);
		}
		
		private function removedFromStage(e:Event):void {
			target.removeEventListener(Event.REMOVED_FROM_STAGE, removedFromStage);
			dispose();
		}
		
		public function get followTargetAlpha():Boolean{
			return _followTargetAlpha;
		}
		
		public function set followTargetAlpha(value:Boolean):void {
			_followTargetAlpha = value;
			if(value) {
				addEventListener(Event.ENTER_FRAME, checkTargetAlpha, false, 0, true);
			} else {
				removeEventListener(Event.ENTER_FRAME, checkTargetAlpha);
			}
		}
		
		private function checkTargetAlpha():void {
			if(_target.alpha != _alpha){
				targetAlpha = _target.alpha;
				value = (1-targetAlpha);
			}
		}
		
		public function get value():Number{
			return _value;
		}
		public function set value(val:Number):void{
			_value = val;
			invalidate();
		}

		public function get targetAlpha():Number {
			return _alpha;
		}
		public function set targetAlpha(val:Number):void {
			_alpha = val;
			if(_target) {
				_target.alpha = val;
			}
			value = 1-val;
		}
		
		public function get composition():String {
			return _composition;
		}
		
		public function set composition(value:String):void {
			if(value != _composition) {
				_composition = value;
				for(var i:int = 0; i<_children.length; i++) {
					_children[i].composition = _composition;
				}
			}
		}
		
		protected function invalidateProperties():void {
			if(!propertiesInvalidated) {
				propertiesInvalidated = true;
				invalidate();
			}
		}
		
		protected function validateProperties():void {
			// Override
		}
		
		protected function invalidate():void {
			if(!invalidated && _target) {
				LayoutManager.instance.invalidateEffect(this);
				invalidated = true;
			}
		}
		
		public function validate(evt:Event = null):void {
			if(parent) {
				parent.validate(evt);
			} else {
				apply(_value);
			}
			invalidated = false;
		}
	
		private function apply(val:Number):Array{	
			if(propertiesInvalidated) {
				validateProperties();
				propertiesInvalidated = false;
			}
			var filters:Array = render(val);
			for(var i:Number = 0; i<children.length; i++) {
				var child:Effect = children[i];
				var childValue:Number = val;
				if(child.composition == EffectComposition.INDEPENDENT) {
					childValue = child.value;
				} else if(child.composition == EffectComposition.MULTIPLY) {
					childValue = child.value * val;
				}
				filters = filters.concat(child.apply(childValue));
			}
			if(parent){
				return filters;
			} else {
				filters = filters.concat(assignedFilters);
				if(_target) {
					_target.filters = filters;
				}
			}
			return null;
		}
		
		protected function render(val:Number):Array{
			return new Array();
		}
		
		public function fadeTargetIn(speed:Number, params:Object = null):Tween {
			return new Tween(this, speed, {targetAlpha:1}, params); 
		}
		
		public function fadeTargetOut(speed:Number, params:Object = null):Tween{
			return new Tween(this, speed, {targetAlpha:0}, params); 
		}

		public function animateIn(speed:Number, params:Object = null):Tween {
			return new Tween(this, speed, {value:1}, params); 
		}

		public function animateOut(speed:Number, params:Object = null):Tween {
			return new Tween(this, speed, {value:0}, params); 
		}
	
		public function dispose():void {
			_target.filters = assignedFilters;
		}	
	}
}