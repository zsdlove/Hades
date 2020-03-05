# -- coding:utf-8 --
import logging
LOG_FORMAT="%(asctime)s [%(levelname)s] - %(message)s"
logging.basicConfig(filename="logs/Hades_exec.log",level=logging.DEBUG,format=LOG_FORMAT)
minsdkversion="--min-sdk-version=26"

sourceContainer = [  # source点
	'Lcom/moresc/cn/base;->getHttpRequests()Ljava/lang/String;',
    'Landroid/telephony/TelephonyManager;->getDeviceId()Ljava/lang/String;',
	'Landroid/content/pm/PackageManager;->getInstalledApplications(I)Ljava/util/List;',
	'Landroid/test/mock/MockPackageManager;->getInstalledApplications(I)Ljava/util/List;',
	'Landroid/content/Intent;->getParcelableArrayListExtra(Ljava/lang/String;)Ljava/util/ArrayList;',
	'Landroid/telephony/CellIdentityGsm;->getLac()I',
	'Landroid/telephony/CellIdentityWcdma;->getLac()I',
	'Landroid/telephony/NeighboringCellInfo;->getLac()I',
	'Landroid/telephony/gsm/GsmCellLocation;->getLac()I',
	'Landroid/provider/Browser;->getAllVisitedUrls(Landroid/content/ContentResolver;)Landroid/database/Cursor;',
	'Landroid/content/pm/PackageManager;->getInstalledPackages(I)Ljava/util/List;',
	'Landroid/test/mock/MockPackageManager;->getInstalledPackages(I)Ljava/util/List;',
	'Landroid/telephony/CellIdentityGsm;->getCid()I',
	'Landroid/telephony/CellIdentityWcdma;->getCid()I',
	'Landroid/telephony/NeighboringCellInfo;->getCid()I',
	'Landroid/telephony/gsm/GsmCellLocation;->getCid()I',
	'Landroid/net/wifi/WifiInfo;->getSSID()Ljava/lang/String;',
	'Landroid/bluetooth/BluetoothAdapter;->getAddress()Ljava/lang/String;',
	'Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;',
	'Landroid/hardware/usb/UsbEndpoint;->getAddress()I',
	'Landroid/net/IpPrefix;->getAddress()Ljava/net/InetAddress;',
	'Landroid/net/LinkAddress;->getAddress()Ljava/net/InetAddress;',
	'Landroid/text/util/Rfc822Token;->getAddress()Ljava/lang/String;',
	'Landroid/net/wifi/WifiManager;->getWifiState()I',
	'Landroid/accounts/AccountManager;->getAccounts()[Landroid/accounts/Account;',
	'Landroid/provider/Browser;->getAllBookmarks(Landroid/content/ContentResolver;)Landroid/database/Cursor;',
	'Landroid/content/Intent;->getPackage()Ljava/lang/String;',
	'Landroid/widget/RemoteViews;->getPackage()Ljava/lang/String;',
	'Landroid/location/Address;->getLatitude()D',
	'Landroid/location/Location;->getLatitude()D',
	'Landroid/telephony/CellIdentityCdma;->getLatitude()I',
	'Landroid/hardware/usb/UsbDevice;->getDeviceId(Ljava/lang/String;)I',
	'Landroid/mtp/MtpDevice;->getDeviceId()I',
	'Landroid/telephony/TelephonyManager;->getDeviceId()Ljava/lang/String;',
	'Landroid/view/InputEvent;->getDeviceId()I',
	'Landroid/view/KeyEvent;->getDeviceId()I',
	'Landroid/view/MotionEvent;->getDeviceId()I',
	'Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;',
	'Landroid/content/Intent;->getBundleExtra(Ljava/lang/String;)Landroid/os/Bundle;',
	'Landroid/app/WallpaperInfo;->toString()Ljava/lang/String;',
	'Landroid/app/admin/DeviceAdminInfo;->toString()Ljava/lang/String;',
	'Landroid/app/job/JobInfo;->toString()Ljava/lang/String;',
	'Landroid/appwidget/AppWidgetProviderInfo;->toString()Ljava/lang/String;',
	'Landroid/bluetooth/BluetoothClass;->toString()Ljava/lang/String;',
	'Landroid/bluetooth/BluetoothDevice;->toString()Ljava/lang/String;',
	'Landroid/bluetooth/BluetoothHealthAppConfiguration;->toString()Ljava/lang/String;',
	'Landroid/bluetooth/le/AdvertiseData;->toString()Ljava/lang/String;',
	'Landroid/bluetooth/le/AdvertiseSettings;->toString()Ljava/lang/String;',
	'Landroid/bluetooth/le/ScanFilter;->toString()Ljava/lang/String;',
	'Landroid/bluetooth/le/ScanRecord;->toString()Ljava/lang/String;',
	'Landroid/bluetooth/le/ScanResult;->toString()Ljava/lang/String;',
	'Landroid/widget/TextView$SavedState;->toString()Ljava/lang/String;',
	'Landroid/content/pm/PackageManager;->queryContentProviders(Ljava/lang/String;II)Ljava/util/List;',
	'Landroid/test/mock/MockPackageManager;->queryContentProviders(Ljava/lang/String;II)Ljava/util/List;',
	'Landroid/media/MediaFormat;->getString(Ljava/lang/String;)Ljava/lang/String;',
	'Landroid/media/MediaMetadata;->getString(Ljava/lang/String;)Ljava/lang/String;',
	'Landroid/media/MediaMetadataEditor;->getString(ILjava/lang/String;)Ljava/lang/String;',
	'Landroid/telephony/TelephonyManager;->getLine1Number()Ljava/lang/String;',
	'Landroid/app/job/JobInfo;->getExtras()Landroid/os/PersistableBundle;',
	'Landroid/app/job/JobParameters;->getExtras()Landroid/os/PersistableBundle;',
	'Landroid/location/Address;->getExtras()Landroid/os/Bundle;',
	'Landroid/location/Location;->getExtras()Landroid/os/Bundle;',
	'Landroid/media/MediaDescription;->getExtras()Landroid/os/Bundle;',
	'Landroid/media/browse/MediaBrowser;->getExtras()Landroid/os/Bundle;',
	'Landroid/media/session/MediaController;->getExtras()Landroid/os/Bundle;',
	'Landroid/media/session/PlaybackState$CustomAction;->getExtras()Landroid/os/Bundle;',
	'Landroid/media/session/PlaybackState;->getExtras()Landroid/os/Bundle;',
	'Landroid/location/Address;->getLongitude()D',
	'Landroid/location/Location;->getLongitude()D',
	'Landroid/telephony/CellIdentityCdma;->getLongitude()I',
	'Landroid/location/LocationManager;->getLastKnownLocation(Ljava/lang/String;)Landroid/location/Location;',
	'Landroid/telephony/TelephonyManager;->getSimSerialNumber()Ljava/lang/String;',
	'Landroid/drm/DrmInfo;->getData()[B',
	'Landroid/drm/DrmRights;->getData()[B',
	'Landroid/drm/ProcessedData;->getData()[B',
	'Landroid/media/MediaDrm$KeyRequest;->getData()[B',
	'Landroid/media/MediaDrm$ProvisionRequest;->getData()[B',
	'Landroid/opengl/ETC1Util$ETC1Texture;->getData()Ljava/nio/ByteBuffer;',
	'Landroid/os/Message;->getData()Landroid/os/Bundle;',
	'Lcom/moresc/cn/base;->getHttpRequests()Ljava/lang/String;',
	'Ljavax/servlet/http/HttpServletRequest;->getHeaders(Ljava/lang/String;)Ljava/util/Enumeration;',
	'Ljavax/servlet/http/HttpServletRequest;->getParameterMap()Ljava/util/Map;',
	'Lorg/owasp/benchmark/helpers/SeparateClassRequest;->getTheParameter(Ljava/lang/String;)Ljava/lang/String;'
]

