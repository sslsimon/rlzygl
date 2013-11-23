<%
Class FileFolderCls
  Public fso
  
  Private Sub Class_Initialize()
      Set fso = CreateObject("Scripting.FileSystemObject")
  End Sub

  Private Sub Class_Terminate()
    Set fso = Nothing
  End Sub

'//==================================�ļ�����==================================
  
  'ȡ�ļ���С
  Function GetFileSize(FileName)
  '//���ܣ�ȡ�ļ���С
  '//�βΣ��ļ���
  '//����ֵ���ɹ�Ϊ�ļ���С��ʧ��Ϊ-1
  '//
    Dim f
    If ReportFileStatus(FileName) = 1 Then
        Set f = fso.Getfile(FileName)
        GetFileSize = f.Size
    Else
        GetFileSize = -1
    End if
  End Function 
  
  '�ļ�ɾ��
  Function DeleteAFile(filespec)
  '//���ܣ��ļ�ɾ��
  '//�βΣ��ļ���
  '//����ֵ���ɹ�Ϊ1��ʧ��Ϊ-1
  '//
    If ReportFileStatus(filespec) = 1 Then
        fso.DeleteFile(filespec)
        DeleteAFile = 1
    Else
        DeleteAFile = -1
    End if
  End Function
  
  '��ʾ�ļ��б�
  Function ShowFileList(folderspec)
  '//���ܣ�Ŀ¼����ʱ��ʾ��Ŀ¼�µ������ļ�
  '//�βΣ�Ŀ¼��
  '//����ֵ���ɹ�Ϊ�ļ��б�ʧ��Ϊ-1
  '//
    Dim f, f1, fc, s
    If ReportFolderStatus(folderspec) = 1 Then
        Set f = fso.GetFolder(folderspec)
        Set fc = f.Files
        For Each f1 in fc
          s = s & f1.name 
          s = s & "|"
        Next
        ShowFileList = s
    Else
        ShowFileList = -1
    End if
  End Function
  
  '!!!
  '�ļ�����
  Function CopyAFile(SourceFile,DestinationFile)
  '//���ܣ�Դ�ļ�����ʱ�����ܶ��ļ����и��ƣ�Ŀ���ļ���Ӱ��
  '//�βΣ�Դ�ļ���Ŀ���ļ�
  '//����ֵ���ɹ�Ϊ1��ʧ��Ϊ-1
  '//
    Dim MyFile
    If ReportFileStatus(SourceFile) = 1 Then
        Set MyFile = fso.GetFile(SourceFile)
        MyFile.Copy (DestinationFile)
        CopyAFile = 1
    Else
        CopyAFile = -1
    End if
  End Function
  
  '�ļ��ƶ�
  'Response.Write MoveAFile("d:\test1\4561.exe","d:\test1\4562.txt")
  Function MoveAFile(SourceFile,DestinationFile)
  '//���ܣ�Դ�ļ�����ʱĿ���ļ�������ʱ���ܶ��ļ������ƶ�
  '//�βΣ�Դ�ļ���Ŀ���ļ�
  '//����ֵ���ɹ�Ϊ1��ʧ��Ϊ-1
  '//
      If ReportFileStatus(SourceFile)=1 And ReportFileStatus(DestinationFile) = -1 Then
        fso.MoveFile SourceFile,DestinationFile
        MoveAFile = 1
      Else
        MoveAFile = -1
      End if
  End Function
  
  '�ļ��Ƿ���ڣ�
  'Response.Write ReportFileStatus("G: oft\delphi\my_pro\�����.exe")
  Function ReportFileStatus(FileName) 
  '//���ܣ��ж��ļ��Ƿ����
  '//�βΣ��ļ���
  '//����ֵ���ɹ�Ϊ1��ʧ��Ϊ-1
  '//
      Dim msg
    msg = -1
      If (fso.FileExists(FileName)) Then
        msg = 1
      Else
        msg = -1
      End If
      ReportFileStatus = msg
  End Function

  
  '�ļ���������
  'Response.Write ShowDateCreated("G: oft\delphi\my_pro\�����.exe")
  'Response.Write ShowDateCreated("G: oft\delphi\my_pro\���� �����.exe")
  Function ShowDateCreated(filespec)
  '//���ܣ��ļ���������
  '//�βΣ��ļ���
  '//����ֵ���ɹ����ļ��������ڣ�ʧ�ܣ�-1
  '//
      Dim f
    If ReportFileStatus(filespec) = 1 Then
        Set f = fso.GetFile(filespec)
        ShowDateCreated = f.DateCreated
    Else
        ShowDateCreated = -1
    End if
  End Function
  
  '�ļ�����
  'Response.Write GetAttributes("G: oft\delphi\my_pro\���� �����.exe")
  Function GetAttributes(FileName)
  '//���ܣ���ʾ�ļ�����
  '//�βΣ��ļ���
  '//����ֵ���ɹ����ļ����ԣ�ʧ�ܣ�-1
  '//
      Dim f,Str
    If ReportFileStatus(FileName) = 1 Then
        Set f = fso.GetFile(FileName)
        Select Case f.attributes 
          Case 0 Str="��ͨ�ļ���û�������κ����ԡ� "
          Case 1 Str="ֻ���ļ����ɶ�д�� "
          Case 2 Str="�����ļ����ɶ�д�� "
          Case 4 Str="ϵͳ�ļ����ɶ�д�� "
          Case 16 Str="�ļ��л�Ŀ¼��ֻ���� "
          Case 32 Str="�ϴα��ݺ��Ѹ��ĵ��ļ����ɶ�д�� " 
          Case 1024 Str="���ӻ��ݷ�ʽ��ֻ���� "
          Case 2048 Str=" ѹ���ļ���ֻ����"
        End Select
        GetAttributes = Str
    Else
        GetAttributes = -1
    End if
  End Function
  
  '���һ�η���/���һ���޸�ʱ��
  'Response.Write ShowFileAccessInfo("G: oft\delphi\my_pro\���� �����.exe")
  Function ShowFileAccessInfo(FileName,InfoType)
  '//���ܣ���ʾ�ļ�����ʱ��Ϣ
  '//�βΣ��ļ���,��Ϣ���
  '//     1 -----����ʱ��
  '//     2 -----�ϴη���ʱ��
  '//     3 -----�ϴ��޸�ʱ��
  '//     4 -----�ļ�·��
  '//     5 -----�ļ�����
  '//     6 -----�ļ�����
  '//     7 -----�ļ���С
  '//     8 -----��Ŀ¼
  '//     9 -----��Ŀ¼
  '//����ֵ���ɹ�Ϊ�ļ�����ʱ��Ϣ��ʧ�ܣ�-1


  '//
    Dim f, s
    If ReportFileStatus(FileName) = 1 then
        Set f = fso.GetFile(FileName)
        Select Case InfoType
          Case 1 s = f.DateCreated     '//     1 -----����ʱ��
          Case 2 s = f.DateLastAccessed   '//     2 -----�ϴη���ʱ��
          Case 3 s = f.DateLastModified   '//     3 -----�ϴ��޸�ʱ��
          Case 4 s = f.Path           '//     4 -----�ļ�·��
          Case 5 s = f.Name           '//     5 -----�ļ�����
          Case 6 s = f.Type           '//     6 -----�ļ�����
          Case 7 s = f.Size           '//     7 -----�ļ���С
          Case 8 s = f.ParentFolder     '//     8 -----��Ŀ¼
          Case 9 s = f.RootFolder         '//     8 -----��Ŀ¼
        End Select
        ShowFileAccessInfo = s 
    ELse
        ShowFileAccessInfo = -1 
    End if
  End Function

  'д�ı��ļ�
  Function WriteTxtFile(FileName,TextStr,WriteORAppendType)
    Const ForReading = 1, ForWriting = 2 , ForAppending = 8
    Dim f, m
    Select Case WriteORAppendType
    Case 1:         '�ļ�����д����
        Set f = fso.OpenTextFile(FileName, ForWriting, True)
        f.Write TextStr
        f.Close
        If ReportFileStatus(FileName) = 1 then
          WriteTxtFile = 1
        Else
          WriteTxtFile = -1
        End if
    Case 2:         '�ļ�ĩβ����д����
        If ReportFileStatus(FileName) = 1 then
          Set f = fso.OpenTextFile(FileName, ForAppending)
          f.Write TextStr
          f.Close
          WriteTxtFile = 1
        Else
          WriteTxtFile = -1
        End if
    End Select
  End Function
  
  '���ı��ļ�
  Function ReadTxtFile(FileName)
    Const ForReading = 1, ForWriting = 2
    Dim f, m
    If ReportFileStatus(FileName) = 1 then
        Set f = fso.OpenTextFile(FileName, ForReading)
        'm = f.ReadLine
         m = f.ReadAll
        'f.SkipLine
        ReadTxtFile = m
        f.Close
    Else
        ReadTxtFile = -1
    End if
  End Function

  '�����ı��ļ�
  
  
  
