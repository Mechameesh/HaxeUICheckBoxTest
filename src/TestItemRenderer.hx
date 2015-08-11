package;

import haxe.ui.toolkit.controls.CheckBox;
import haxe.ui.toolkit.controls.Text;
import haxe.ui.toolkit.core.renderers.ItemRenderer;
import haxe.ui.toolkit.events.UIEvent;
import haxe.ui.toolkit.layout.HorizontalLayout;

/**
 * ...
 * @author Michel de Brisis
 */
class TestItemRenderer extends ItemRenderer
{
	
	var aText:Text;
	var aCheckBox:CheckBox;
	var aDisabledCheckBox:CheckBox;

	public function new() 
	{
		super();			
		layout = new HorizontalLayout();	
		
		aText = new Text();
		aText.id = "aText";
		aText.percentWidth = 40;
		addChild(aText);
		
		aCheckBox = new CheckBox();
		aCheckBox.id = "aCheckBox";
		aCheckBox.addEventListener(UIEvent.CHANGE, setCheckBoxValue);
		aCheckBox.percentWidth = 20;
		addChild(aCheckBox);
		
		aDisabledCheckBox = new CheckBox();
		aDisabledCheckBox.id = "aDisabledCheckBox";
		aDisabledCheckBox.disabled = true;	//this style is overriden when you mouse over item because of recursive statecomponent styles in listview
		addChild(aDisabledCheckBox);
	}
	
	private function setCheckBoxValue(e:UIEvent):Void 
	{
		//has to be done manually because checkbox resolves to component in super class and only sets the text/value component without updating the selected property
		if (data != null && data.aCheckBox != aCheckBox.selected) {
			data.aCheckBox = aCheckBox.selected;			
			dispatchProxyEvent(UIEvent.COMPONENT_EVENT, e);
		}
	}
	
	override function set_data(value:Dynamic):Dynamic {
		
		//has to be done manually because checkbox resolves to component in super class and only sets the text/value component without updating the selected property
		if(aCheckBox.selected != value.aCheckBox)
			aCheckBox.selected = value.aCheckBox;
		
		if(aDisabledCheckBox.selected != value.aDisabledCheckBox)
			aDisabledCheckBox.selected = value.aDisabledCheckBox;
		
		var result:Dynamic = super.set_data(value);
		//checkbox text is automatically filled in super.set_data() so we remove it here. List has text-component header instead
		aCheckBox.text = "";
		aDisabledCheckBox.text = "";
		return result;		
	}
	
}