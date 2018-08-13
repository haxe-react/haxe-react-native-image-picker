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
	#if ios ?cameraType:CameraType, #end
	?mediaType:MediaType,
	?maxWidth:Int,
	?maxHeight:Int,
	?quality:Float,
	?videoQuality:VideoQuality,
	?durationLimit:Float,
	#if android ?rotation:Float, #end
	#if ios ?allowsEditing:Bool, #end
	?noData:Bool,
	?storageOptions:StorageOption,
	?permissionDenied:{},
}

typedef ImagePickerResponse = {
	?didCancel:Bool,
	?error:String,
	?customButton:String,
	?data:String,
	?uri:String,
	#if ios ?origURL:String, #end
	?isVertical:Bool,
	?width:Int,
	?height:Int,
	?fileSize:Int,
	#if android ?type:String, #end
	?fileName:String,
	#if android ?path:String, #end
	?latitude:Float,
	?longitude:Float,
	?timestamp:String,
	#if android ?originalRotation:Int, #end
}

typedef CustomButtonsOption = {
	name:String,
	title:String,
}

typedef StorageOption = {
	#if ios ?skipBackup:Bool, #end
	#if ios ?path:String, #end
	?cameraRoll:Bool,
	#if ios ?waitUntilSaved:Bool, #end
}

typedef PermissionDeniedOption = {
	?title:String,
	?text:String,
	?reTryTitle:String,
	?okTitle:String,
}

@:enum
abstract CameraType(String) {
	var Front = 'front';
	var Back = 'back';
}

@:enum
abstract VideoQuality(String) {
	var Low = 'low';
	#if ios var Medium = 'medium'; #end
	var High = 'high';
}



@:enum
abstract MediaType(String) {
	var Photo = 'photo';
	var Video = 'video';
	#if ios var Mixed = 'mixed'; #end
}