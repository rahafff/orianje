import 'package:oringe/consts/role_status.dart';
import 'package:oringe/generated/l10n.dart';
import 'package:flutter/material.dart';

class StatusRoleHelper {
  static RoleEnum getStatusEnum(String? status) {
    if (status == 'ROLE_OWNER') {
      return RoleEnum.STORE_OWNER;
    } else if (status == 'ROLE_SUPER_ADMIN') {
      return RoleEnum.SUPER_ADMIN;
    } else if (status == 'ROLE_ADMIN') {
      return RoleEnum.ADMIN;
    } else if (status == 'ROLE_CAPTAIN') {
      return RoleEnum.CAPTAIN;
    }
    return RoleEnum.CAPTAIN;
  }

  static Color getRoleColor(RoleEnum status) {
    switch (status) {
      case RoleEnum.ADMIN:
        return Colors.blue.shade50;
      case RoleEnum.SUPER_ADMIN:
        return Colors.red.shade50;
      case RoleEnum.CAPTAIN:
        return Colors.yellow.shade50;
      case RoleEnum.STORE_OWNER:
        return Colors.green.shade50;
      default:
        return Colors.red;
    }
  }
  static String getEnumStatus(RoleEnum? orderStatus) {
    switch (orderStatus) {
      case RoleEnum.STORE_OWNER:
        return 'ROLE_OWNER';
      case RoleEnum.ADMIN:
        return 'ROLE_ADMIN';
      case RoleEnum.SUPER_ADMIN:
        return 'ROLE_SUPER_ADMIN';
      case RoleEnum.CAPTAIN:
        return 'ROLE_CAPTAIN';
      default:
        return '';
    }
  }
}
