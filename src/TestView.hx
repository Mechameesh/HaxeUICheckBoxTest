package;

import haxe.ui.toolkit.core.XMLController;
import haxe.ui.toolkit.events.UIEvent;

/**
 * ...
 * @author Michel de Brisis
 */
@:build(haxe.ui.toolkit.core.Macros.buildController("layout/testview.xml"))
class TestView extends XMLController
{

	public function new() 
	{			
		testList.itemRenderer = TestItemRenderer;		
		testList.addEventListener(UIEvent.COMPONENT_EVENT, onComponentEvent);
		populateListData();
		
	}
	
	public function populateListData() {
		for (i in 0 ... 10) {		
			testList.dataSource.add( { aText: "Text" + i, aCheckBox: (i % 2 == 0), aDisabledCheckBox: true } );
		}
	}
	
	function onComponentEvent(e:UIEvent)
	{		
		output.text = e.data.aText + " -> new checkbox value: " + e.data.aCheckBox;
	}
	
}