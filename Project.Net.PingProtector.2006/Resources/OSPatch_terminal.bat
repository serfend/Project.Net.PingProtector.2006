@echo off
cls
echo.
echo.
echo ����������������������������������������������������
echo.
echo  Windows ��ȫ�ӹ� 
echo.
echo                           30��
echo                           2018-04-07
echo.
echo  ע��        ��Ҫ���ڸ�Ŀ¼ִ��
echo              ����Administrator�˺����У�����UAC������Թ���Ա������У�
echo              �����ֹ�ɾ������ABC���뷨
echo.
echo  ���ݰ�����
echo              �ر�Ĭ�Ϲ���
echo              �ر�Σ�շ���
echo              �ӹ��ʻ�����
echo              �رչ���˿�
echo.
echo ����������������������������������������������������
cls

echo ����������������������������������������������������
echo.
echo  �Ƿ�ر�Ĭ�Ϲ����ر�Σ�շ��񡢼ӹ��ʻ�����  
echo.
echo ����������������������������������������������������
echo ----------------------------------------------------
echo ���admin$����
net share admin$ /del 
echo ----------------------------------------------------
echo ���ipc$����
net share ipc$ /del
echo ----------------------------------------------------
echo ���C�̹���
net share c$ /del  
echo ---------------------------------------------------- 
echo ���D�̹���
net share d$ /del  
echo ----------------------------------------------------
echo ���E�̹���
net share d$ /del  
echo ----------------------------------------------------
echo ���F�̹���
net share d$ /del  
echo ----------------------------------------------------
echo ���G�̹���
net share d$ /del  
echo ----------------------------------------------------


echo ����������������������������������������������������
echo.
echo  ���ڹر�Σ�յķ���
echo.
echo ����������������������������������������������������
echo ----------------------------------------------------
echo Name: lmhosts
echo �ṩ TCP/IP (NetBT) �����ϵ� NetBIOS �������Ͽͻ��˵� NetBIOS ���ƽ�����֧�֣��Ӷ�ʹ�û��ܹ������ļ�����ӡ�͵�¼�����硣����˷���ͣ�ã���Щ���ܿ��ܲ����á�����˷��񱻽��ã��κ��������ķ����޷�������
sc config lmhosts start= DISABLED
sc stop lmhosts
echo ----------------------------------------------------
echo Name: tlntsvr
echo ����Զ���û���¼���˼���������г��򣬲�֧�ֶ��� TCP/IP Telnet �ͻ��ˣ��������� UNIX �� Windows �ļ����������˷���ֹͣ��Զ���û��Ͳ��ܷ��ʳ����κ�ֱ�����������ķ��񽫻�����ʧ�ܡ�
sc config tlntsvr start= DISABLED
sc stop tlntsvr
echo ----------------------------------------------------
echo Name: Browser
echo ά�������ϼ�����ĸ����б������б��ṩ�������ָ��������������ֹͣ���б��ᱻ���»�ά����������񱻽��ã��κ�ֱ�������ڴ˷���ķ����޷�������
sc config  Browser start= DISABLED
sc stop Browser
echo ----------------------------------------------------
echo Name: RemoteRegistry
echo ʹԶ���û����޸Ĵ˼�����ϵ�ע������á�����˷�����ֹ��ֻ�д˼�����ϵ��û������޸�ע�������˷��񱻽��ã��κ��������ķ����޷�������
sc config  RemoteRegistry start= DISABLED
sc stop RemoteRegistry
echo ----------------------------------------------------
echo Name: lanmanserver
echo ֧�ִ˼����ͨ��������ļ�����ӡ���������ܵ������������ֹͣ����Щ���ܲ����á�������񱻽��ã��κ�ֱ�������ڴ˷���ķ����޷�������
sc config  lanmanserver start= DISABLED
sc stop lanmanserver
echo ----------------------------------------------------
echo Name: Schedule
echo ʹ�û������ڴ˼���������úͼƻ��Զ����񡣴˷����йܶ�� Windows ϵͳ�ؼ���������˷���ֹͣ����ã���Щ�����޷��ڼƻ���ʱ�����С�����˷��񱻽��ã�����ȷ�����������з����޷�������
sc config Schedule start= DISABLED
sc stop Schedule
echo ----------------------------------------------------

echo Name: KMService
echo Ϊ�˼����ע�Ტ���� IP ��ַ������˷���ֹͣ������������ܽ��ն�̬ IP ��ַ�� DNS ���¡�����˷��񱻽��ã�������ȷ�������ķ��񶼽�����������
sc config  KMService start= DISABLED
sc stop KMService
echo ----------------------------------------------------

echo Name: WZCSVC
echo �����Զ��������������豸������Ʒ�ʷ����������û���������磬��ô��������Ϊ���ü��ɡ�
sc config  WZCSVC start= DISABLED
sc stop WZCSVC
echo ----------------------------------------------------

echo Name: bthserv
echo Bluetooth ����֧�ַ��ֺ͹���Զ�� Bluetooth �豸��ֹͣ����ô˷�����ܵ����Ѱ�װ�� Bluetooth �豸�޷���ȷ������������ֹ���ֺ͹������豸��
sc config bthserv start= DISABLED
sc stop bthserv
echo ----------------------------------------------------

