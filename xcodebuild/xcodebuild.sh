#!/bin/sh

echo "~~~~~~~~~~~~~~~~开始执行脚本~~~~~~~~~~~~~~~~"


# 开始时间
beginTime=`date +%s`
DATE=`date '+%Y-%m-%d-%T'`
#需要编译的 targetName
TARGET_NAME="myDemo"
#编译模式 工程默认有 Debug Release
CONFIGURATION=Release
#编译路径
BUILDPATH=~/Desktop/${TARGET_NAME}_${DATE}
#archivePath
ARCHIVEPATH=${BUILDPATH}/${TARGET_NAME}.xcarchive
#输出的ipa目录
IPAPATH=${BUILDPATH}

#证书名
CODE_SIGN_IDENTITY="iPhone Developer: 910075847@qq.com (B674ZUBXQ5)"
#描述文件
ADHOC_PROVISIONING_PROFILE_NAME="472c467b-0c91-4ade-a4f7-8c1ca397038c"
APPSTORE_PROVISIONING_PROFILE_NAME="472c467b-0c91-4ade-a4f7-8c1ca397038c"
ENTERPRISE_PROVISIONING_PROFILE_NAME="472c467b-0c91-4ade-a4f7-8c1ca397038c"
PROVISIONING_PROFILE_NAME=${ADHOC_PROVISIONING_PROFILE_NAME}

#导出ipa 所需plist
ADHOC_ExportOptionsPlist=./ADHOCExportOptionsPlist.plist
AppStore_ExportOptionsPlist=./AppStoreExportOptionsPlist.plist
ENTERPRISE_ExportOptionsPlist=./EnterpriseExportOptionsPlist.plist
ExportOptionsPlist=${ADHOC_ExportOptionsPlist}


# 是否上传fir
UPLOADPGYER=false
# 是否上传AppStore
UPLOADAPPSTore=false

echo "~~~~~~~~~~~~~~~~选择打包方式~~~~~~~~~~~~~~~~"
echo "        1 ad-hoc (默认)"
echo "        2 AppStore "
echo "        3 enterprise "

# 读取用户输入并存到变量里
read parameter
sleep 0.5
method="$parameter"

# 判读用户是否有输入
if [ -n "$method" ]
then
if [ "$method" = "1" ]
then
	PROVISIONING_PROFILE_NAME=${ADHOC_PROVISIONING_PROFILE_NAME}
	ExportOptionsPlist=${ADHOC_ExportOptionsPlist}
elif [ "$method" = "2" ]
then
	PROVISIONING_PROFILE_NAME=${APPSTORE_PROVISIONING_PROFILE_NAME}
	ExportOptionsPlist=${AppStore_ExportOptionsPlist}
elif [ "$method" = "3" ]
then
	PROVISIONING_PROFILE_NAME=${ENTERPRISE_PROVISIONING_PROFILE_NAME}
	ExportOptionsPlist=${ENTERPRISE_ExportOptionsPlist}
else
	echo "参数无效...."
exit 1
fi
else
    PROVISIONING_PROFILE_NAME=${ADHOC_PROVISIONING_PROFILE_NAME}
	ExportOptionsPlist=${ADHOC_ExportOptionsPlist}
fi


echo "~~~~~~~~~~~~~~~~开始编译~~~~~~~~~~~~~~~~~~~"
echo "~~~~~~~~~~~~~~~~开始清理~~~~~~~~~~~~~~~~~~~"
# 清理 避免出现一些莫名的错误
# xcodebuild clean -workspace ${TARGET_NAME}.xcworkspace \
# -configuration \
# ${CONFIGURATION} -alltargets

xcodebuild clean -configuration ${CONFIGURATION} -quiet || exit
echo '------------->>>清理完成'


echo "~~~~~~~~~~~~~~~~开始构建~~~~~~~~~~~~~~~~~~~"
xcodebuild archive -workspace ${TARGET_NAME}.xcworkspace \
-scheme ${TARGET_NAME} \
-archivePath ${ARCHIVEPATH} \
-configuration ${CONFIGURATION} \
CODE_SIGN_IDENTITY="${CODE_SIGN_IDENTITY}" \
PROVISIONING_PROFILE="${PROVISIONING_PROFILE_NAME}"


echo "~~~~~~~~~~~~~~~~检查是否构建成功~~~~~~~~~~~~~~~~~~~"
# xcarchive 实际是一个文件夹不是一个文件所以使用 -d 判断
if [ -d "$ARCHIVEPATH" ]
then
	echo "构建成功......"
else
	echo "构建失败......"
	rm -rf $BUILDPATH
exit 1
fi
endTime=`date +%s`
ArchiveTime="构建时间$[ endTime - beginTime ]秒"


echo "~~~~~~~~~~~~~~~~导出ipa~~~~~~~~~~~~~~~~~~~"

beginTime=`date +%s`

xcodebuild -exportArchive \
-archivePath ${ARCHIVEPATH} \
-exportOptionsPlist ${ExportOptionsPlist} \
-exportPath ${IPAPATH}

echo "~~~~~~~~~~~~~~~~检查是否成功导出ipa~~~~~~~~~~~~~~~~~~~"
IPAPATH=${IPAPATH}/${TARGET_NAME}.ipa
if [ -f "$IPAPATH" ]
then
	echo "导出ipa成功......"
else
	echo "导出ipa失败......"
	# 结束时间
	endTime=`date +%s`
	echo "$ArchiveTime"
	echo "导出ipa时间$[ endTime - beginTime ]秒"
exit 1
fi

endTime=`date +%s`
ExportTime="导出ipa时间$[ endTime - beginTime ]秒"

echo "~~~~~~~~~~~~~~~~配置信息~~~~~~~~~~~~~~~~~~~"
echo "开始执行脚本时间: ${DATE}"
echo "编译模式: ${CONFIGURATION}"
echo "导出ipa配置: ${ExportOptionsPlist}"
echo "打包文件路径: ${ARCHIVEPATH}"
echo "导出ipa路径: ${IPAPATH}"

echo "$ArchiveTime"
echo "$ExportTime"
exit 1