sinkContainer = [
    'Lfridatest/test/com/myapplication/MainActivity;->sendMessage(Ljava/lang/String;)V',
    'Landroid/telephony/SmsManager;->sendTextMessage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/app/PendingIntent;Landroid/app/PendingIntent;)V',
	'Landroid/content/ContextWrapper;->sendStickyBroadcast(Landroid/content/Intent;)V',
	'Landroid/content/Context;->sendStickyBroadcast(Landroid/content/Intent;)V',
	'Landroid/content/Context;->sendOrderedBroadcastAsUser(Landroid/content/Intent;Landroid/os/UserHandle;Ljava/lang/String;Landroid/content/BroadcastReceiver;Landroid/os/Handler;ILjava/lang/String;Landroid/os/Bundle;)V',
	'Landroid/content/ContextWrapper;->sendOrderedBroadcastAsUser(Landroid/content/Intent;Landroid/os/UserHandle;Ljava/lang/String;Landroid/content/BroadcastReceiver;Landroid/os/Handler;ILjava/lang/String;Landroid/os/Bundle;)V',
	'Landroid/test/mock/MockContext;->sendOrderedBroadcastAsUser(Landroid/content/Intent;Landroid/os/UserHandle;Ljava/lang/String;Landroid/content/BroadcastReceiver;Landroid/os/Handler;ILjava/lang/String;Landroid/os/Bundle;)V',
	'Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;',
	'Landroid/content/Context;->sendOrderedBroadcast(Landroid/content/Intent;Ljava/lang/String;)V',
	'Landroid/content/ContextWrapper;->sendOrderedBroadcast(Landroid/content/Intent;Ljava/lang/String;)V',
	'Landroid/test/IsolatedContext;->sendOrderedBroadcast(Landroid/content/Intent;Ljava/lang/String;)V',
	'Landroid/test/mock/MockContext;->sendOrderedBroadcast(Landroid/content/Intent;Ljava/lang/String;)V',
	'Landroid/telephony/gsm/SmsManager;->sendTextMessage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/app/PendingIntent;Landroid/app/PendingIntent;)V',
	'Landroid/telephony/SmsManager;->sendMultipartTextMessage(Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;)V',
	'Landroid/telephony/gsm/SmsManager;->sendMultipartTextMessage(Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;)V',
	'Landroid/telephony/SmsManager;->sendDataMessage(Ljava/lang/String;Ljava/lang/String;S[BLandroid/app/PendingIntent;Landroid/app/PendingIntent;)V',
	'Landroid/telephony/gsm/SmsManager;->sendDataMessage(Ljava/lang/String;Ljava/lang/String;S[BLandroid/app/PendingIntent;Landroid/app/PendingIntent;)V',
	'Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z',
	'Landroid/renderscript/RenderScript;->sendMessage(I[I)V',
	'Lcom/moresc/cn/base;->responseToClient(Ljava/lang/String;)Ljava/lang/String;',
	'Ljava/lang/Runtime;->exec(Ljava/lang/String;)Ljava/lang/Process;',
	'Ljava/sql/Statement;->executeUpdate(Ljava/lang/String;)I',
	'Lorg/springframework/jdbc/core/JdbcTemplate;->queryForRowSet(Ljava/lang/String;)Lorg/springframework/jdbc/support/rowset/SqlRowSet;',
	'Ljava/io/PrintWriter;->write(Ljava/lang/String;II)V'
]