echo Name: ShellHWDetection
echo ShellHWDetection����Ϊ�Զ�����Ӳ���¼��ṩ֪ͨ��
sc config ShellHWDetection start= DISABLED
sc stop ShellHWDetection
echo ----------------------------------------------------

echo Name: TrkWks
echo TrkWks����ά��ĳ��������ڻ�ĳ�������еļ������ NTFS �ļ�֮������ӡ�
sc config TrkWks start= DISABLED
sc stop TrkWks
echo ----------------------------------------------------

echo Name: Dnscache
echo Dnscache����DNS �ͻ��˷���(dnscache)��������ϵͳ(DNS)���Ʋ�ע��ü������������������ơ�����÷���ֹͣ������������ DNS ���ơ�Ȼ������������ DNS ���ƵĲ�ѯ������Ҳ�ע���������ơ�����÷��񱻽��ã����κ���ȷ���������ķ��񶼽��޷�������
sc config Dnscache start= DISABLED
sc stop Dnscache
echo ----------------------------------------------------

echo Name: ALG
echo ALG����Ϊ Internet ���ӹ����ṩ������Э������֧�֡�
sc config ALG start= DISABLED
sc stop ALG
echo ----------------------------------------------------

echo Name: BITS
echo BITS����Ϊ ʹ�ÿ�����������ں�̨�����ļ�������÷��񱻽��ã��������� BITS ���κ�Ӧ�ó���(�� Windows Update �� MSN Explorer)���޷��Զ����س����������Ϣ��
sc config BITS start= DISABLED
sc stop BITS
echo ----------------------------------------------------

echo Name: WinRM
echo WinRM����Windows Զ�̹���(WinRM)����ִ�� WS-Management Э����ʵ��Զ�̹���WS-Management ������Զ�������Ӳ������ı�׼ Web ����Э�顣WinRM �������������ϵ� WS-Management ���󲢶����ǽ��д���ͨ������Ի�ʹ�� winrm.cmd �����й��ߵ��������������� WinRM ������ʹ���ͨ������������WinRM �����ṩ�� WMI ���ݵķ��ʲ������¼����ϡ��¼����ϼ����¼��Ķ�����Ҫ����������״̬������ WinRM ��Ϣʱʹ�� HTTP �� HTTPS Э�顣WinRM ���������� IIS ������ͬһ�������Ԥ����Ϊ�� IIS ����˿ڡ�WinRM ������ /wsman URL ǰ׺����Ҫ��ֹ�� IIS ������ͻ������ԱӦȷ�� IIS �ϳ��ص�������վ����ʹ�� /wsman URL ǰ׺��
sc config WinRM start= DISABLED
sc stop WinRM
echo ----------------------------------------------------




echo ����������������������������������������������������
echo.
echo  ���ڿ�����Ҫ�İ�ȫ����
echo.
echo ����������������������������������������������������
echo ----------------------------------------------------
echo Name: wscsvc
echo WSCSVC(Windows ��ȫ����)������Ӳ����������ϵİ�ȫ�������á��������ð�������ǽ(��/�ر�)�����������(��/�ر�/����)����������(��/�ر�/����)��Windows Update(�Զ�/�ֶ����ز���װ����)���û��ʻ�����(��/�ر�)�Լ� Internet ����(�Ƽ�/���Ƽ�)��
sc config wscsvc start= ENABLE
sc start wscsvc
echo ----------------------------------------------------
echo Name:MpsSvc
echo Windows ����ǽͨ����ֹδ��Ȩ�û�ͨ�� Internet ������������ļ���������������������
sc config MpsSvc start= ENABLE
sc start MpsSvc
echo ----------------------------------------------------

echo ����������������������������������������������������
echo.
echo  ���ڿ�����˲���
echo.
echo ����������������������������������������������������
echo [version] >secaudit.inf REM ��˲�������ģ��
echo signature="$CHICAGO$" >>secaudit.inf
echo [Event Audit] >>secaudit.inf
echo ----------------------------------------------------
echo ���ϵͳ�¼�
echo AuditSystemEvents=3 >>secaudit.inf
echo ----------------------------------------------------
echo ��˶������
echo AuditObjectAccess=3 >>secaudit.inf
echo ----------------------------------------------------
echo �����Ȩʹ��
echo AuditPrivilegeUse=3 >>secaudit.inf
echo ----------------------------------------------------
echo ��˲��Ը���
echo AuditPolicyChange=3 >>secaudit.inf
echo ----------------------------------------------------
echo ��˽���׷��
echo AuditProcessTracking=3 >>secaudit.inf
echo ----------------------------------------------------
echo ���Ŀ¼�������
echo AuditDSAccess=3 >>secaudit.inf
echo ----------------------------------------------------
echo ����˻�����
echo AuditAccountManage=3 >>secaudit.inf
echo ----------------------------------------------------
echo ����˻���¼�¼�
echo AuditAccountLogon=3 >>secaudit.inf
echo ----------------------------------------------------
echo ��˵�¼�¼�
echo AuditLogonEvents=3 >>secaudit.inf
echo ----------------------------------------------------
secedit /configure /db secaudit.sdb /cfg secaudit.inf
echo ----------------------------------------------------
;del secaudit.*


