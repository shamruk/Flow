/**
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

package com.flow.containers {
	
	import com.flow.components.HScrollBar;
	import com.flow.components.VScrollBar;
	import com.flow.motion.Tween;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	
	/**
	 * A scrolling container with horizontal and vertical scroll bars that can be controlled with the keyboard or mouse wheel.
	 */	
	public class Scroller extends Container {
		
		private var _scrollX:Number = 0;
		private var _scrollY:Number = 0;
		private var hScrollBar:HScrollBar;
		private var vScrollBar:VScrollBar;
		
		/**
		 * Constructor 
		 */		
		public function Scroller() {
			super();
			childContainer = new Sprite();
			hScrollBar = new HScrollBar();
			vScrollBar = new VScrollBar();
			rawAddChild(childContainer);
			rawAddChild(hScrollBar);
			rawAddChild(vScrollBar);
			vScrollBar.addEventListener(Event.CHANGE, checkScroll);
			hScrollBar.addEventListener(Event.CHANGE, checkScroll);
			addEventListener(MouseEvent.MOUSE_WHEEL, wheel);
			addEventListener(KeyboardEvent.KEY_DOWN, keyDown);
			mouseEnabled = true;
		}
		
		/** @private */
		protected function wheel(event:MouseEvent):void {
			scrollY -= event.delta;
		}
		
		/** @private */
		private function keyDown(e:KeyboardEvent):void {
			switch (e.keyCode) {
				case 38: lineUp(); break;
				case 40: lineDown(); break;
				case 33: pageUp(); break;
				case 34: pageDown(); break;
				
			}
		}
		
		private function lineUp():void {
			scrollY -= 20;
		}
		
		private function lineDown():void {
			scrollY += 20;
		}
		
		private function pageUp():void {
			scrollY -= contentHeight
		}
		private function pageDown():void {
			scrollY += contentHeight;
		}
		
		/** @private */
		protected function checkScroll(event:Event = null):void {
			if(measuredWidth > contentWidth) {
				scrollX = (measuredWidth - contentWidth) * hScrollBar.value;
				hScrollBar.thumbSizePercentage = contentWidth / measuredWidth;
			} else {
				scrollX = 0;
				hScrollBar.value = 0;
			}
			if(measuredHeight > contentHeight) {
				scrollY = (measuredHeight - contentHeight) * vScrollBar.value;
				vScrollBar.thumbSizePercentage = contentHeight / measuredHeight;
			} else {
				scrollY = 0;
				vScrollBar.value = 0;
			}
		}
		
		/** The x scroll value for the container. This is the number of pixels that the content has been scrolled to the left */		
		[Bindable]
		public function get scrollX():Number {
			return _scrollX;
		}
		public function set scrollX(value:Number):void {
			_scrollX = value;
			hScrollBar.value = scrollX / (measuredWidth - contentWidth);
			invalidate();
		}
		
		/** The y scroll value for the container. This is the number of pixels that the content has been scrolled to the right */
		[Bindable]
		public function get scrollY():Number {
			return _scrollY;
		}
		public function set scrollY(value:Number):void {
			_scrollY = value;
			vScrollBar.value = _scrollY / (measuredHeight - contentHeight);
			invalidate();
		}
		
		/** @inheritDoc */
		override public function invalidateLayout(fromChild:Boolean=false):void {
			super.invalidateLayout(fromChild);
			manager.invalidateComponent(this);
			invalidated = true;
		}
		
		/** @inheritDoc */
		override public function validateLayout(e:Event=null):void {
			super.validateLayout(e);
			if(vScrollBar && hScrollBar) {
				vScrollBar.validateNow();
				hScrollBar.validateNow();
			
				hScrollBar.visible = measuredWidth > width;
				vScrollBar.visible = measuredHeight > height;
			
				hScrollBar.visible = measuredWidth > contentWidth;
				vScrollBar.visible = measuredHeight > contentHeight;

				hScrollBar.y = height - hScrollBar.height;
				hScrollBar.width = contentWidth;
			
				vScrollBar.x = width - vScrollBar.width;
				vScrollBar.height = contentHeight;
				checkScroll();
			}
		}
		
		/** The width of the content */
		public function get contentWidth():Number {
			return width - (vScrollBar.visible ? vScrollBar.width : 0);
		}
		
		/** The height of the content */
		public function get contentHeight():Number {
			return height - (hScrollBar.visible ? hScrollBar.height : 0);
		}
		
		/** @inheritDoc */
		override public function draw(width:Number, height:Number):void {
			super.draw(width, height);
		}
		
		/** @inheritDoc */
		override protected function applyMask(width:Number, height:Number):void {
			var inset:int = 0;
			if(_stroke) {
				inset = Math.ceil(_stroke.thickness/2);
			}
			childContainer.x = childContainer.y = inset;
			childContainer.scrollRect = new Rectangle(_scrollX, _scrollY, contentWidth-inset, contentHeight-inset);
		}
		
		/**
		 * Scrolls the view.
		 * @param The number of pixels to scroll the view right.
		 * @param The number of pixels to scroll the view down
		 * @param The duation of the scroll in seconds.
		 * @param Any options applicable for a Tween instance.
		 */		
		public function scrollTo(xTo:Number, yTo:Number, speed:Number, options:Object = null):void {
			new Tween(this, speed, {scrollX:xTo, scrollY:yTo}, options ? options : {});
		}
		
	}
}