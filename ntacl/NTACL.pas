// ****************************************************************************
// *                                                                          *
// *  This Unit/ library for Borland Delphi should simplify the               *
// *  modification of Microsoft Windows Access Control Lists (ACL).           *
// *                                                                          *
// *                                                                          *
// *  Version 0.02                                                            *
// *  Copyright (C) 2002 Christian Exner (chris@cex-development.de)           *
// *                                                                          *
// *                                                                          *
// *  This source file is free software; you can redistribute it and/or       *
// *  modify it under the terms of the GNU General Public License as          *
// *  published by the Free Software Foundation; either version 2 of          *
// *  the License, or (at your option) any later version.                     *
// *                                                                          *
// *  This source file is distributed in the hope that it will be             *
// *  useful, but WITHOUT ANY WARRANTY; without even the implied              *
// *  warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.        *
// *  See the GNU General Public License for more details.                    *
// *                                                                          *
// *  You should have received a copy of the GNU General Public License       *
// *  along with this source file; if not, write to the Free Software         *
// *  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA                *
// *  02111-1307  USA                                                         *
// *                                                                          *
// ****************************************************************************

// ****************************************************************************
// *									      *
// *  NOTICE:								      *
// *  ~~~~~~~								      *
// *									      *
// *  I know, some of the source below could be written much better           *
// *  but for now i'am happy that it works. I saw that modifying              *
// *  Microsoft Windows Object-ACL's ist a little bit more complicated        *
// *  then just writing "Hello world..."                                      *
// *									      *
// *  If you have good extensions, reworks,... for this source, please        *
// *  let me now about so i could merge it into the source file.              *
// *                                                                          *
// *                                                           Chris ;-)      *
// *									      *
// ****************************************************************************

// ****************************************************************************
// *
// *  History:
// *  ~~~~~~~~
// *
// *  v0.01  2002-10-16  ce  - I don't believe, but it works for the first time :-)
// *                         - Only "GrantAccessByName" implemented for now.
// *
// *  v0.02  2002-10-16  ce  - Removed any trash from development of v0.01
// *                         - "RevokeAccessByName" implemented
// *                         - "DenyAccessByName" implemented
// *
// *
// ****************************************************************************

unit NTACL;

{$ALIGN 4}

interface

uses
  Windows, AclAPI, AccCtrl;


const
  //
  // Access flags for build of access masks...
  //
  DACL_STD_DELETE           = $00010000;
  DACL_STD_READ_CONTROL     = $00020000;
//  DACL_STD_WRITE_DAC        = $00040000;
//  DACL_STD_WRITE_OWNER      = $00080000;
  DACL_STD_SYNCHRONIZE      = $00100000;
  DACL_FILE_READ            = ACTRL_FILE_READ;
  DACL_FILE_WRITE           = ACTRL_FILE_WRITE;
  DACL_FILE_APPEND          = ACTRL_FILE_APPEND;
  DACL_FILE_EXECUTE         = ACTRL_FILE_EXECUTE;
  DACL_FILE_READ_ATTRIB     = ACTRL_FILE_READ_ATTRIB;
  DACL_FILE_WRITE_ATTRIB    = ACTRL_FILE_WRITE_ATTRIB;
  DACL_DIR_LIST             = ACTRL_DIR_LIST;
  DACL_DIR_CREATE_OBJECT    = ACTRL_DIR_CREATE_OBJECT;
  DACL_DIR_CREATE_CHILD     = ACTRL_DIR_CREATE_CHILD;
  DACL_FILE_READ_PROP       = ACTRL_FILE_READ_PROP;
  DACL_FILE_WRITE_PROP      = ACTRL_FILE_WRITE_PROP;
  DACL_MACRO_FILE_CHANGE    = DACL_STD_DELETE        or
                              DACL_STD_READ_CONTROL  or
                              DACL_FILE_READ         or
                              DACL_FILE_WRITE        or
                              DACL_FILE_APPEND       or
                              DACL_FILE_EXECUTE      or
                              DACL_FILE_READ_ATTRIB  or
                              DACL_FILE_WRITE_ATTRIB or
                              DACL_DIR_LIST          or
                              DACL_FILE_READ_PROP    or
                              DACL_FILE_WRITE_PROP;


