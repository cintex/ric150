program AccessDemo;

{$APPTYPE CONSOLE}

uses
  AccCtrl,
  NTACL in 'NTACL.pas';


//
// The following example show's how to to grant CHANGE-Access to group
// CEX-DEVELOPMENT\Domänen-Benutzer on the folder C:\TEMP.
//
// FSObject could be a folder or file.
//
// CEX-DEVELOPMENT\Domänen-Benutzer means Domain CEX-DEVELOPMENT group
// Domain-Users (i'am using a german W2K ;-)
//
// CHANGE-Access known from the Windows 2000 Security-Dialog is a set of
// object specific security flags here represented by the "marco"
// DACL_MACRO_FILE_CHANGE
//


procedure GrantDemo;
var
  FileACL: TNT_FileACL;
begin
  FileACL := TNT_FileACL.Create;
  FileACL.FSObject := 'C:\TEST';

  FileACL.GrantAccessByName ('CEX-DEVELOPMENT'
                            ,'Domänen-Benutzer'
                            ,DACL_MACRO_FILE_CHANGE
                            ,SUB_CONTAINERS_AND_OBJECTS_INHERIT);
{  FileACL.DenyAccessByName ('CEX-DEVELOPMENT'
                           ,'Domänen-Benutzer'
                           ,DACL_MACRO_FILE_CHANGE
                           ,SUB_CONTAINERS_AND_OBJECTS_INHERIT);}

  FileACL.Free;
end;


begin
  GrantDemo;
end.
