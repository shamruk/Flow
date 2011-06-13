
/**
 *  Generated by mxmlc 4.0
 *
 *  Package:    com.flow.view
 *  Class:      TransitionsView
 *  Source:     /Users/artman/Documents/Flow/examples/src/com/flow/view/TransitionsView.mxml
 *  Template:   flex2/compiler/mxml/gen/ClassDef.vm
 *  Time:       2011.06.13 16:48:27 EEST
 */

package com.flow.view
{

import com.flow.components.Button;
import com.flow.components.Label;
import com.flow.containers.Container;
import com.flow.containers.HBox;
import com.flow.containers.VBox;
import com.flow.containers.layout.VBoxLayout;
import com.flow.effects.BevelEffect;
import com.flow.effects.BlurEffect;
import com.flow.effects.ChihulyEffect;
import com.flow.effects.transitions.EffectTransition;
import com.flow.graphics.Image;
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



//  begin class def
public class TransitionsView
    extends com.flow.containers.Container
    implements mx.binding.IBindingClient
{

    //  instance variables
/**
 * @private
 **/
    public var _TransitionsView_Button1 : com.flow.components.Button;

/**
 * @private
 **/
    public var _TransitionsView_Button2 : com.flow.components.Button;

    [Bindable]
	/**
 * @private
 **/
    public var postcard : com.flow.graphics.Image;

    [Bindable]
	/**
 * @private
 **/
    public var postcard2 : com.flow.graphics.Image;


    //  type-import dummies



    //  constructor (non-Flex display object)
    /**
     * @private
     **/
    public function TransitionsView()
    {
        super();










        var bindings:Array = _TransitionsView_bindingsSetup();
        var watchers:Array = [];

        var target:Object = this;

        if (_watcherSetupUtil == null)
        {
            var watcherSetupUtilClass:Object = getDefinitionByName("_com_flow_view_TransitionsViewWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
        }

        _watcherSetupUtil.setup(this,
                    function(propertyName:String):* { return target[propertyName]; },
                    function(propertyName:String):* { return TransitionsView[propertyName]; },
                    bindings,
                    watchers);

        mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
        mx_internal::_watchers = mx_internal::_watchers.concat(watchers);



        // our style settings



        // layer initializers

       
        // properties
        this.width = 500;
        this.height = 320;
        this.children = _TransitionsView_Container2_c();


        // events


        for (var i:uint = 0; i < bindings.length; i++)
        {
            Binding(bindings[i]).execute();
        }




    }


    //  scripts
    //  <Script>, line 29 - 35

			import assets.Postcard;
			
			import com.flow.skins.ButtonSkin;
			import com.flow.skins.CheckboxSkin;
			import com.flow.skins.TextInputSkin;
		

    //  end scripts


    //  supporting function definitions for properties, events, styles, effects
private function _TransitionsView_Container2_c() : com.flow.containers.Container
{
	var temp : com.flow.containers.Container = new com.flow.containers.Container();
	temp.layout = _TransitionsView_VBoxLayout1_c();
	temp.children = [_TransitionsView_Label1_c(), _TransitionsView_HBox1_c()];
	return temp;
}

private function _TransitionsView_VBoxLayout1_c() : com.flow.containers.layout.VBoxLayout
{
	var temp : com.flow.containers.layout.VBoxLayout = new com.flow.containers.layout.VBoxLayout();
	temp.spacing = 10;
	temp.horizontalAlign = "left";
	temp.padding = 10;
	return temp;
}

private function _TransitionsView_Label1_c() : com.flow.components.Label
{
	var temp : com.flow.components.Label = new com.flow.components.Label();
	temp.width = 480;
	temp.text = "Flow supports easy setup of transitions to tween components into view";
	temp.left = 10;
	temp.right = 10;
	temp.multiline = true;
	return temp;
}

private function _TransitionsView_HBox1_c() : com.flow.containers.HBox
{
	var temp : com.flow.containers.HBox = new com.flow.containers.HBox();
	temp.spacing = 5;
	temp.children = [_TransitionsView_VBox1_c(), _TransitionsView_VBox2_c()];
	return temp;
}

private function _TransitionsView_VBox1_c() : com.flow.containers.VBox
{
	var temp : com.flow.containers.VBox = new com.flow.containers.VBox();
	temp.spacing = 10;
	temp.horizontalAlign = "center";
	temp.width = 220;
	temp.children = [_TransitionsView_Button1_i(), _TransitionsView_Image1_i()];
	return temp;
}

private function _TransitionsView_Button1_i() : com.flow.components.Button
{
	var temp : com.flow.components.Button = new com.flow.components.Button();
	temp.label = "Toggle postcard";
	temp.verticalCenter = 0;
	temp.left = 8;
	temp.addEventListener("click", ___TransitionsView_Button1_click);
	_TransitionsView_Button1 = temp;
	mx.binding.BindingManager.executeBindings(this, "_TransitionsView_Button1", _TransitionsView_Button1);
	return temp;
}

/**
 * @private
 **/
public function ___TransitionsView_Button1_click(event:flash.events.MouseEvent):void
{
	postcard.active = !postcard.active
}

private function _TransitionsView_Image1_i() : com.flow.graphics.Image
{
	var temp : com.flow.graphics.Image = new com.flow.graphics.Image();
	temp.active = false;
	temp.transition = _TransitionsView_EffectTransition1_c();
	postcard = temp;
	mx.binding.BindingManager.executeBindings(this, "postcard", postcard);
	return temp;
}

private function _TransitionsView_EffectTransition1_c() : com.flow.effects.transitions.EffectTransition
{
	var temp : com.flow.effects.transitions.EffectTransition = new com.flow.effects.transitions.EffectTransition();
	temp.speed = 2;
	temp.effect = _TransitionsView_ChihulyEffect1_c();
	return temp;
}

private function _TransitionsView_ChihulyEffect1_c() : com.flow.effects.ChihulyEffect
{
	var temp : com.flow.effects.ChihulyEffect = new com.flow.effects.ChihulyEffect();
	temp.children = new <com.flow.effects.Effect>[_TransitionsView_BevelEffect1_c()];
	return temp;
}

private function _TransitionsView_BevelEffect1_c() : com.flow.effects.BevelEffect
{
	var temp : com.flow.effects.BevelEffect = new com.flow.effects.BevelEffect();
	temp.bevelQuality = 2;
	temp.blurX = 4;
	temp.blurY = 4;
	temp.distance = 1;
	temp.strength = 10;
	temp.highlightAlpha = 1;
	temp.shadowAlpha = 1;
	return temp;
}

private function _TransitionsView_VBox2_c() : com.flow.containers.VBox
{
	var temp : com.flow.containers.VBox = new com.flow.containers.VBox();
	temp.spacing = 10;
	temp.horizontalAlign = "center";
	temp.width = 220;
	temp.children = [_TransitionsView_Button2_i(), _TransitionsView_Image2_i()];
	return temp;
}

private function _TransitionsView_Button2_i() : com.flow.components.Button
{
	var temp : com.flow.components.Button = new com.flow.components.Button();
	temp.label = "Toggle postcard";
	temp.verticalCenter = 0;
	temp.left = 8;
	temp.addEventListener("click", ___TransitionsView_Button2_click);
	_TransitionsView_Button2 = temp;
	mx.binding.BindingManager.executeBindings(this, "_TransitionsView_Button2", _TransitionsView_Button2);
	return temp;
}

/**
 * @private
 **/
public function ___TransitionsView_Button2_click(event:flash.events.MouseEvent):void
{
	postcard2.active = !postcard2.active
}

private function _TransitionsView_Image2_i() : com.flow.graphics.Image
{
	var temp : com.flow.graphics.Image = new com.flow.graphics.Image();
	temp.active = false;
	temp.transition = _TransitionsView_EffectTransition2_c();
	postcard2 = temp;
	mx.binding.BindingManager.executeBindings(this, "postcard2", postcard2);
	return temp;
}

private function _TransitionsView_EffectTransition2_c() : com.flow.effects.transitions.EffectTransition
{
	var temp : com.flow.effects.transitions.EffectTransition = new com.flow.effects.transitions.EffectTransition();
	temp.speed = 2;
	temp.effect = _TransitionsView_BlurEffect1_c();
	return temp;
}

private function _TransitionsView_BlurEffect1_c() : com.flow.effects.BlurEffect
{
	var temp : com.flow.effects.BlurEffect = new com.flow.effects.BlurEffect();
	temp.blurX = 100;
	temp.blurY = 100;
	temp.blurQuality = 2;
	return temp;
}


    //  binding mgmt
    private function _TransitionsView_bindingsSetup():Array
    {
        var result:Array = [];

        result[0] = new mx.binding.Binding(this,
            function():mx.core.IFactory
            {

                return (new ButtonSkin);
            },
            null,
            "_TransitionsView_Button1.skinClass"
            );

        result[1] = new mx.binding.Binding(this,
            function():*
            {

                return (Postcard);
            },
            null,
            "postcard.source"
            );

        result[2] = new mx.binding.Binding(this,
            function():mx.core.IFactory
            {

                return (new ButtonSkin);
            },
            null,
            "_TransitionsView_Button2.skinClass"
            );

        result[3] = new mx.binding.Binding(this,
            function():*
            {

                return (Postcard);
            },
            null,
            "postcard2.source"
            );


        return result;
    }


    /**
     * @private
     **/
    public static function set watcherSetupUtil(watcherSetupUtil:IWatcherSetupUtil2):void
    {
        (TransitionsView)._watcherSetupUtil = watcherSetupUtil;
    }

    private static var _watcherSetupUtil:IWatcherSetupUtil2;



    //  embed carrier vars
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