echo ����������������������������������������������������
echo.
echo  ���ڽ����ʻ����Լӹ�
echo.
echo ����������������������������������������������������
echo [version] >account.inf REM �ʻ�������Ȩ����ģ��
echo signature="$CHICAGO$" >>account.inf
echo [System Access] >>account.inf
echo ----------------------------------------------------
echo �����ʻ����븴����Ҫ��
echo PasswordComplexity=1 >>account.inf
echo ----------------------------------------------------
echo �޸��ʻ�������С����Ϊ10
echo MinimumPasswordLength=10 >>account.inf
echo ----------------------------------------------------
echo �޸��ʻ������������Ϊ14��
echo MaximumPasswordAge=14 >>account.inf
echo ----------------------------------------------------
echo �޸�ǿ��������ʷΪ5��
echo PasswordHistorySize=5 >>account.inf
echo ----------------------------------------------------
echo �趨�ʻ�������ֵΪ5��
echo LockoutBadCount=5 >>account.inf
echo ----------------------------------------------------
echo ����Guest�ʻ�
echo EnableGuestAccount=0 >>account.inf
echo ----------------------------------------------------
secedit /configure /db account.sdb /cfg account.inf
echo ----------------------------------------------------
del account.*


echo ����������������������������������������������������
echo.
echo  ����������Ļ����ʱ��
echo.
echo ����������������������������������������������������
set r="HKCU\Control Panel\Desktop"
reg add %r% /v ScreenSaveActive /d 1 /f >nul
reg add %r% /v ScreenSaverIsSecure /d 1 /f >nul
reg add %r% /v ScreenSaveTimeOut /d 540 /f >nul
reg add %r% /v SCRNSAVE.EXE /d  %windir%\system32\ssText3d.scr  /f >nul


echo.
echo         ###########################################################
echo         #                                                         #
echo         #                   ��Σ�ն˿ڷ������ߡ�                  #
echo         #                                      #
echo         #                                                         #
echo         #                       ������˵����                      #
echo         #                                                         #
echo         #     ��Σ�ն˿ڷ������ߡ����ڸ�����ҵ�ն˰�ȫ���ù�����  #
echo         # ��Ҫ������Windows����ǽ��ͨ��������վ����ͳ�վ����Գ� #
echo         # ����Σ�ն˿ڽ��з��������ű����������¶˿ڣ�            #
echo         #    ��20��21�˿ڡ���FTP����Ĭ�϶˿ڣ�                    #
echo         #    ��22�˿ڡ�SSH����˿�                                #
echo         #    ��23�˿ڡ�Telnet����˿�                             #
echo         #    ��135�˿ڡ�ʹ��RPCЭ���ṩDCOM����                   #
echo         #    ��137�˿ڡ�ʹ��NetBIOSЭ���ṩhost��IP��ַ��ѯ����   #
echo         #    ��138�˿ڡ�ʹ��NetBIOSЭ���ṩ���������ƻ��������� #
echo         #    ��139�˿ڡ�ͨ�������ھӷ��ʾ����������ļ��ʹ�ӡ��    #
echo         #    ��445�˿ڡ�����CIFSЭ����ʹ����ļ��ʹ�ӡ��          #
echo         #                                                         #
echo         ###########################################################
echo.
echo.
echo Windows��������ǽ�����С���
netsh advfirewall set allprofile state on
echo ���ڹر�20�˿ڡ���
netsh advfirewall firewall add rule name = "Disable port 20 - TCP" dir = in action = block protocol = TCP localport = 20
echo ���ڹر�21�˿ڡ���
netsh advfirewall firewall add rule name = "Disable port 21 - TCP" dir = in action = block protocol = TCP localport = 21
echo ���ڹر�22�˿ڡ���
netsh advfirewall firewall add rule name = "Disable port 22 - TCP" dir = in action = block protocol = TCP localport = 22
echo ���ڹر�23�˿ڡ���
netsh advfirewall firewall add rule name = "Disable port 23 - TCP" dir = in action = block protocol = TCP localport = 23
echo ���ڹر�135�˿ڡ���
netsh advfirewall firewall add rule name = "Disable port 135 - TCP" dir = in action = block protocol = TCP localport = 135
echo ���ڹر�137�˿ڡ���
netsh advfirewall firewall add rule name = "Disable port 137 - TCP" dir = in action = block protocol = TCP localport = 137
echo ���ڹر�138�˿ڡ���
netsh advfirewall firewall add rule name = "Disable port 138 - TCP" dir = in action = block protocol = TCP localport = 138
echo ���ڹر�139�˿ڡ���
netsh advfirewall firewall add rule name = "Disable port 139 - TCP" dir = in action = block protocol = TCP localport = 139
echo ���ڹر�445�˿ڡ���
netsh advfirewall firewall add rule name = "Disable port 445 - TCP" dir = in action = block protocol = TCP localport = 445
echo =============================================
echo ��ҵ�ն˵Ķ˿ڷ�����������ɣ�

