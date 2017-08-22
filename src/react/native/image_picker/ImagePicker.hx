package react.native.image_picker;

import haxe.io.Bytes;

@:jsRequire('react-native-image-picker')
extern class ImagePicker {
	public static function showImagePicker(option:ImagePickerOption, res:ImagePickerResponse->Void):Void;
	public static function launchImageLibrary(option:ImagePickerOption, res:ImagePickerResponse->Void):Void;
	public static function launchCamera(option:ImagePickerOption, res:ImagePickerResponse->Void):Void;
}

typedef ImagePickerOption = {
	?title:String,
	?cancelButtonTitle:String,
	?takePhotoButtonTitle:String,
	?chooseFromLibraryButtonTitle:String,
	?customButtons:Array<CustomButtonsOption>,
	?mediaType:MediaType,
	?maxWidth:Int,
	?maxHeight:Int,
	?quality:Int,
	?ImageQuality:String,
	?durationLimit:Int,
	?noData:Bool,
	#if ios
	?allowsEditing:Bool,
	?cameraType:CameraType,
	#elseif android
	?rotation:Int,
	#end
}

typedef ImagePickerResponse = {
	?didCancel:Bool,
	?error:Bool,
	?data:String, // base64
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
	var MImage = 'Image';
	#if ios
	var MMixed = 'mixed';
	#end
}