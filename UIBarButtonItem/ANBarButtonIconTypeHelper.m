//
//  ANBarButtonIconTypeHelper.m
//  Versoos
//
//  Created by Oksana Kovalchuk on 21/12/14.
//  Copyright (c) 2014 ANODA. All rights reserved.
//

#import "ANBarButtonIconTypeHelper.h"

NSString* imageNameByType(ANBarButtonType type)
{
    switch (type)
    {
        case ANBarButtonTypeClose:  return @"navbar_btn_close"; break;
        case ANBarButtonTypeAdd:    return @"navbar_btn_add"; break;
        case ANBarButtonTypeBack:   return @"navbar_btn_back"; break;
        case ANBarButtonTypeDone:   return @"navbar_btn_done"; break;
        case ANBarButtonTypeMenu:   return @"navbar_btn_menu_wide"; break;
        case ANBarButtonTypeRemove: return @"navbar_btn_remove"; break;
        case ANBarButtonTypeCall:   return @"navbar_btn_call"; break;
        case ANBarButtonTypeEdit:   return @"navbar_btn_edit"; break;
        case ANBarButtonTypeNext:   return @"navbar_btn_next"; break;
        case ANBarButtonTypeSearch: return @"navbar_btn_search"; break;
        case ANBarButtonTypeMore:   return @"navbar_btn_more"; break;
        default: return @""; break;
    }
}

