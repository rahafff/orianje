import 'package:oringe/consts/field_type.dart';

class FiledTypeHelper {
  static FiledTypeEnum getTypeEnum(String? status) {
    if (status == 'academic_stage') {
      return FiledTypeEnum.ACADEMIC_STAGE;
    } else if (status == 'support_type') {
      return FiledTypeEnum.SUPPORT_TYPE;
    } else if (status == 'student_type') {
      return FiledTypeEnum.STUDENT_TYPE;
    } else if (status == 'number') {
      return FiledTypeEnum.NUMBER;
    } else if (status == 'text') {
      return FiledTypeEnum.TEXT;
    } else if (status == 'date') {
      return FiledTypeEnum.DATE;
    } else if (status == 'select') {
      return FiledTypeEnum.SELECT;
    } else if (status == 'class_group') {
      return FiledTypeEnum.CLASS_GROUP;
    } else if (status == 'class') {
      return FiledTypeEnum.CLASS;
    } else if (status == 'section') {
      return FiledTypeEnum.SECTION;
    } else if (status == 'year') {
      return FiledTypeEnum.YEAR;
    }else if (status == 'uploader') {
      return FiledTypeEnum.UPLOADER;
    }
    return FiledTypeEnum.YEAR;
  }

  static ParsTypeEnum getParsObject(FiledTypeEnum typeEnum) {
    switch (typeEnum) {
      case FiledTypeEnum.ACADEMIC_STAGE:
      case FiledTypeEnum.CLASS_GROUP:
      case FiledTypeEnum.CLASS:
      case FiledTypeEnum.SECTION:
      case FiledTypeEnum.SUPPORT_TYPE:
      case FiledTypeEnum.STUDENT_TYPE:
      case FiledTypeEnum.CITIES:
        return ParsTypeEnum.SELECT_OBJECT;

      case FiledTypeEnum.SELECT:
      case FiledTypeEnum.YEAR:
         return ParsTypeEnum.LIST_STRING;

      case FiledTypeEnum.DATE:
      case FiledTypeEnum.TEXT:
      case FiledTypeEnum.NUMBER:
      case FiledTypeEnum.MOBILE:
        return ParsTypeEnum.VALUE;


      case FiledTypeEnum.UPLOADER:
        return ParsTypeEnum.UPLOADER;

      default:
        return ParsTypeEnum.VALUE;
    }
  }


  static ParsValueEnum getParsValue (FiledTypeEnum typeEnum) {
    switch (typeEnum) {
      case FiledTypeEnum.ACADEMIC_STAGE:
      case FiledTypeEnum.CLASS_GROUP:
      case FiledTypeEnum.CLASS:
      case FiledTypeEnum.SECTION:
      case FiledTypeEnum.SUPPORT_TYPE:
      case FiledTypeEnum.STUDENT_TYPE:
      case FiledTypeEnum.CITIES:
      case FiledTypeEnum.SELECT:
      case FiledTypeEnum.YEAR:
      case FiledTypeEnum.DATE:
      case FiledTypeEnum.TEXT:
      case FiledTypeEnum.NUMBER:
      case FiledTypeEnum.MOBILE:
      return ParsValueEnum.VALUE_OBJECT;


      case FiledTypeEnum.UPLOADER:
        return ParsValueEnum.LIST_STRING_UPLOADER;
      default:
        return ParsValueEnum.VALUE_OBJECT;
    }
  }
}
