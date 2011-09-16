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

package com.flow.components.graphics {
	
	import com.flow.components.Component;
	import com.flow.components.graphics.fills.IFill;
	import com.flow.components.graphics.strokes.IStroke;
	
	[DefaultProperty("stroke")]
	public class Geometry extends Component {
		
		protected var _stroke:IStroke;
		protected var _fill:IFill;

		public function Geometry() {
			super();
		}

		public function get stroke():IStroke {
			return _stroke;
		}
		public function set stroke(value:IStroke):void {
			if(value != _stroke) {
				_stroke = value;
				invalidate();
			}
		}
			
		public function get fill():IFill {
			return _fill;
		}
		public function set fill(value:IFill):void  {
			if(value != _fill) {
				_fill = value;
				invalidate();
			}
		}
		
		override protected function checkVisibility():Boolean {
			return true;
		}
		
		override protected function draw(w:int, h:int):void {	
			graphics.clear();
			graphics.lineStyle(undefined);
			if (_stroke) {
				_stroke.beginDraw(graphics, w, h);
			}
			if (_fill) {
				_fill.beginDraw(graphics, w, h);
			}
		}
		
		public function endDraw():void  {
			if (_stroke) {
				_stroke.endDraw(graphics);
			}
			if (_fill) {
				_fill.endDraw(graphics);
			}
		}
	}
}