firstBlockList=[
	"onCreate(Landroid/os/Bundle;)V 1\l",
	"main([Ljava/lang/String;)V 1\l",
	"doPost(Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;)V 1\l"
]

javaEntryTmplList=[
	"L%s;->doPost(Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;)V",
	"L%s;->main([Ljava/lang/String;)V"
]

androidEntryTmplList=[
	"L%s;->onCreate(Landroid/os/Bundle;)V",
	"L%s;->onStart(Landroid/os/Bundle;)V",
	"L%s;->onRestart(Landroid/os/Bundle;)V",
	"L%s;->onResume(Landroid/os/Bundle;)V",
	"L%s;->onStartCommand(Landroid/os/Bundle;)V",
]

cleanContainer=[
	"test",
	"test"
]

banner='''
 .----------------.  .----------------.  .----------------.  .----------------.  .----------------. 
| .--------------. || .--------------. || .--------------. || .--------------. || .--------------. |
| |  ____  ____  | || |      __      | || |  ________    | || |  _________   | || |    _______   | |
| | |_   ||   _| | || |     /  \     | || | |_   ___ `.  | || | |_   ___  |  | || |   /  ___  |  | |
| |   | |__| |   | || |    / /\ \    | || |   | |   `. \ | || |   | |_  \_|  | || |  |  (__ \_|  | |
| |   |  __  |   | || |   / ____ \   | || |   | |    | | | || |   |  _|  _   | || |   '.___`-.   | |
| |  _| |  | |_  | || | _/ /    \ \_ | || |  _| |___.' / | || |  _| |___/ |  | || |  |`\____) |  | |
| | |____||____| | || ||____|  |____|| || | |________.'  | || | |_________|  | || |  |_______.'  | |
| |              | || |              | || |              | || |              | || |              | |
| '--------------' || '--------------' || '--------------' || '--------------' || '--------------' |
 '----------------'  '----------------'  '----------------'  '----------------'  '----------------' 
Authod:pOny@moresec
Date:2020.2.14
:)
'''

#漏洞描述
vul_desc={
	"Ljava/sql/Statement;->executeUpdate(Ljava/lang/String;)I":{
		"level":"high",
		"vulname":"sqlInject",
		"desc":"",
		"type":""
	}

}