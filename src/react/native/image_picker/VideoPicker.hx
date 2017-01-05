package react.native.image_picker;

import haxe.io.Bytes;

@:jsRequire('react-native-image-picker')
extern class VideoPicker {
	public static function launchImageLibrary(option:VideoPickerOption, res:VideoPickerResponse->Void):Void;
	public static function launchCamera(option:VideoPickerOption, res:VideoPickerResponse->Void):Void;
}

typedef VideoPickerOption = {
	?title:String,
	?cancelButtonTitle:String,
	?takePhotoButtonTitle:String,
	?chooseFromLibraryButtonTitle:String,
	?customButtons:Array<CustomButtonsOption>,
	?mediaType:MediaType,
	?maxWidth:Int,
	?maxHeight:Int,
	?quality:Int,
	?videoQuality:String,
	?durationLimit:Int,
	?noData:Bool,
	#if ios
	?allowsEditing:Bool,
	?cameraType:CameraType,
	#elseif android
	?rotation:Int,
	#end
}

typedef VideoPickerResponse = {
	?didCancel:Bool,
	?error:Bool,
	?data:Bytes,
	?uri:String,
	?isVertical:Bool,
	?width:Int,
	?height:Int,
	#if ios
	?origURL:String,
	#elseif android
	?fileSize:Int,
	?fileName:String,
	?path:String,
	?latitude:Float,
	?longitude:Float,
	?timestamp:String,
	#end
}

typedef CustomButtonsOption = {
	name:String,
	title:String,
}

@:enum
abstract CameraType(String) {
	var Front = 'front';
	var Back = 'back';
}

@:enum
abstract MediaType(String) {
	var MPhoto = 'photo';
	var MVideo = 'video';
	#if ios
	var MMixed = 'mixed';
	#end
}