type
  //
  // Basic ACL functions...
  //
  TNTACL_Helper = Class(TObject)
  private
  protected
  public
    constructor Create;
    destructor Destroy; override;

    function BuildExplicitAccessWN (var ExplicitAccess : PEXPLICIT_ACCESS_A
                                   ;TrusteeName        : String
                                   ;Permissions        : Cardinal
                                   ;AccessMode         : ACCESS_MODE
                                   ;Inheritance        : Cardinal): Boolean;
    function SetACEinACL (Entries    : PEXPLICIT_ACCESS_A
                         ;OldACL     : PACL
                         ;var NewACL : PACL): Boolean;
    function GetSecurityInfoByName (ObjectName             : String
                                   ;ObjectType             : SE_OBJECT_TYPE
                                   ;SecurityInformation    : SECURITY_INFORMATION
                                   ;var SIDOwner           : PSID
                                   ;var SIDGroup           : PSID
                                   ;var DACL               : PACL
                                   ;var SACL               : PACL
                                   ;var SecurityDescriptor : PSecurityDescriptor): Boolean;
    function SetSecurityInfoByName (ObjectName          : String
                                   ;ObjectType          : SE_OBJECT_TYPE
                                   ;SecurityInformation : SECURITY_INFORMATION
                                   ;SIDOwner            : PSID
                                   ;SIDGroup            : PSID
                                   ;DACL                : PACL
                                   ;SACL                : PACL): Boolean;
  end;


  //
  // Handle ACL's of filesystem objects (folders & files)
  //
  TNT_FileACL = Class(TNTACL_Helper)
  private
    FFSObject: String;

    function AccessByName (Domain      : String
                          ;Account     : String
                          ;AccessMask  : Cardinal
                          ;AccessMode  : ACCESS_MODE
                          ;Inheritance : Cardinal): Boolean;
  protected
  public
    property FSObject: String read FFSObject write FFSObject;

    constructor Create;
    destructor Destroy; override;

    function GrantAccessByName (Domain      : String
                               ;Account     : String
                               ;AccessMask  : Cardinal
                               ;Inheritance : Cardinal): Boolean;
    function RevokeAccessByName (Domain      : String
                                ;Account     : String
                                ;AccessMask  : Cardinal
                                ;Inheritance : Cardinal): Boolean;
    function DenyAccessByName (Domain      : String
                              ;Account     : String
                              ;AccessMask  : Cardinal
                              ;Inheritance : Cardinal): Boolean;
  end;


implementation


//
// NT-ACL Helper...
//
constructor TNTACL_Helper.Create;
begin
  inherited Create;

  //
end;


destructor TNTACL_Helper.Destroy;
begin
  //

  inherited Destroy;
end;


// Captures W32API-Function BuildExplicitAccessWithName...
function TNTACL_Helper.BuildExplicitAccessWN (var ExplicitAccess : PEXPLICIT_ACCESS_A
                                             ;TrusteeName        : String
                                             ;Permissions        : Cardinal
                                             ;AccessMode         : ACCESS_MODE
                                             ;Inheritance        : Cardinal): Boolean;
begin
  BuildExplicitAccessWN := False;

  try
    BuildExplicitAccessWithName (ExplicitAccess
                                ,PChar(TrusteeName)
                                ,Permissions
                                ,AccessMode
                                ,Inheritance);
    BuildExplicitAccessWN := True;
  finally
  end;
end;


// Captures W32API-Function SetEntriesInACL
// Merges a new ExplicitAccess structure with a given ACL structure to a new
// ACL structure or creates a new ACL structure if the pointer to the old
// structure is NULL...
function TNTACL_Helper.SetACEinACL (Entries    : PEXPLICIT_ACCESS_A
                                   ;OldACL     : PACL
                                   ;var NewACL : PACL): Boolean;
begin
  SetACEinACL := False;

  try
    if SetEntriesInACL (1
                       ,Entries
                       ,OldACL
                       ,NewACL) = ERROR_SUCCESS then
    begin
      SetACEinACL := True;
    end;
  finally
  end;
end;


// Captures W32API-Function GetNamedSecurityInfo...
function TNTACL_Helper.GetSecurityInfoByName (ObjectName             : String
                                             ;ObjectType             : SE_OBJECT_TYPE
                                             ;SecurityInformation    : SECURITY_INFORMATION
                                             ;var SIDOwner           : PSID
                                             ;var SIDGroup           : PSID
                                             ;var DACL               : PACL
                                             ;var SACL               : PACL
                                             ;var SecurityDescriptor : PSecurityDescriptor): Boolean;
var
  PDACL : PACL;
  PSACL : PACL;
begin
  GetSecurityInfoByName := False;

  try
    PDACL := @DACL;
    PSACL := @SACL;
    if GetNamedSecurityInfo (PChar(ObjectName)
                            ,SE_FILE_OBJECT
                            ,SecurityInformation
                            ,SIDOwner
                            ,SIDGroup
                            ,PDACL
                            ,PSACL
                            ,Pointer(SecurityDescriptor)) = ERROR_SUCCESS then
    begin
      GetSecurityInfoByName := True;
    end;
  finally
  end;
end;


// Captures W32API-Function SetNamedSecurityInfo...
function TNTACL_Helper.SetSecurityInfoByName (ObjectName          : String
                                             ;ObjectType          : SE_OBJECT_TYPE
                                             ;SecurityInformation : SECURITY_INFORMATION
                                             ;SIDOwner            : PSID
                                             ;SIDGroup            : PSID
                                             ;DACL                : PACL
                                             ;SACL                : PACL): Boolean;
