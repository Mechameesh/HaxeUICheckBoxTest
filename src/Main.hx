package;

import haxe.ui.toolkit.core.Root;
import haxe.ui.toolkit.core.Toolkit;
import haxe.ui.toolkit.themes.GradientTheme;
import openfl.display.Sprite;
import openfl.Lib;

/**
 * ...
 * @author Michel de Brisis
 */
class Main extends Sprite 
{

	public function new() 
	{
		super();
		Toolkit.theme = new GradientTheme();
		Toolkit.init();						
		Toolkit.openFullscreen(function(root:Root) {
			root.addChild(new TestView().view);
		});
	}

}