'//==================================Ŀ¼����==================================
  
  'ȡĿ¼��С
  Function GetFolderSize(FolderName)
  '//���ܣ�ȡĿ¼��С
  '//�βΣ�Ŀ¼��
  '//����ֵ���ɹ�ΪĿ¼��С��ʧ��Ϊ-1
  '//
    Dim f
    If ReportFolderStatus(FolderName) = 1 Then
        Set f = fso.GetFolder(FolderName)
        GetFolderSize = f.Size
    Else
        GetFolderSize = -1
    End if
  End Function 

  '�������ļ���
  Function CreateFolderDemo(FolderName)
  '//���ܣ��������ļ���
  '//�βΣ�Ŀ¼��
  '//����ֵ���ɹ�Ϊ1��ʧ��Ϊ-1
  '//
      Dim f
    If ReportFolderStatus(Folderspec) = 1 Then
        CreateFolderDemo = -1
    Else
        Set f = fso.CreateFolder(FolderName)
        CreateFolderDemo = 1
    End if
  End Function
  
  
  '!!!
  'Ŀ¼ɾ��
  Function DeleteAFolder(Folderspec)
  '//���ܣ�Ŀ¼ɾ��
  '//�βΣ�Ŀ¼��
  '//����ֵ���ɹ�Ϊ1��ʧ��Ϊ-1
  '//
    'Response.write Folderspec
    If ReportFolderStatus(Folderspec) = 1 Then
         fso.DeleteFolder (Folderspec)
        DeleteAFolder = 1
    Else
        DeleteAFolder = -1
    End if
  End Function
  
  '��ʾĿ¼�б�
  Function ShowFolderList(folderspec) 
  '//���ܣ�Ŀ¼����ʱ��ʾ��Ŀ¼�µ�������Ŀ¼
  '//�βΣ�Ŀ¼��
  '//����ֵ���ɹ�Ϊ��Ŀ¼�б�ʧ��Ϊ-1
  '//
    Dim f, f1, fc, s
    If ReportFolderStatus(folderspec) = 1 Then
        Set f = fso.GetFolder(folderspec)
        Set fc = f.SubFolders
        For Each f1 in fc
          s = s & f1.name 
          s = s & "|"
        Next
        ShowFolderList = s
    Else
        ShowFolderList = -1
    End if
  End Function

  '!!!!
  'Ŀ¼����
  Function CopyAFolder(SourceFolder,DestinationFolder)
  '//���ܣ�ԴĿ¼����ʱ�����ܶ�Ŀ¼���и��ƣ�Ŀ��Ŀ¼��Ӱ��
  '//�βΣ�ԴĿ¼��Ŀ��Ŀ¼
  '//����ֵ���ɹ�Ϊ1��ʧ��Ϊ-1
  '//
    Dim MyFolder
    If ReportFolderStatus(SourceFolder) = 1  Then
        'Set MyFolder = fso.GetFolder(SourceFolder)
        fso.CopyFolder SourceFolder,DestinationFolder
        CopyAFolder = 1
    Else
        CopyAFolder = -1
    End if
  End Function

  
  'Ŀ¼�����ƶ�
  Function MoveAFolder(SourcePath,DestinationPath)
  '//���ܣ�ԴĿ¼����ʱ Ŀ��Ŀ¼������ʱ���ܶ�Ŀ¼�����ƶ�
  '//�βΣ�ԴĿ¼��Ŀ��Ŀ¼
  '//����ֵ���ɹ�Ϊ1��ʧ��Ϊ-1
  '//
      If ReportFolderStatus(SourcePath)=1 And ReportFolderStatus(DestinationPath)=0 Then
        fso.MoveFolder SourcePath, DestinationPath
        MoveAFolder = 1
    Else
        MoveAFolder = -1
    End if
  End Function

  '�ж�Ŀ¼�Ƿ����
  'Response.Write ReportFolderStatus("G: oft\delphi\my_pro\")
  Function ReportFolderStatus(fldr) 
  '//���ܣ��ж�Ŀ¼�Ƿ����
  '//�βΣ�Ŀ¼
  '//����ֵ���ɹ�Ϊ1��ʧ��Ϊ-1
  '//
      Dim msg
    msg = -1
      If (fso.FolderExists(fldr)) Then
        msg = 1
      Else
          msg = -1
      End If
      ReportFolderStatus = msg
  End Function
  
  'Ŀ¼����ʱ��Ϣ
  Function ShowFolderAccessInfo(FolderName,InfoType)
  '//���ܣ���ʾĿ¼����ʱ��Ϣ
  '//�βΣ�Ŀ¼��,��Ϣ���
  '//     1 -----����ʱ��
  '//     2 -----�ϴη���ʱ��
  '//     3 -----�ϴ��޸�ʱ��
  '//     4 -----Ŀ¼·��
  '//     5 -----Ŀ¼����
  '//     6 -----Ŀ¼����
  '//     7 -----Ŀ¼��С
  '//     8 -----��Ŀ¼
  '//     9 -----��Ŀ¼
  '//����ֵ���ɹ�ΪĿ¼����ʱ��Ϣ��ʧ�ܣ�-1
  '//
    Dim f, s
    If ReportFolderStatus(FolderName) = 1 then
        Set f = fso.GetFolder(FolderName)
        Select Case InfoType
          Case 1 s = f.DateCreated     '//     1 -----����ʱ��
          Case 2 s = f.DateLastAccessed   '//     2 -----�ϴη���ʱ��
          Case 3 s = f.DateLastModified   '//     3 -----�ϴ��޸�ʱ��
          Case 4 s = f.Path           '//     4 -----�ļ�·��
          Case 5 s = f.Name           '//     5 -----�ļ�����
          Case 6 s = f.Type           '//     6 -----�ļ�����
          Case 7 s = f.Size           '//     7 -----�ļ���С
          Case 8 s = f.ParentFolder     '//     8 -----��Ŀ¼
          Case 9 s = f.RootFolder         '//     9 -----��Ŀ¼
        End Select
        ShowFolderAccessInfo = s 
    ELse
        ShowFolderAccessInfo = -1 
    End if
  End Function
  
  Function DisplayLevelDepth(pathspec)
    Dim f, n ,Path
    Set f = fso.GetFolder(pathspec)
    If f.IsRootFolder Then
        DisplayLevelDepth ="ָ�����ļ����Ǹ��ļ��С�"&RootFolder
    Else
        Do Until f.IsRootFolder
          Path = Path & f.Name &"<br>"
          Set f = f.ParentFolder
          n = n + 1
        Loop
        DisplayLevelDepth ="ָ�����ļ�����Ƕ�׼�Ϊ " & n & " ���ļ��С�<br>"& Path
    End If
  End Function
  
'//==================================���̲���==================================
  '�������Ƿ���ڣ�
  'Response.Write ReportDriveStatus("C:\")
  Function ReportDriveStatus(drv) 
  '//���ܣ��жϴ����Ƿ����
  '//�βΣ�����
  '//����ֵ���ɹ�Ϊ1��ʧ��Ϊ-1
  '//
      Dim msg
    msg = -1
      If fso.DriveExists(drv) Then
        msg = 1
      Else
        msg = -1
      End If
      ReportDriveStatus = msg
  End Function
  
  '--------���õķ������Ͱ��� FAT��NTFS �� CDFS��
  'Response.Write ShowFileSystemType("C:\")
  Function ShowFileSystemType(drvspec)
  '//���ܣ���������
  '//�βΣ�������
  '//����ֵ���ɹ�Ϊ���ͣ�FAT��NTFS �� CDFS��ʧ�ܣ�-1
  '//
    Dim d
    If ReportDriveStatus(drvspec) = 1 Then
        Set d = fso. GetDrive(drvspec)
        ShowFileSystemType = d.FileSystem
    ELse
        ShowFileSystemType = -1
    End if
  End Function
End Class

%>