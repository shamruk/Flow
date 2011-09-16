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
	import com.flow.containers.layout.HBoxLayout;
	import com.flow.containers.layout.LayoutBase;
	
	public class HBox extends Container {
		
		public function HBox() {
			super();
		}
		
		final override protected function getDefaultLayout():LayoutBase {
			return new HBoxLayout();
		}
		
		final override public function set layout(value:LayoutBase):void {
			throw new Error("Cannot set layout on HBox");
		}
		
		public function get spacing():Number {
			return (_layout as HBoxLayout).spacing;
		}
		public function set spacing(value:Number):void {
			(_layout as HBoxLayout).spacing = value;
		}
		
		[Inspectable(enumeration="top,middle,bottom,none", defaultValue="middle")]
		public function get verticalAlign():String {
			return (_layout as HBoxLayout).verticalAlign;
		}
		public function set verticalAlign(value:String):void {
			(_layout as HBoxLayout).verticalAlign = value;
		}
		
		[Inspectable(enumeration="left,center,right", defaultValue="left")]
		public function get horizontalAlign():String {
			return (_layout as HBoxLayout).horizontalAlign;
		}
		public function set horizontalAlign(value:String):void {
			(_layout as HBoxLayout).horizontalAlign = value;
		}
		
		[Inspectable(enumeration="normal,inverted", defaultValue="normal")]
		public function get zSort():String {
			return (_layout as HBoxLayout).zSort;
		}
		public function set zSort(value:String):void {
			(_layout as HBoxLayout).zSort = value;
		}
		
		public function get inverted():Boolean {
			return (_layout as HBoxLayout).inverted;
		}
		public function set inverted(value:Boolean):void {
			(_layout as HBoxLayout).inverted = value;
		}
	}
}