begin
  SetSecurityInfoByName := False;

  try
    if SetNamedSecurityInfo (PChar(ObjectName)
                            ,SE_FILE_OBJECT
                            ,SecurityInformation
                            ,SIDOwner
                            ,SIDGroup
                            ,DACL
                            ,SACL) = ERROR_SUCCESS then
    begin
      SetSecurityInfoByName := True;
    end;
  finally
  end;
end;


//
// NT-FileACL...
//
constructor TNT_FileACL.Create;
begin
  inherited Create;

  //
end;


destructor TNT_FileACL.Destroy;
begin
  //

  inherited Destroy;
end;


function TNT_FileACL.AccessByName (Domain      : String
                                  ;Account     : String
                                  ;AccessMask  : Cardinal
                                  ;AccessMode  : ACCESS_MODE
                                  ;Inheritance : Cardinal): Boolean;
var
  LocalSD        : PSecurityDescriptor;
  DACL           : PACL;
  SACL           : PACL;
  SIDOwner       : PSID;
  SIDGroup       : PSID;
  NewDACL        : PACL;
  ExplicitAccess : PEXPLICIT_ACCESS_A;
begin
  AccessByName := False;
  LocalSD   := NIL;

  try
    // Get security descriptor & pointer to DACL from filesystem object...
    if GetSecurityInfoByName (FFSObject
                             ,SE_FILE_OBJECT
                             ,DACL_SECURITY_INFORMATION
                             ,SIDOwner
                             ,SIDGroup
                             ,DACL
                             ,SACL
                             ,LocalSD) then
    begin
      // Allocate memory for the ExplicitAccess structure describing the
      // the grant to process... (only one SID at a time)
      GetMem(ExplicitAccess, SizeOf(EXPLICIT_ACCESS_A));

      // Initialize the ExplicitAccess structure...
      if BuildExplicitAccessWN (ExplicitAccess
                               ,Domain+'\'+Account
                               ,AccessMask
                               ,AccessMode
                               ,Inheritance) then
      begin
        // Merge old DACL with ExplicitAccess structure to a new DACL...
        if SetACEinACL (ExplicitAccess
                       ,DACL
                       ,NewDACL) then
        begin
          // Not really necessary but nice to have... check, if the DACL is
          // valid...
          if IsValidACL (TACL(NewDACL^)) then
          begin
            // Write back extended DACL to system...
            if SetSecurityInfoByName (FFSObject
                                     ,SE_FILE_OBJECT
                                     ,DACL_SECURITY_INFORMATION
                                     ,NIL
                                     ,NIL
                                     ,NewDACL
                                     ,NIL) then
            begin
              // Everything went ok...
              AccessByName := True;
            end;
          end;
        end;
      end;
    end;
  finally
    if LocalSD <> NIL then
    begin
      LocalFree(Cardinal(LocalSD));
      LocalSD := NIL;
    end;

    if NewDACL <> NIL then
    begin
      LocalFree(Cardinal(NewDACL));
      NewDACL := NIL;
    end;
  end;
end;


// Grant access on a filesystem object to a group or user identified by
// Domain/ Account strings...
function TNT_FileACL.GrantAccessByName (Domain      : String
                                       ;Account     : String
                                       ;AccessMask  : Cardinal
                                       ;Inheritance : Cardinal): Boolean;
begin
  // Call private function "AccessByName" with access mode "GRANT_ACCESS"...
  GrantAccessByName := AccessByName (Domain
                                    ,Account
                                    ,AccessMask
                                    ,GRANT_ACCESS
                                    ,Inheritance);
end;


// Revoke access on a filesystem object from a group or user identified by
// Domain/ Account strings...
function TNT_FileACL.RevokeAccessByName (Domain      : String
                                        ;Account     : String
                                        ;AccessMask  : Cardinal
                                        ;Inheritance : Cardinal): Boolean;
begin
  // Call private function "AccessByName" with access mode "REVOKE_ACCESS"...
  RevokeAccessByName := AccessByName (Domain
                                     ,Account
                                     ,AccessMask
                                     ,REVOKE_ACCESS
                                     ,Inheritance);
end;


// Deny access on a filesystem object to a group or user identified by
// Domain/ Account strings...
function TNT_FileACL.DenyAccessByName (Domain      : String
                                      ;Account     : String
                                      ;AccessMask  : Cardinal
                                      ;Inheritance : Cardinal): Boolean;
begin
  // Call private function "AccessByName" with access mode "DENY_ACCESS"...
  DenyAccessByName := AccessByName (Domain
                                   ,Account
                                   ,AccessMask
                                   ,DENY_ACCESS
                                   ,Inheritance);
end;

end.

