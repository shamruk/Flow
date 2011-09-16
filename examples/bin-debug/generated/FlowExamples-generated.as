
/**
 *  Generated by mxmlc 4.0
 *
 *  Package:    
 *  Class:      FlowExamples
 *  Source:     /Users/artman/Documents/Flow/examples/src/FlowExamples.mxml
 *  Template:   flex2/compiler/mxml/gen/ClassDef.vm
 *  Time:       2011.06.14 11:20:55 EEST
 */

package 
{

import FlowExamplesInnerClass0;
import com.flow.components.Button;
import com.flow.components.Label;
import com.flow.containers.Application;
import com.flow.containers.Container;
import com.flow.containers.List;
import com.flow.containers.ScrollArea;
import com.flow.containers.layout.HBoxLayout;
import com.flow.graphics.Image;
import com.flow.graphics.fills.BitmapFill;
import com.flow.view.BasicLayoutView;
import com.flow.view.BoxLayout;
import com.flow.view.ControlsView;
import com.flow.view.ScrollingView;
import com.flow.view.TransitionsView;
import flash.accessibility.*;
import flash.debugger.*;
import flash.display.*;
import flash.errors.*;
import flash.events.*;
import flash.events.MouseEvent;
import flash.external.*;
import flash.geom.*;
import flash.media.*;
import flash.net.*;
import flash.printing.*;
import flash.profiler.*;
import flash.system.*;
import flash.text.*;
import flash.ui.*;
import flash.utils.*;
import flash.xml.*;
import mx.binding.*;
import mx.binding.IBindingClient;
import mx.core.ClassFactory;
import mx.core.DeferredInstanceFromClass;
import mx.core.DeferredInstanceFromFunction;
import mx.core.IDeferredInstance;
import mx.core.IFactory;
import mx.core.IFlexModuleFactory;
import mx.core.IPropertyChangeNotifier;
import mx.core.mx_internal;
import mx.filters.*;
import mx.styles.*;


[SWF( frameRate='45')]

//  begin class def
public class FlowExamples
    extends com.flow.containers.Application
    implements mx.binding.IBindingClient
{

    //  instance variables
/**
 * @private
 **/
    public var _FlowExamples_Image1 : com.flow.graphics.Image;

/**
 * @private
 **/
    public var _FlowExamples_Label1 : com.flow.components.Label;

    [Bindable]
	/**
 * @private
 **/
    public var next : com.flow.components.Button;

    [Bindable]
	/**
 * @private
 **/
    public var prev : com.flow.components.Button;

    [Bindable]
	/**
 * @private
 **/
    public var section : com.flow.containers.ScrollArea;

    [Bindable]
	/**
 * @private
 **/
    public var sectionCounter : com.flow.containers.List;

    [Bindable]
	/**
 * @private
 **/
    public var segmentTitles : Array;


    //  type-import dummies



    //  constructor (non-Flex display object)
    /**
     * @private
     **/
    public function FlowExamples()
    {
        super();










        var bindings:Array = _FlowExamples_bindingsSetup();
        var watchers:Array = [];

        var target:Object = this;

        if (_watcherSetupUtil == null)
        {
            var watcherSetupUtilClass:Object = getDefinitionByName("_FlowExamplesWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
        }

        _watcherSetupUtil.setup(this,
                    function(propertyName:String):* { return target[propertyName]; },
                    function(propertyName:String):* { return FlowExamples[propertyName]; },
                    bindings,
                    watchers);

        mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
        mx_internal::_watchers = mx_internal::_watchers.concat(watchers);



        // our style settings



        // layer initializers

       
        // properties
        this.fill = _FlowExamples_BitmapFill1_c();
        this.children = _FlowExamples_Container1_c();
        _FlowExamples_Array1_i();


        // events


        for (var i:uint = 0; i < bindings.length; i++)
        {
            Binding(bindings[i]).execute();
        }




    }


    //  scripts
    //  <Script>, line 30 - 60

			import assets.WindowBkg;
			
			import com.flow.commands.InitApplicationCommand;
			import com.flow.managers.TextFormatManager;
			import com.flow.skins.ButtonSkin;
			import com.flow.skins.TextInputSkin;
			
			import flash.filters.DropShadowFilter;
			import flash.net.navigateToURL;
			
			import mx.utils.ObjectProxy;
			
			override protected function preInitialize():void {
				new InitApplicationCommand();
				
				var contextMenu:ContextMenu = new ContextMenu();
				
				var viewSource:ContextMenuItem = new ContextMenuItem("View Source", true);
				viewSource.addEventListener(ContextMenuEvent.MENU_ITEM_SELECT, openViewSource);
				contextMenu.customItems.push(viewSource);
				contextMenu.hideBuiltInItems();
				this.contextMenu = contextMenu;
				
			}

			protected function openViewSource(event:ContextMenuEvent):void {
				navigateToURL(new URLRequest("https://github.com/artman/Flow/tree/master/examples/src"), "_blank");
			}
			
		

    //  end scripts


    //  supporting function definitions for properties, events, styles, effects
private function _FlowExamples_Array1_i() : Array
{
	var temp : Array = ["Absolute layout", "Box layout", "Components", "Transitions", "Scroll container"];
	segmentTitles = temp;
	mx.binding.BindingManager.executeBindings(this, "segmentTitles", segmentTitles);
	return temp;
}

private function _FlowExamples_BitmapFill1_c() : com.flow.graphics.fills.BitmapFill
{
	var temp : com.flow.graphics.fills.BitmapFill = new com.flow.graphics.fills.BitmapFill();
	temp.source = _embed_mxml__assets_app_bkg_png_1811369699;
	return temp;
}

private function _FlowExamples_Container1_c() : com.flow.containers.Container
{
	var temp : com.flow.containers.Container = new com.flow.containers.Container();
	temp.horizontalCenter = 0;
	temp.verticalCenter = 0;
	temp.children = [_FlowExamples_Image1_i(), _FlowExamples_Label1_i(), _FlowExamples_ScrollArea1_i(), _FlowExamples_Container2_c()];
	return temp;
}

private function _FlowExamples_Image1_i() : com.flow.graphics.Image
{
	var temp : com.flow.graphics.Image = new com.flow.graphics.Image();
	temp.left = -1;
	temp.right = -2;
	temp.percentHeight = 100.0;
	_FlowExamples_Image1 = temp;
	mx.binding.BindingManager.executeBindings(this, "_FlowExamples_Image1", _FlowExamples_Image1);
	return temp;
}

private function _FlowExamples_Label1_i() : com.flow.components.Label
{
	var temp : com.flow.components.Label = new com.flow.components.Label();
	temp.textFormat = "heading";
	temp.x = 10;
	temp.y = 2;
	_FlowExamples_Label1 = temp;
	mx.binding.BindingManager.executeBindings(this, "_FlowExamples_Label1", _FlowExamples_Label1);
	return temp;
}

private function _FlowExamples_ScrollArea1_i() : com.flow.containers.ScrollArea
{
	var temp : com.flow.containers.ScrollArea = new com.flow.containers.ScrollArea();
	temp.scrollSpeed = 0.5;
	temp.snapToEventWidth = true;
	temp.snapToEventHeight = true;
	temp.top = 37;
	temp.bottom = 38;
	temp.children = [_FlowExamples_BasicLayoutView1_c(), _FlowExamples_BoxLayout1_c(), _FlowExamples_ControlsView1_c(), _FlowExamples_TransitionsView1_c(), _FlowExamples_ScrollingView1_c()];
	section = temp;
	mx.binding.BindingManager.executeBindings(this, "section", section);
	return temp;
}

private function _FlowExamples_BasicLayoutView1_c() : com.flow.view.BasicLayoutView
{
	var temp : com.flow.view.BasicLayoutView = new com.flow.view.BasicLayoutView();
	return temp;
}

private function _FlowExamples_BoxLayout1_c() : com.flow.view.BoxLayout
{
	var temp : com.flow.view.BoxLayout = new com.flow.view.BoxLayout();
	return temp;
}

private function _FlowExamples_ControlsView1_c() : com.flow.view.ControlsView
{
	var temp : com.flow.view.ControlsView = new com.flow.view.ControlsView();
	return temp;
}

private function _FlowExamples_TransitionsView1_c() : com.flow.view.TransitionsView
{
	var temp : com.flow.view.TransitionsView = new com.flow.view.TransitionsView();
	return temp;
}

private function _FlowExamples_ScrollingView1_c() : com.flow.view.ScrollingView
{
	var temp : com.flow.view.ScrollingView = new com.flow.view.ScrollingView();
	return temp;
}

private function _FlowExamples_Container2_c() : com.flow.containers.Container
{
	var temp : com.flow.containers.Container = new com.flow.containers.Container();
	temp.percentWidth = 100.0;
	temp.height = 40;
	temp.bottom = 0;
	temp.children = [_FlowExamples_List1_i(), _FlowExamples_Button1_i(), _FlowExamples_Button2_i()];
	return temp;
}

private function _FlowExamples_List1_i() : com.flow.containers.List
{
	var temp : com.flow.containers.List = new com.flow.containers.List();
	temp.percentWidth = 100.0;
	temp.height = 20;
	temp.verticalCenter = 0;
	temp.selectedIndex = 0;
	temp.layout = _FlowExamples_HBoxLayout1_c();
	temp.itemRenderer = _FlowExamples_ClassFactory1_c();
	sectionCounter = temp;
	mx.binding.BindingManager.executeBindings(this, "sectionCounter", sectionCounter);
	return temp;
}

private function _FlowExamples_HBoxLayout1_c() : com.flow.containers.layout.HBoxLayout
{
	var temp : com.flow.containers.layout.HBoxLayout = new com.flow.containers.layout.HBoxLayout();
	temp.spacing = 5;
	temp.horizontalAlign = "center";
	temp.verticalAlign = "middle";
	return temp;
}

private function _FlowExamples_ClassFactory1_c() : mx.core.ClassFactory
{
	var temp : mx.core.ClassFactory = new mx.core.ClassFactory();
	temp.generator = FlowExamplesInnerClass0;
	temp.properties = {outerDocument: this};
	return temp;
}

private function _FlowExamples_Button1_i() : com.flow.components.Button
{
	var temp : com.flow.components.Button = new com.flow.components.Button();
	temp.label = "Prev";
	temp.verticalCenter = 0;
	temp.left = 8;
	temp.addEventListener("click", __prev_click);
	prev = temp;
	mx.binding.BindingManager.executeBindings(this, "prev", prev);
	return temp;
}

/**
 * @private
 **/
public function __prev_click(event:flash.events.MouseEvent):void
{
	sectionCounter.selectedIndex--
}

private function _FlowExamples_Button2_i() : com.flow.components.Button
{
	var temp : com.flow.components.Button = new com.flow.components.Button();
	temp.label = "Next";
	temp.verticalCenter = 0;
	temp.right = 8;
	temp.addEventListener("click", __next_click);
	next = temp;
	mx.binding.BindingManager.executeBindings(this, "next", next);
	return temp;
}

/**
 * @private
 **/
public function __next_click(event:flash.events.MouseEvent):void
{
	sectionCounter.selectedIndex++
}


    //  binding mgmt
    private function _FlowExamples_bindingsSetup():Array
    {
        var result:Array = [];

        result[0] = new mx.binding.Binding(this,
            function():Array
            {
                var result:* = ([new DropShadowFilter(6, 90, 0, 0.3, 20, 20, 1, 2)]);
                return ((result == null) || (result is Array) || (result is flash.utils.Proxy) ? result : [result]);
            },
            null,
            "_FlowExamples_Image1.filters"
            );

        result[1] = new mx.binding.Binding(this,
            function():*
            {

                return (WindowBkg);
            },
            null,
            "_FlowExamples_Image1.source"
            );

        result[2] = new mx.binding.Binding(this,
            function():String
            {
                var result:* = (sectionCounter.selectedItem);
                return (result == undefined ? null : String(result));
            },
            null,
            "_FlowExamples_Label1.text"
            );

        result[3] = new mx.binding.Binding(this,
            function():Array
            {
                var result:* = ([new DropShadowFilter(1, 90, 0, 0.2, 2, 2)]);
                return ((result == null) || (result is Array) || (result is flash.utils.Proxy) ? result : [result]);
            },
            null,
            "_FlowExamples_Label1.filters"
            );

        result[4] = new mx.binding.Binding(this,
            function():int
            {

                return (sectionCounter.selectedIndex);
            },
            null,
            "section.selectedIndex"
            );

        result[5] = new mx.binding.Binding(this,
            null,
            null,
            "sectionCounter.dataProvider"
            , "segmentTitles");

        result[6] = new mx.binding.Binding(this,
            function():Boolean
            {

                return (sectionCounter.selectedIndex==0);
            },
            null,
            "prev.disabled"
            );

        result[7] = new mx.binding.Binding(this,
            function():Boolean
            {

                return (sectionCounter.selectedIndex == sectionCounter.dataProvider.length-1);
            },
            null,
            "next.disabled"
            );


        return result;
    }


    /**
     * @private
     **/
    public static function set watcherSetupUtil(watcherSetupUtil:IWatcherSetupUtil2):void
    {
        (FlowExamples)._watcherSetupUtil = watcherSetupUtil;
    }

    private static var _watcherSetupUtil:IWatcherSetupUtil2;



    //  embed carrier vars
[Embed(source='/assets/app_bkg.png')]
 private var _embed_mxml__assets_app_bkg_png_1811369699:Class;

    //  end embed carrier vars

    //  binding management vars
    /**
     * @private
     **/
    mx_internal var _bindings : Array = [];
    /**
     * @private
     **/
    mx_internal var _watchers : Array = [];
    /**
     * @private
     **/
    mx_internal var _bindingsByDestination : Object = {};
    /**
     * @private
     **/
    mx_internal var _bindingsBeginWithWord : Object = {};

//  end class def
}

//  end package def
}