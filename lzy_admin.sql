-- ----------------------------
-- Chat2DB export data , export time: 2024-10-18 16:26:15
-- ----------------------------
SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for table wb_aiuc
-- ----------------------------
DROP TABLE IF EXISTS `wb_aiuc`;
CREATE TABLE `wb_aiuc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `google` int(11) DEFAULT '0',
  `github178` int(11) DEFAULT '0',
  `github102` int(11) DEFAULT '0',
  `ljy` int(11) DEFAULT '0',
  `yanye` int(11) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

-- ----------------------------
-- Records of wb_aiuc
-- ----------------------------
INSERT INTO `wb_aiuc` (`id`,`created_at`,`google`,`github178`,`github102`,`ljy`,`yanye`)  VALUES ('1','2024-04-17 00:00:02','1','1','1','1','1');
INSERT INTO `wb_aiuc` (`id`,`created_at`,`google`,`github178`,`github102`,`ljy`,`yanye`)  VALUES ('2','2024-04-16 00:00:02','150','150','150','150','150');
INSERT INTO `wb_aiuc` (`id`,`created_at`,`google`,`github178`,`github102`,`ljy`,`yanye`)  VALUES ('3','2024-04-17 00:00:02','1','1','1','1','1');
INSERT INTO `wb_aiuc` (`id`,`created_at`,`google`,`github178`,`github102`,`ljy`,`yanye`)  VALUES ('32','2024-08-26 11:57:29','6','0','0','0','0');
INSERT INTO `wb_aiuc` (`id`,`created_at`,`google`,`github178`,`github102`,`ljy`,`yanye`)  VALUES ('33','2024-08-27 13:28:07','6','0','0','0','0');
INSERT INTO `wb_aiuc` (`id`,`created_at`,`google`,`github178`,`github102`,`ljy`,`yanye`)  VALUES ('34','2024-08-28 17:05:07','1','0','0','0','0');
INSERT INTO `wb_aiuc` (`id`,`created_at`,`google`,`github178`,`github102`,`ljy`,`yanye`)  VALUES ('35','2024-08-29 13:20:25','5','0','0','0','0');
INSERT INTO `wb_aiuc` (`id`,`created_at`,`google`,`github178`,`github102`,`ljy`,`yanye`)  VALUES ('36','2024-08-30 17:30:02','15','0','0','0','0');
INSERT INTO `wb_aiuc` (`id`,`created_at`,`google`,`github178`,`github102`,`ljy`,`yanye`)  VALUES ('37','2024-08-31 00:16:28','113','0','0','0','0');
INSERT INTO `wb_aiuc` (`id`,`created_at`,`google`,`github178`,`github102`,`ljy`,`yanye`)  VALUES ('38','2024-09-02 01:23:35','2','0','0','0','0');
INSERT INTO `wb_aiuc` (`id`,`created_at`,`google`,`github178`,`github102`,`ljy`,`yanye`)  VALUES ('39','2024-09-03 00:00:05','6','2','3','1','1');
INSERT INTO `wb_aiuc` (`id`,`created_at`,`google`,`github178`,`github102`,`ljy`,`yanye`)  VALUES ('40','2024-10-02 15:21:32','1','0','0','1','0');
INSERT INTO `wb_aiuc` (`id`,`created_at`,`google`,`github178`,`github102`,`ljy`,`yanye`)  VALUES ('41','2024-10-04 14:09:19','2','1','1','1','1');
INSERT INTO `wb_aiuc` (`id`,`created_at`,`google`,`github178`,`github102`,`ljy`,`yanye`)  VALUES ('42','2024-10-05 11:07:15','1','1','1','0','0');
INSERT INTO `wb_aiuc` (`id`,`created_at`,`google`,`github178`,`github102`,`ljy`,`yanye`)  VALUES ('43','2024-10-06 01:02:56','10','10','10','10','10');
INSERT INTO `wb_aiuc` (`id`,`created_at`,`google`,`github178`,`github102`,`ljy`,`yanye`)  VALUES ('44','2024-10-17 16:16:42','2','2','2','1','1');
INSERT INTO `wb_aiuc` (`id`,`created_at`,`google`,`github178`,`github102`,`ljy`,`yanye`)  VALUES ('45','2024-10-18 11:29:10','26','26','26','26','26');
-- ----------------------------
-- Table structure for table wb_aiuc_keys
-- ----------------------------
DROP TABLE IF EXISTS `wb_aiuc_keys`;
CREATE TABLE `wb_aiuc_keys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `keyName` varchar(255) NOT NULL,
  `keyValue` text,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of wb_aiuc_keys
-- ----------------------------
INSERT INTO `wb_aiuc_keys` (`id`,`created_at`,`keyName`,`keyValue`)  VALUES ('1','2024-04-17 00:56:26','google','sk-vPMwI4Qv32xSXutKVpJ0xsoL9yEoKMEjki8UOrszoq2MHk6j');
INSERT INTO `wb_aiuc_keys` (`id`,`created_at`,`keyName`,`keyValue`)  VALUES ('2','2024-04-17 00:56:37','github178','sk-MYG82vlqX4uyYVMv2qqqrbeUhORTB4WWgEotr2ISUcYKliSg');
INSERT INTO `wb_aiuc_keys` (`id`,`created_at`,`keyName`,`keyValue`)  VALUES ('3','2024-04-17 00:56:46','github102','sk-4EMijL3N2LTlRkVZ8JtkxLCCAbLyNKIr1KjgWrShzxyKHcFI');
INSERT INTO `wb_aiuc_keys` (`id`,`created_at`,`keyName`,`keyValue`)  VALUES ('4','2024-04-17 00:56:53','ljy','sk-ns5vEPDSCOdao8fi4q2mFycccRUKOfHodjgV0RUJMA5PHv0M');
INSERT INTO `wb_aiuc_keys` (`id`,`created_at`,`keyName`,`keyValue`)  VALUES ('5','2024-04-17 00:57:01','yanye','sk-HhqOOePbYD99TzdCOpul1i9kDJVk28r0WSPJbJclCTovKyuC');
-- ----------------------------
-- Table structure for table wb_articles
-- ----------------------------
DROP TABLE IF EXISTS `wb_articles`;
CREATE TABLE `wb_articles` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `title` text NOT NULL,
  `content` longtext NOT NULL,
  `modified_date` datetime DEFAULT NULL,
  `cover_img` char(255) DEFAULT NULL,
  `comments_count` int(11) DEFAULT '0',
  `main` longtext,
  `partial_content` longtext,
  `access_count` int(11) DEFAULT '0',
  PRIMARY KEY (`aid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of wb_articles
-- ----------------------------
INSERT INTO `wb_articles` (`aid`,`uid`,`create_date`,`title`,`content`,`modified_date`,`cover_img`,`comments_count`,`main`,`partial_content`,`access_count`)  VALUES ('1','1','2022-10-25 15:00:00','新时代、新征程','
南京货场疫情已有77例阳性，该毒株平均1人传染18人,奥密克戎BA.5.2进化分支,平均1个感染者可传18人




> [杭州网报道](https://news.hangzhou.com.cn/shxw/content/2022-10/30/content_8386827_2.htm)

## 一是传播速度快、隐匿性强

是目前我国已知传播力最强的流行毒株之一，传播能力较之前的毒株有显著增加。根据有关研究报道，该毒株的基本再生数为18.6，通俗地说就是平均1个感染者在其传染期内能够传染给18人。

## 二是潜伏期和代间距短

疫情发展迅速，感染者从被感染到传染人平均仅为2天时间，最短仅需24小时左右，为疫情防控带来更大难度；同时由于潜伏期较短，少部分感染者发现核酸检测阳性时，已在家庭、社区等人群中造成隐匿性传播。

## 三是免疫逃逸能力强

会造成感染病例较其他毒株相对增多，但接种疫苗对防重症、防死亡的效果仍非常显著。

## 四是病毒复制快

部分病例在发现时CT值较低，也就是病毒载量较高，往往在发现时已造成周围人群感染。

::: warning
  在此我们呼吁市民：<br/>
1.一是保持良好的个人及环境卫生，勤洗手，规范佩戴口罩，打喷嚏或咳嗽时用纸巾掩住口鼻，保持家庭及工作场所通风良好；
2. 二是尽量减少不必要的外出，不聚集，保持社交距离；
3. 三是7日内去过中高风险地区或与确诊患者、无症状感染者有接触史和轨迹交叉的请主动报备，配合落实健康管理；
4. 四是主动及时参加规定频次的区域核酸检测，对及时发现感染者尤为重要；
5. 五是及早全程接种或加强接种新冠疫苗，进一步筑牢免疫屏障；
6. 六是一旦出现发热、咽痛、咳嗽等呼吸道症状及时到发热门诊就医排查和诊疗。
:::
','2022-10-25 15:00:00','/img/articleImages/upload-image1669025783499.jpeg','0','<p data-v-md-line="2">南京货场疫情已有77例阳性，该毒株平均1人传染18人,奥密克戎BA.5.2进化分支,平均1个感染者可传18人</p>
<blockquote data-v-md-line="7">
<p data-v-md-line="7"><a href="https://news.hangzhou.com.cn/shxw/content/2022-10/30/content_8386827_2.htm" target="_blank">杭州网报道<svg xmlns="http://www.w3.org/2000/svg" aria-hidden="true" focusable="false" x="0px" y="0px" viewbox="0 0 100 100" width="15" height="15" class="v-md-svg-outbound"><path fill="currentColor" d="M18.8,85.1h56l0,0c2.2,0,4-1.8,4-4v-32h-8v28h-48v-48h28v-8h-32l0,0c-2.2,0-4,1.8-4,4v56C14.8,83.3,16.6,85.1,18.8,85.1z"></path> <polygon fill="currentColor" points="45.7,48.7 51.3,54.3 77.2,28.5 77.2,37.2 85.2,37.2 85.2,14.9 62.8,14.9 62.8,22.9 71.5,22.9"></polygon></svg></a></p>
</blockquote>
<h2 data-v-md-heading="一是传播速度快、隐匿性强" id="toc-head-8" data-v-md-line="9">一是传播速度快、隐匿性强</h2>
<p data-v-md-line="11">是目前我国已知传播力最强的流行毒株之一，传播能力较之前的毒株有显著增加。根据有关研究报道，该毒株的基本再生数为18.6，通俗地说就是平均1个感染者在其传染期内能够传染给18人。</p>
<h2 data-v-md-heading="二是潜伏期和代间距短" id="toc-head-12" data-v-md-line="13">二是潜伏期和代间距短</h2>
<p data-v-md-line="15">疫情发展迅速，感染者从被感染到传染人平均仅为2天时间，最短仅需24小时左右，为疫情防控带来更大难度；同时由于潜伏期较短，少部分感染者发现核酸检测阳性时，已在家庭、社区等人群中造成隐匿性传播。</p>
<h2 data-v-md-heading="三是免疫逃逸能力强" id="toc-head-16" data-v-md-line="17">三是免疫逃逸能力强</h2>
<p data-v-md-line="19">会造成感染病例较其他毒株相对增多，但接种疫苗对防重症、防死亡的效果仍非常显著。</p>
<h2 data-v-md-heading="四是病毒复制快" id="toc-head-20" data-v-md-line="21">四是病毒复制快</h2>
<p data-v-md-line="23">部分病例在发现时CT值较低，也就是病毒载量较高，往往在发现时已造成周围人群感染。</p>
<div class="v-md-plugin-tip warning"><p class="v-md-plugin-tip-title">注意</p>
<p data-v-md-line="26">在此我们呼吁市民：<br /><br>
1.一是保持良好的个人及环境卫生，勤洗手，规范佩戴口罩，打喷嚏或咳嗽时用纸巾掩住口鼻，保持家庭及工作场所通风良好；<br>
2. 二是尽量减少不必要的外出，不聚集，保持社交距离；<br>
3. 三是7日内去过中高风险地区或与确诊患者、无症状感染者有接触史和轨迹交叉的请主动报备，配合落实健康管理；<br>
4. 四是主动及时参加规定频次的区域核酸检测，对及时发现感染者尤为重要；<br>
5. 五是及早全程接种或加强接种新冠疫苗，进一步筑牢免疫屏障；<br>
6. 六是一旦出现发热、咽痛、咳嗽等呼吸道症状及时到发热门诊就医排查和诊疗。</p>
</div>
','南京货场疫情已有77例阳性，该毒株平均1人传染18人,奥密克戎BA.5.2进化分支,平均1个感染者可传18人','13');
INSERT INTO `wb_articles` (`aid`,`uid`,`create_date`,`title`,`content`,`modified_date`,`cover_img`,`comments_count`,`main`,`partial_content`,`access_count`)  VALUES ('2','1','2022-11-15 22:29:43','Linux语句详解','记录一下Linux常用语句，Linux和windows相比，很多管控都需要用命令来操作。windows以直观的可视化的方式操作，特别适合在桌面端PC上操作执行相应的软件。

而Linux命令行方式的操作，特别是在服务器端编程、管理、运维方面，更加简单、短小、精悍。短短一行组合命令，即可完成在windows需要各种加工、整合的复杂高效的功能操作。 

Linux的终端命令其实跟window系统的终端指令是相似的，很多在window中的指令在Linux也适用，
> 参考地址 [https://blog.csdn.net/liuwei0376/article/details/88245472](https://blog.csdn.net/liuwei0376/article/details/88245472)


|命令|说明|
|-|-|
|ls [指定路径] |查看当前文件夹内容|
|ll [指定路径]|查看当前文件夹的权限|
|touch *** |添加文件|
|rm [选项] [文件或者目录]|查看当前文件夹的权限|
|mkdir ***|添加文件夹 后面跟的是文件名|
|rmdir -r ***  |查看删除指定文件夹，不带-r只能删除内容的文件夹，-r是删除目录不为空的情况  文件夹内容|
|vim|查看当前文件内容|','2022-11-15 22:29:43','/img/articleImages/upload-image1683476849884.jpeg','0','<p data-v-md-line="1">记录一下Linux常用语句，Linux和windows相比，很多管控都需要用命令来操作。windows以直观的可视化的方式操作，特别适合在桌面端PC上操作执行相应的软件。</p>
<p data-v-md-line="3">而Linux命令行方式的操作，特别是在服务器端编程、管理、运维方面，更加简单、短小、精悍。短短一行组合命令，即可完成在windows需要各种加工、整合的复杂高效的功能操作。</p>
<p data-v-md-line="5">Linux的终端命令其实跟window系统的终端指令是相似的，很多在window中的指令在Linux也适用，</p>
<blockquote data-v-md-line="6">
<p data-v-md-line="6">参考地址 <a href="https://blog.csdn.net/liuwei0376/article/details/88245472" target="_blank">https://blog.csdn.net/liuwei0376/article/details/88245472<svg xmlns="http://www.w3.org/2000/svg" aria-hidden="true" focusable="false" x="0px" y="0px" viewbox="0 0 100 100" width="15" height="15" class="v-md-svg-outbound"><path fill="currentColor" d="M18.8,85.1h56l0,0c2.2,0,4-1.8,4-4v-32h-8v28h-48v-48h28v-8h-32l0,0c-2.2,0-4,1.8-4,4v56C14.8,83.3,16.6,85.1,18.8,85.1z"></path> <polygon fill="currentColor" points="45.7,48.7 51.3,54.3 77.2,28.5 77.2,37.2 85.2,37.2 85.2,14.9 62.8,14.9 62.8,22.9 71.5,22.9"></polygon></svg></a></p>
</blockquote>
<table data-v-md-line="9">
<thead>
<tr>
<th>命令</th>
<th>说明</th>
</tr>
</thead>
<tbody>
<tr>
<td>ls [指定路径]</td>
<td>查看当前文件夹内容</td>
</tr>
<tr>
<td>ll [指定路径]</td>
<td>查看当前文件夹的权限</td>
</tr>
<tr>
<td>touch ***</td>
<td>添加文件</td>
</tr>
<tr>
<td>rm [选项] [文件或者目录]</td>
<td>查看当前文件夹的权限</td>
</tr>
<tr>
<td>mkdir ***</td>
<td>添加文件夹 后面跟的是文件名</td>
</tr>
<tr>
<td>rmdir -r ***</td>
<td>查看删除指定文件夹，不带-r只能删除内容的文件夹，-r是删除目录不为空的情况  文件夹内容</td>
</tr>
<tr>
<td>vim</td>
<td>查看当前文件内容</td>
</tr>
</tbody>
</table>
','记录一下Linux常用语句，Linux和windows相比，很多管控都需要用命令来操作。windows以直观的可视化的方式操作，特别适合在桌面端PC上操作执行相应的软件。','31');
INSERT INTO `wb_articles` (`aid`,`uid`,`create_date`,`title`,`content`,`modified_date`,`cover_img`,`comments_count`,`main`,`partial_content`,`access_count`)  VALUES ('15','1','2022-12-26 17:30:10','linux考试前复习记录','本文简介： 考试、考简单的Linux终端指令。我先在这里申明，本文仅是自己参考课件的个人总结，主要用于Linux内核课程考试复习。确实会有很多地方不完善。


## 1. Linux介绍
![点击放大](/api/public/img/articleImages/upload-image1666873015585.png)

额...我好像暂时处于最下面2个级别 暂时只会些简单的命令。


![点击放大](/api/public/img/articleImages/upload-image1666873756049.jpeg)
::: tip
  /root目录是root目录（超级管理员），系统中是最高级用户
  /home目录是当前系统下所有次级用户的主目录，存放着所有用户的数据目录
:::

## 2.新增硬盘
``` vim
磁盘和文件空间 ：fdisk df du
文件目录与管理：cd pwd mkdir rmdir ls cp rm mv
查看文件内容 cat、tac、more、less、head 、tail
文件目录与权限 ：chmod chown chgrp umask
文件查找：which、whereis、locate、find、find
```
### 2.1 物理分盘
- 在关机状态下，在系统外建立物理硬盘，给予20Gb空间
### 2.2 查看硬盘
- 进入Linux终端，输入 su以及密码进入root用户，fdisk -l 查看当前系统所有硬盘情况，如下图可以看见dev/sdb没有进行划分
- ![点击放大](/api/public/img/articleImages/upload-image1666874929806.png)
### 2.3 硬盘分区
- 将sdb硬盘进行分区，分别划分为5GB、6GB大小，可通过命令 fdisk [硬盘路径] 按照指示进行分区，基本回车即可，第四个选择的时候输入你要分区的大小，逐次添加即可，添加完最后不要忘记输入 wq 来保存刚刚的分区。

- ![点击放大](/api/public/img/articleImages/upload-image1666875393992.png)
### 2.4 格式化分区
-  再通过fdisk -l 查看当前系统硬盘是否分区完成，完成后需要格式化、挂载才能真正，先进行格式化输入指令mkfs.ext3[ext3是选择项,多种类型,区分类型] [需要格式化的单独分区路径]   输入之后需要等待一下。
- 相关命令：mkdosfs、mke2fs、mkfs、mkfs.btrfs、mkfs.cramfs、mkfs.ext2、mkfs.ext3、mkfs.ext4、mkfs.fat、mkfs.hfsplus、mkfs.minix、mkfs.msdos、mkfs.ntfs、mkfs.vfat、mkfs.xfs。
- ![点击放大](/api/public/img/articleImages/upload-image1666876472789.png)
### 2.5 挂载分区
- 文件系统的挂载主要有两种方式：手动挂载、系统启动时挂载。
- mount命令（手动挂载）
``` vim
 语法：mount  [选项]  [设备]  [挂载点]  > ~ mount /dev/sdb1 /mnt/1
```
- 功能：将设备挂载到挂载点处，设备是指要挂载的设备名称，挂载点是指文件系统中已经存在的一个目录名。挂载完可以使用df -h 命令来查看挂载状态和硬盘使用量信息。
- 
- ![点击放大](/api/public/img/articleImages/upload-image1666877715939.png)
- 

## 3.文件与目录管理
- ![点击放大](/api/public/img/articleImages/upload-image1666878591836.png)
### 3.1 查看目录内容 
- ![点击放大](/api/public/img/articleImages/upload-image1666879395893.png)

## 4.用户权限
------------------------------------

语法：pwd  [选项]
功能：查看“当前工作目录”的完整路径。一般情况下不带任何参数，如果目录是链接时，pwd -P显示出实际路径，而非使用链接（link）路径。
``` vim
 pwd		//查看当前工作目录的完整路径
 pwd  -L	//目录有链接时，输出链接路径
 pwd  -P	//目录有链接时，pwd -P显示实际路径，而非链接路径
```

------------------------------------

![点击放大](/api/public/img/articleImages/upload-image1666879603545.png)
![点击放大](/api/public/img/articleImages/upload-image1666879622196.png)

------------------------------------
最高权限为 777   使用的是二进制运算来计算等级，
分别代表着User：文件所属者、Group：文件所属组、Other：其他人
Linux 下的每个文件都有以下三种权限
|表示读取|对应的数字|
|-|-|              
|r| 4|        
|w|2|
|x|1|通过 4、2、1 的组合，我们可以得到以下几种权限
------------------------------------
通过 4、2、1 的组合，我们可以得到以下几种权限
|权限等级数字|等级说明|字符表示|
|-|-|-|
|0|没有权限|-|
|4|读取权限|w|
|5|读取和执行权限|rx|
|6|读取和写入权限|rw|
|7|读取、写入和执行权限|rwx|
------------------------------------
修改权限
``` vim
chmod 777 文件名 
```
用 rwxrwxrwx 表示，赋予 geshanzsq.tar 文件所属者、文件所属组和其他人都有读取、写入和执行权限的全部权限，也是最高权限。

Linux 修改目录下的所有文件权限的命令为
``` vim
chmod -R 764 目录名
```
## 5.终端操作
::: tip 任务需求：
1. 将系统进程信息保存到文件process.txt
2. 顺序显示完文件process.txt 
3. 一页一页显示文件process.txt
4. 显示文件process.txt前8行
:::

**ps [选项] 查看当前终端进程**
|选项|功能|
|-|-|
|a|显示包括终端的进程|
|u|显示进程所有者的信息|
|x|显示所有包含了不连接终端的进程（如守护进程）|
|p|显示指定进程ID的信息|
|-a|显示当前终端下执行的进程|
|-u|此参数的效果和指定-U参数相同|
|-U|列出属于该用户的进程的状况，也可使用用户名称来指定|
|-e|显示所有进程|
|-f|显示进程的父进程|
|-l|以长列表的方式显示信息|
|-o format|显示指定字段的信息，其中format是空格或逗号分隔的字段列表,示例如下： </br>ps -o "pid comm %cpu %mem state tty"</br>ps -o pid,comm,%cpu,%mem,state,tty|

**需求实现代码**
``` vim
ps -e > process.txt  //1.将所有任务进程 添加进process.txt中
cat process.txt      //2.把process.txt 顺序连接后传到基本输出中
more process.txt     //3.把process.txt 一页一页的显示出来(只能往下看，不能返回上一页)
less process.txt     //把process.txt 一页一页的显示出来(可以前后翻页 不同于more，通过上下键进行翻页)
nl process.txt       //process.txt 输出时带行号，但是不对空行编号
head -8 process.txt  //4.显示文件process.txt的前8行内容
tail -8 process.txt  //显示文件process.txt的后8行内容
wc process.txt       //查看文件的字节数、字数、行数、以及名称
```
## 6.目录与文件管理

::: tip 任务需求：
1. 进入主目录，创建目录 school/department
2. 创建目录 /data/school/department
3. 在主目录的子目录school/department创建文件class1.txt
4. 并将该文件移动到 /data/school/department
5. 删除主目录的子目录school
6. 删除目录 /data
:::
文件与目录的创建、复制、删除、转移及重命名：touch、mkdir、rmdir、cp、mv、rm
rmdir [选项] [目录] 删除目录 选项支持 -p 递归删除目录，只能删除空目录。提示：失败，目录非空  
rm [选项] [目录] 删除目录以及文件，内置条件如下 
|选项|功能|
|-|-|
|-d|直接把欲删除的目录的硬链接数据删成0,同时删成该目录|
|-f|强制删成文件或目录|
|-i|删除既有文件或目录之前先询问用户，是否要进行交互式删除|
|-r或-R|递归处理，将指定目录下的所有文件及子目录一并处理|
|-v|显示命令执行过程，删除之中出现进度报告。在删除许多文件时较有用|
``` vim
cd ~                                   //1.进入主目录，
mkdir -p school/department             //1.创建目录 school/department
mkdir -p /data/school/department       //2.创建目录 /data/school/department
touch class1.txt                       //3.在主目录的子目录school/department创建文件class1.txt
mv class1.txt /data/school/department  //4.并将该文件移动到 /data/school/department
rm -r ~/school                         //5.删除主目录的子目录school
rm -r /data                            //6.删除目录 /data
```

','2024-02-14 23:33:16','/img/articleImages/upload-image1683476832650.jpeg','0','<p data-v-md-line="1">本文简介： 考试、考简单的Linux终端指令。我先在这里申明，本文仅是自己参考课件的个人总结，主要用于Linux内核课程考试复习。确实会有很多地方不完善。</p>
<h2 data-v-md-heading="_1-linux介绍" id="toc-head-3" data-v-md-line="4">1. Linux介绍</h2>
<p data-v-md-line="5"><img src="/api/public/img/articleImages/upload-image1666873015585.png" alt="点击放大"></p>
<p data-v-md-line="7">额…我好像暂时处于最下面2个级别 暂时只会些简单的命令。</p>
<p data-v-md-line="10"><img src="/api/public/img/articleImages/upload-image1666873756049.jpeg" alt="点击放大"></p>
<div class="v-md-plugin-tip tip"><p class="v-md-plugin-tip-title">提示</p>
<p data-v-md-line="12">/root目录是root目录（超级管理员），系统中是最高级用户<br>
/home目录是当前系统下所有次级用户的主目录，存放着所有用户的数据目录</p>
</div>
<h2 data-v-md-heading="_2-新增硬盘" id="toc-head-15" data-v-md-line="16">2.新增硬盘</h2>
<div data-v-md-line="17"><div class="v-md-pre-wrapper copy-code-mode v-md-pre-wrapper-vim line-numbers-mode"><pre class="v-md-prism-vim"><code>磁盘和文件空间 ：fdisk df du
文件目录与管理：<span class="token keyword">cd</span> <span class="token keyword">pwd</span> mkdir rmdir <span class="token keyword">ls</span> <span class="token keyword">cp</span> rm mv
查看文件内容 <span class="token keyword">cat</span>、tac、<span class="token builtin">more</span>、less、head 、tail
文件目录与权限 ：chmod chown chgrp umask
文件查找：which、whereis、locate、<span class="token keyword">find</span>、<span class="token keyword">find</span>
</code></pre>
<div class="line-numbers-wrapper"><span class="line-number">1</span><br><span class="line-number">2</span><br><span class="line-number">3</span><br><span class="line-number">4</span><br><span class="line-number">5</span><br></div>
    <button class="v-md-copy-code-btn" type="button">
      <i>
        <svg viewbox="64 64 896 896" focusable="false" data-icon="copy" width="1em" height="1em" fill="currentColor" aria-hidden="true">
          <path d="M832 64H296c-4.4 0-8 3.6-8 8v56c0 4.4 3.6 8 8 8h496v688c0 4.4 3.6 8 8 8h56c4.4 0 8-3.6 8-8V96c0-17.7-14.3-32-32-32zM704 192H192c-17.7 0-32 14.3-32 32v530.7c0 8.5 3.4 16.6 9.4 22.6l173.3 173.3c2.2 2.2 4.7 4 7.4 5.5v1.9h4.2c3.5 1.3 7.2 2 11 2H704c17.7 0 32-14.3 32-32V224c0-17.7-14.3-32-32-32zM350 856.2L263.9 770H350v86.2zM664 888H414V746c0-22.1-17.9-40-40-40H232V264h432v624z"></path>
        </svg>
      </i>
    </button></div></div><h3 data-v-md-heading="_2-1-物理分盘" id="toc-head-23" data-v-md-line="24">2.1 物理分盘</h3>
<ul data-v-md-line="25">
<li>在关机状态下，在系统外建立物理硬盘，给予20Gb空间</li>
</ul>
<h3 data-v-md-heading="_2-2-查看硬盘" id="toc-head-25" data-v-md-line="26">2.2 查看硬盘</h3>
<ul data-v-md-line="27">
<li>进入Linux终端，输入 su以及密码进入root用户，fdisk -l 查看当前系统所有硬盘情况，如下图可以看见dev/sdb没有进行划分</li>
<li><img src="/api/public/img/articleImages/upload-image1666874929806.png" alt="点击放大"></li>
</ul>
<h3 data-v-md-heading="_2-3-硬盘分区" id="toc-head-28" data-v-md-line="29">2.3 硬盘分区</h3>
<ul data-v-md-line="30">
<li>
<p data-v-md-line="30">将sdb硬盘进行分区，分别划分为5GB、6GB大小，可通过命令 fdisk [硬盘路径] 按照指示进行分区，基本回车即可，第四个选择的时候输入你要分区的大小，逐次添加即可，添加完最后不要忘记输入 wq 来保存刚刚的分区。</p>
</li>
<li>
<p data-v-md-line="32"><img src="/api/public/img/articleImages/upload-image1666875393992.png" alt="点击放大"></p>
</li>
</ul>
<h3 data-v-md-heading="_2-4-格式化分区" id="toc-head-32" data-v-md-line="33">2.4 格式化分区</h3>
<ul data-v-md-line="34">
<li>再通过fdisk -l 查看当前系统硬盘是否分区完成，完成后需要格式化、挂载才能真正，先进行格式化输入指令mkfs.ext3[ext3是选择项,多种类型,区分类型] [需要格式化的单独分区路径]   输入之后需要等待一下。</li>
<li>相关命令：mkdosfs、mke2fs、mkfs、mkfs.btrfs、mkfs.cramfs、mkfs.ext2、mkfs.ext3、mkfs.ext4、mkfs.fat、mkfs.hfsplus、mkfs.minix、mkfs.msdos、mkfs.ntfs、mkfs.vfat、mkfs.xfs。</li>
<li><img src="/api/public/img/articleImages/upload-image1666876472789.png" alt="点击放大"></li>
</ul>
<h3 data-v-md-heading="_2-5-挂载分区" id="toc-head-36" data-v-md-line="37">2.5 挂载分区</h3>
<ul data-v-md-line="38">
<li>文件系统的挂载主要有两种方式：手动挂载、系统启动时挂载。</li>
<li>mount命令（手动挂载）</li>
</ul>
<div data-v-md-line="40"><div class="v-md-pre-wrapper copy-code-mode v-md-pre-wrapper-vim line-numbers-mode"><pre class="v-md-prism-vim"><code> 语法：mount  <span class="token punctuation">[</span>选项<span class="token punctuation">]</span>  <span class="token punctuation">[</span>设备<span class="token punctuation">]</span>  <span class="token punctuation">[</span>挂载点<span class="token punctuation">]</span>  <span class="token operator">&gt;</span> ~ mount <span class="token operator">/</span>dev<span class="token operator">/</span>sdb1 <span class="token operator">/</span>mnt<span class="token operator">/</span><span class="token number">1</span>
</code></pre>
<div class="line-numbers-wrapper"><span class="line-number">1</span><br></div>
    <button class="v-md-copy-code-btn" type="button">
      <i>
        <svg viewbox="64 64 896 896" focusable="false" data-icon="copy" width="1em" height="1em" fill="currentColor" aria-hidden="true">
          <path d="M832 64H296c-4.4 0-8 3.6-8 8v56c0 4.4 3.6 8 8 8h496v688c0 4.4 3.6 8 8 8h56c4.4 0 8-3.6 8-8V96c0-17.7-14.3-32-32-32zM704 192H192c-17.7 0-32 14.3-32 32v530.7c0 8.5 3.4 16.6 9.4 22.6l173.3 173.3c2.2 2.2 4.7 4 7.4 5.5v1.9h4.2c3.5 1.3 7.2 2 11 2H704c17.7 0 32-14.3 32-32V224c0-17.7-14.3-32-32-32zM350 856.2L263.9 770H350v86.2zM664 888H414V746c0-22.1-17.9-40-40-40H232V264h432v624z"></path>
        </svg>
      </i>
    </button></div></div><ul data-v-md-line="43">
<li>功能：将设备挂载到挂载点处，设备是指要挂载的设备名称，挂载点是指文件系统中已经存在的一个目录名。挂载完可以使用df -h 命令来查看挂载状态和硬盘使用量信息。</li>
<li></li>
<li><img src="/api/public/img/articleImages/upload-image1666877715939.png" alt="点击放大"></li>
<li></li>
</ul>
<h2 data-v-md-heading="_3-文件与目录管理" id="toc-head-47" data-v-md-line="48">3.文件与目录管理</h2>
<ul data-v-md-line="49">
<li><img src="/api/public/img/articleImages/upload-image1666878591836.png" alt="点击放大"></li>
</ul>
<h3 data-v-md-heading="_3-1-查看目录内容" id="toc-head-49" data-v-md-line="50">3.1 查看目录内容</h3>
<ul data-v-md-line="51">
<li><img src="/api/public/img/articleImages/upload-image1666879395893.png" alt="点击放大"></li>
</ul>
<h2 data-v-md-heading="_4-用户权限" id="toc-head-52" data-v-md-line="53">4.用户权限</h2>
<hr data-v-md-line="54">
<p data-v-md-line="56">语法：pwd  [选项]<br>
功能：查看“当前工作目录”的完整路径。一般情况下不带任何参数，如果目录是链接时，pwd -P显示出实际路径，而非使用链接（link）路径。</p>
<div data-v-md-line="58"><div class="v-md-pre-wrapper copy-code-mode v-md-pre-wrapper-vim line-numbers-mode"><pre class="v-md-prism-vim"><code> <span class="token keyword">pwd</span>		<span class="token operator">/</span><span class="token operator">/</span>查看当前工作目录的完整路径
 <span class="token keyword">pwd</span>  <span class="token operator">-</span>L	<span class="token operator">/</span><span class="token operator">/</span>目录有链接时，输出链接路径
 <span class="token keyword">pwd</span>  <span class="token operator">-</span><span class="token keyword">P</span>	<span class="token operator">/</span><span class="token operator">/</span>目录有链接时，<span class="token keyword">pwd</span> <span class="token operator">-</span><span class="token keyword">P</span>显示实际路径，而非链接路径
</code></pre>
<div class="line-numbers-wrapper"><span class="line-number">1</span><br><span class="line-number">2</span><br><span class="line-number">3</span><br></div>
    <button class="v-md-copy-code-btn" type="button">
      <i>
        <svg viewbox="64 64 896 896" focusable="false" data-icon="copy" width="1em" height="1em" fill="currentColor" aria-hidden="true">
          <path d="M832 64H296c-4.4 0-8 3.6-8 8v56c0 4.4 3.6 8 8 8h496v688c0 4.4 3.6 8 8 8h56c4.4 0 8-3.6 8-8V96c0-17.7-14.3-32-32-32zM704 192H192c-17.7 0-32 14.3-32 32v530.7c0 8.5 3.4 16.6 9.4 22.6l173.3 173.3c2.2 2.2 4.7 4 7.4 5.5v1.9h4.2c3.5 1.3 7.2 2 11 2H704c17.7 0 32-14.3 32-32V224c0-17.7-14.3-32-32-32zM350 856.2L263.9 770H350v86.2zM664 888H414V746c0-22.1-17.9-40-40-40H232V264h432v624z"></path>
        </svg>
      </i>
    </button></div></div><hr data-v-md-line="64">
<p data-v-md-line="66"><img src="/api/public/img/articleImages/upload-image1666879603545.png" alt="点击放大"><br>
<img src="/api/public/img/articleImages/upload-image1666879622196.png" alt="点击放大"></p>
<hr data-v-md-line="69">
<p data-v-md-line="70">最高权限为 777   使用的是二进制运算来计算等级，<br>
分别代表着User：文件所属者、Group：文件所属组、Other：其他人<br>
Linux 下的每个文件都有以下三种权限</p>
<table data-v-md-line="73">
<thead>
<tr>
<th>表示读取</th>
<th>对应的数字</th>
</tr>
</thead>
<tbody>
<tr>
<td>r</td>
<td>4</td>
</tr>
<tr>
<td>w</td>
<td>2</td>
</tr>
<tr>
<td>x</td>
<td>1</td>
</tr>
</tbody>
</table>
<hr data-v-md-line="78">
<p data-v-md-line="79">通过 4、2、1 的组合，我们可以得到以下几种权限</p>
<table data-v-md-line="80">
<thead>
<tr>
<th>权限等级数字</th>
<th>等级说明</th>
<th>字符表示</th>
</tr>
</thead>
<tbody>
<tr>
<td>0</td>
<td>没有权限</td>
<td>-</td>
</tr>
<tr>
<td>4</td>
<td>读取权限</td>
<td>w</td>
</tr>
<tr>
<td>5</td>
<td>读取和执行权限</td>
<td>rx</td>
</tr>
<tr>
<td>6</td>
<td>读取和写入权限</td>
<td>rw</td>
</tr>
<tr>
<td>7</td>
<td>读取、写入和执行权限</td>
<td>rwx</td>
</tr>
</tbody>
</table>
<hr data-v-md-line="87">
<p data-v-md-line="88">修改权限</p>
<div data-v-md-line="89"><div class="v-md-pre-wrapper copy-code-mode v-md-pre-wrapper-vim line-numbers-mode"><pre class="v-md-prism-vim"><code>chmod <span class="token number">777</span> 文件名 
</code></pre>
<div class="line-numbers-wrapper"><span class="line-number">1</span><br></div>
    <button class="v-md-copy-code-btn" type="button">
      <i>
        <svg viewbox="64 64 896 896" focusable="false" data-icon="copy" width="1em" height="1em" fill="currentColor" aria-hidden="true">
          <path d="M832 64H296c-4.4 0-8 3.6-8 8v56c0 4.4 3.6 8 8 8h496v688c0 4.4 3.6 8 8 8h56c4.4 0 8-3.6 8-8V96c0-17.7-14.3-32-32-32zM704 192H192c-17.7 0-32 14.3-32 32v530.7c0 8.5 3.4 16.6 9.4 22.6l173.3 173.3c2.2 2.2 4.7 4 7.4 5.5v1.9h4.2c3.5 1.3 7.2 2 11 2H704c17.7 0 32-14.3 32-32V224c0-17.7-14.3-32-32-32zM350 856.2L263.9 770H350v86.2zM664 888H414V746c0-22.1-17.9-40-40-40H232V264h432v624z"></path>
        </svg>
      </i>
    </button></div></div><p data-v-md-line="92">用 rwxrwxrwx 表示，赋予 geshanzsq.tar 文件所属者、文件所属组和其他人都有读取、写入和执行权限的全部权限，也是最高权限。</p>
<p data-v-md-line="94">Linux 修改目录下的所有文件权限的命令为</p>
<div data-v-md-line="95"><div class="v-md-pre-wrapper copy-code-mode v-md-pre-wrapper-vim line-numbers-mode"><pre class="v-md-prism-vim"><code>chmod <span class="token operator">-</span>R <span class="token number">764</span> 目录名
</code></pre>
<div class="line-numbers-wrapper"><span class="line-number">1</span><br></div>
    <button class="v-md-copy-code-btn" type="button">
      <i>
        <svg viewbox="64 64 896 896" focusable="false" data-icon="copy" width="1em" height="1em" fill="currentColor" aria-hidden="true">
          <path d="M832 64H296c-4.4 0-8 3.6-8 8v56c0 4.4 3.6 8 8 8h496v688c0 4.4 3.6 8 8 8h56c4.4 0 8-3.6 8-8V96c0-17.7-14.3-32-32-32zM704 192H192c-17.7 0-32 14.3-32 32v530.7c0 8.5 3.4 16.6 9.4 22.6l173.3 173.3c2.2 2.2 4.7 4 7.4 5.5v1.9h4.2c3.5 1.3 7.2 2 11 2H704c17.7 0 32-14.3 32-32V224c0-17.7-14.3-32-32-32zM350 856.2L263.9 770H350v86.2zM664 888H414V746c0-22.1-17.9-40-40-40H232V264h432v624z"></path>
        </svg>
      </i>
    </button></div></div><h2 data-v-md-heading="_5-终端操作" id="toc-head-97" data-v-md-line="98">5.终端操作</h2>
<div class="v-md-plugin-tip tip"><p class="v-md-plugin-tip-title">任务需求：</p>
<ol data-v-md-line="100">
<li>将系统进程信息保存到文件process.txt</li>
<li>顺序显示完文件process.txt</li>
<li>一页一页显示文件process.txt</li>
<li>显示文件process.txt前8行</li>
</ol>
</div>
<p data-v-md-line="106"><strong>ps [选项] 查看当前终端进程</strong></p>
<table data-v-md-line="107">
<thead>
<tr>
<th>选项</th>
<th>功能</th>
</tr>
</thead>
<tbody>
<tr>
<td>a</td>
<td>显示包括终端的进程</td>
</tr>
<tr>
<td>u</td>
<td>显示进程所有者的信息</td>
</tr>
<tr>
<td>x</td>
<td>显示所有包含了不连接终端的进程（如守护进程）</td>
</tr>
<tr>
<td>p</td>
<td>显示指定进程ID的信息</td>
</tr>
<tr>
<td>-a</td>
<td>显示当前终端下执行的进程</td>
</tr>
<tr>
<td>-u</td>
<td>此参数的效果和指定-U参数相同</td>
</tr>
<tr>
<td>-U</td>
<td>列出属于该用户的进程的状况，也可使用用户名称来指定</td>
</tr>
<tr>
<td>-e</td>
<td>显示所有进程</td>
</tr>
<tr>
<td>-f</td>
<td>显示进程的父进程</td>
</tr>
<tr>
<td>-l</td>
<td>以长列表的方式显示信息</td>
</tr>
<tr>
<td>-o format</td>
<td>显示指定字段的信息，其中format是空格或逗号分隔的字段列表,示例如下： </br>ps -o “pid comm %cpu %mem state tty”</br>ps -o pid,comm,%cpu,%mem,state,tty</td>
</tr>
</tbody>
</table>
<p data-v-md-line="121"><strong>需求实现代码</strong></p>
<div data-v-md-line="122"><div class="v-md-pre-wrapper copy-code-mode v-md-pre-wrapper-vim line-numbers-mode"><pre class="v-md-prism-vim"><code><span class="token keyword">ps</span> <span class="token operator">-</span><span class="token keyword">e</span> <span class="token operator">&gt;</span> process<span class="token operator">.</span>txt  <span class="token operator">/</span><span class="token operator">/</span><span class="token number">1</span><span class="token operator">.</span>将所有任务进程 添加进process<span class="token operator">.</span>txt中
<span class="token keyword">cat</span> process<span class="token operator">.</span>txt      <span class="token operator">/</span><span class="token operator">/</span><span class="token number">2</span><span class="token operator">.</span>把process<span class="token operator">.</span>txt 顺序连接后传到基本输出中
<span class="token builtin">more</span> process<span class="token operator">.</span>txt     <span class="token operator">/</span><span class="token operator">/</span><span class="token number">3</span><span class="token operator">.</span>把process<span class="token operator">.</span>txt 一页一页的显示出来<span class="token punctuation">(</span>只能往下看，不能返回上一页<span class="token punctuation">)</span>
less process<span class="token operator">.</span>txt     <span class="token operator">/</span><span class="token operator">/</span>把process<span class="token operator">.</span>txt 一页一页的显示出来<span class="token punctuation">(</span>可以前后翻页 不同于<span class="token builtin">more</span>，通过上下键进行翻页<span class="token punctuation">)</span>
nl process<span class="token operator">.</span>txt       <span class="token operator">/</span><span class="token operator">/</span>process<span class="token operator">.</span>txt 输出时带行号，但是不对空行编号
head <span class="token operator">-</span><span class="token number">8</span> process<span class="token operator">.</span>txt  <span class="token operator">/</span><span class="token operator">/</span><span class="token number">4</span><span class="token operator">.</span>显示文件process<span class="token operator">.</span>txt的前<span class="token number">8</span>行内容
tail <span class="token operator">-</span><span class="token number">8</span> process<span class="token operator">.</span>txt  <span class="token operator">/</span><span class="token operator">/</span>显示文件process<span class="token operator">.</span>txt的后<span class="token number">8</span>行内容
<span class="token builtin">wc</span> process<span class="token operator">.</span>txt       <span class="token operator">/</span><span class="token operator">/</span>查看文件的字节数、字数、行数、以及名称
</code></pre>
<div class="line-numbers-wrapper"><span class="line-number">1</span><br><span class="line-number">2</span><br><span class="line-number">3</span><br><span class="line-number">4</span><br><span class="line-number">5</span><br><span class="line-number">6</span><br><span class="line-number">7</span><br><span class="line-number">8</span><br></div>
    <button class="v-md-copy-code-btn" type="button">
      <i>
        <svg viewbox="64 64 896 896" focusable="false" data-icon="copy" width="1em" height="1em" fill="currentColor" aria-hidden="true">
          <path d="M832 64H296c-4.4 0-8 3.6-8 8v56c0 4.4 3.6 8 8 8h496v688c0 4.4 3.6 8 8 8h56c4.4 0 8-3.6 8-8V96c0-17.7-14.3-32-32-32zM704 192H192c-17.7 0-32 14.3-32 32v530.7c0 8.5 3.4 16.6 9.4 22.6l173.3 173.3c2.2 2.2 4.7 4 7.4 5.5v1.9h4.2c3.5 1.3 7.2 2 11 2H704c17.7 0 32-14.3 32-32V224c0-17.7-14.3-32-32-32zM350 856.2L263.9 770H350v86.2zM664 888H414V746c0-22.1-17.9-40-40-40H232V264h432v624z"></path>
        </svg>
      </i>
    </button></div></div><h2 data-v-md-heading="_6-目录与文件管理" id="toc-head-131" data-v-md-line="132">6.目录与文件管理</h2>
<div class="v-md-plugin-tip tip"><p class="v-md-plugin-tip-title">任务需求：</p>
<ol data-v-md-line="135">
<li>进入主目录，创建目录 school/department</li>
<li>创建目录 /data/school/department</li>
<li>在主目录的子目录school/department创建文件class1.txt</li>
<li>并将该文件移动到 /data/school/department</li>
<li>删除主目录的子目录school</li>
<li>删除目录 /data</li>
</ol>
</div>
<p data-v-md-line="142">文件与目录的创建、复制、删除、转移及重命名：touch、mkdir、rmdir、cp、mv、rm<br>
rmdir [选项] [目录] 删除目录 选项支持 -p 递归删除目录，只能删除空目录。提示：失败，目录非空<br>
rm [选项] [目录] 删除目录以及文件，内置条件如下</p>
<table data-v-md-line="145">
<thead>
<tr>
<th>选项</th>
<th>功能</th>
</tr>
</thead>
<tbody>
<tr>
<td>-d</td>
<td>直接把欲删除的目录的硬链接数据删成0,同时删成该目录</td>
</tr>
<tr>
<td>-f</td>
<td>强制删成文件或目录</td>
</tr>
<tr>
<td>-i</td>
<td>删除既有文件或目录之前先询问用户，是否要进行交互式删除</td>
</tr>
<tr>
<td>-r或-R</td>
<td>递归处理，将指定目录下的所有文件及子目录一并处理</td>
</tr>
<tr>
<td>-v</td>
<td>显示命令执行过程，删除之中出现进度报告。在删除许多文件时较有用</td>
</tr>
</tbody>
</table>
<div data-v-md-line="152"><div class="v-md-pre-wrapper copy-code-mode v-md-pre-wrapper-vim line-numbers-mode"><pre class="v-md-prism-vim"><code><span class="token keyword">cd</span> ~                                   <span class="token operator">/</span><span class="token operator">/</span><span class="token number">1</span><span class="token operator">.</span>进入主目录，
mkdir <span class="token operator">-</span><span class="token keyword">p</span> school<span class="token operator">/</span>department             <span class="token operator">/</span><span class="token operator">/</span><span class="token number">1</span><span class="token operator">.</span>创建目录 school<span class="token operator">/</span>department
mkdir <span class="token operator">-</span><span class="token keyword">p</span> <span class="token operator">/</span>data<span class="token operator">/</span>school<span class="token operator">/</span>department       <span class="token operator">/</span><span class="token operator">/</span><span class="token number">2</span><span class="token operator">.</span>创建目录 <span class="token operator">/</span>data<span class="token operator">/</span>school<span class="token operator">/</span>department
touch class1<span class="token operator">.</span>txt                       <span class="token operator">/</span><span class="token operator">/</span><span class="token number">3</span><span class="token operator">.</span>在主目录的子目录school<span class="token operator">/</span>department创建文件class1<span class="token operator">.</span>txt
mv class1<span class="token operator">.</span>txt <span class="token operator">/</span>data<span class="token operator">/</span>school<span class="token operator">/</span>department  <span class="token operator">/</span><span class="token operator">/</span><span class="token number">4</span><span class="token operator">.</span>并将该文件移动到 <span class="token operator">/</span>data<span class="token operator">/</span>school<span class="token operator">/</span>department
rm <span class="token operator">-</span><span class="token keyword">r</span> ~<span class="token operator">/</span>school                         <span class="token operator">/</span><span class="token operator">/</span><span class="token number">5</span><span class="token operator">.</span>删除主目录的子目录school
rm <span class="token operator">-</span><span class="token keyword">r</span> <span class="token operator">/</span>data                            <span class="token operator">/</span><span class="token operator">/</span><span class="token number">6</span><span class="token operator">.</span>删除目录 <span class="token operator">/</span>data
</code></pre>
<div class="line-numbers-wrapper"><span class="line-number">1</span><br><span class="line-number">2</span><br><span class="line-number">3</span><br><span class="line-number">4</span><br><span class="line-number">5</span><br><span class="line-number">6</span><br><span class="line-number">7</span><br></div>
    <button class="v-md-copy-code-btn" type="button">
      <i>
        <svg viewbox="64 64 896 896" focusable="false" data-icon="copy" width="1em" height="1em" fill="currentColor" aria-hidden="true">
          <path d="M832 64H296c-4.4 0-8 3.6-8 8v56c0 4.4 3.6 8 8 8h496v688c0 4.4 3.6 8 8 8h56c4.4 0 8-3.6 8-8V96c0-17.7-14.3-32-32-32zM704 192H192c-17.7 0-32 14.3-32 32v530.7c0 8.5 3.4 16.6 9.4 22.6l173.3 173.3c2.2 2.2 4.7 4 7.4 5.5v1.9h4.2c3.5 1.3 7.2 2 11 2H704c17.7 0 32-14.3 32-32V224c0-17.7-14.3-32-32-32zM350 856.2L263.9 770H350v86.2zM664 888H414V746c0-22.1-17.9-40-40-40H232V264h432v624z"></path>
        </svg>
      </i>
    </button></div></div>','本文简介： 考试、考简单的Linux终端指令。我先在这里申明，本文仅是自己参考课件的个人总结，主要用于Linux内核课程考试复习。确实会有很多地方不完善。','130');
INSERT INTO `wb_articles` (`aid`,`uid`,`create_date`,`title`,`content`,`modified_date`,`cover_img`,`comments_count`,`main`,`partial_content`,`access_count`)  VALUES ('16','1','2023-07-23 04:22:24','vue3+ts+vite、node+ts+webpack 打包过程、以及对打包优化的理解','本文记录了使用vue3+vite和node.ts的打包过程，为了解决路径前后打包的问题


## vue3+ts+vite
1. 安装vite的插件 vite-plugin-env-compatible
``` bash
npm i vite-plugin-env-compatible 
yarn add vite-plugin-env-compatible
pnpm add vite-plugin-env-compatible
ni vite-plugin-env-compatible 
```
再到 vite.config.ts 中进行插件配置
``` ts
import envCompatible from "vite-plugin-env-compatible";



export default defineConfig(() => {
  return {
    envDir: path.resolve(__dirname, "./env"),
    Plugins: [
      vue(),
      envCompatible(),
    ],
  }
})
```
2. 在项目根目录创建.env和.env.production文件，其中分别配置有开发状态下和打包之后要上线的的接口路径。
.env文件文件内容如下： ==这里我用到了vite的proxy代理 api，这里可以用服务器地址==
``` 
VITE_BASE_URL=/api  
```
.env.production文件文件内容如下： ==这里使用的是你打包之后需要上传服务器的后台地址（自己注意结尾斜杠）==
``` 
VITE_BASE_URL=http:47.113.222.95:8089
```
3. 在vue项目中使用配置路径  (不需要导入任何东西，直接使用import.meta.env来获取即可)
``` ts
const api = import.meta.env.VITE_BASE_URL
http("get", api + "/proxyApis/jinrishici/info", headers).then((res: ipGetType) => {
    //将个人信息存入localStorage，避免每次刷新都要请求接口
    setLocalStorage("weatherData", res.data)
});


```
4. 这个打包的缺点就是不能在css中使用动态地址，必须通过js渲染（vue的动态style）


## node+ts+webpack
使用webpack的原因是，网上用vite打包node的参考比较少。webpack对比vite确实不是很便捷，暂时只能做到打包，没办法解决打包之后的路径的问题，只能手动去更换线上路径，比较麻烦，后面想办法再进行优化吧。
以下是打包过程：
1. 安装webpack、ts-loader、typescript
``` bash
npm i webpack webpack-cli ts-loader typescript
yarn add webpack webpack-cli ts-loader typescript
pnpm add webpack webpack-cli ts-loader typescript
ni webpack webpack-cli ts-loader typescript
``` 
2. 然后在==webpack.config.js==进行配置，ts文件使用ts-loader进行处理。
``` js
// webpack.config.js
const path = require("path");



module.exports = {
    entry: "./app.ts",
    target: "node",
    output: {
        filename: "bundle.js",
        path: path.resolve(__dirname, "dist"), // 输出文件夹路径
        publicPath: "/" // 公共路径，用于处理静态资源的访问路径
    },
    resolve: {
        extensions: [".ts", ".js"],
    },
    module: {
        rules: [
            {
                test: /.ts$/,
                use: "ts-loader",
                exclude: /node_modules/,
            },
        ],
    },
    optimization: {
        minimize: false
    },
    mode: "production" // 生产模式，会对代码进行优化
};


```
3. 运行指令编写 → package.json 
``` json
"scripts": {
    "server": "ts-node-dev  ./app.ts --mode dev",
    "tsc": "tsc",
    "build": "webpack --mode production",
    "rmjs": "ts-node-dev utilsPublic/rmjs.ts",
    "perfectBuild": "tsc && webpack --mode production && ts-node-dev utilsPublic/rmjs.ts",
    "fontUnicode": "ts-node-dev utilsPublic/unique.ts"
},
```
tsc : 将ts的代码编译为js
build ：使用webpack将项目中的js进行打包
rmjs : 将编译ts留下的js进行删除（自定义方法，不删除不行啊，在开发模式每次修改内容都不生效）
perfectBuild ： 将node.ts打包一步到位 先转译ts→进行打包→删除js
4. 补充一份删除js的代码  文件路径：utilsPublic/rmjs.ts 自行修改一下即可
``` ts
//node 删除项目中所有js文件
import fs from "node:fs"
import path from "node:path";



const files = fs.readdirSync(path.resolve(__dirname, "../"));


const exclude = [
    "node_modules",
    ".git",
    ".idea",
    "dist",
    "public",
    "webpack.config.js"
]

// 使用递归寻找出所有的js文件
const findJs = (files: string[], basePath: string): string[] => {
    const jsFiles: string[] = [];


    files.forEach((item) => {
        const fullPath = path.join(basePath, item); // 获取文件的完整路径
        if (exclude.includes(item)) return;


        const stat = fs.statSync(fullPath);


        if (stat.isDirectory()) {
            const dirFiles = fs.readdirSync(fullPath);


            jsFiles.push(...findJs(dirFiles, fullPath)); // 传入完整路径递归查找子目录
        } else {
            if (item.endsWith(".js")) {
                jsFiles.push(fullPath);


            }
        }
    });


    return jsFiles;


};


const jsFiles = findJs(files, path.resolve(__dirname, "../"));   


jsFiles.forEach((item) => {
    fs.unlinkSync(item);


})
```

5. 以上就是node+ts+webpack打包的全过程，缺点十分明显，没办法解决打包前后的路径问题，服务器跟本地的地址切换不方便，得手动去更换。还有就是没办法将静态资源public放入打包的dist文件夹中，得自己去复制一份。

## 总结
写这篇文章的时候很奇怪，不知道为什么快速的添加内容在markdown组件中就会将中文内容转为英文的。比如说快速的敲击几下空格，它会将你选中的内容，或者部分内容转换为英文的。不知道是不是markdown组件自带的。
   ![点击放大](/api/public/img/articleImages/upload-image1690188380598.png)
![点击放大](/api/public/img/articleImages/upload-image1690188389965.png)
','2024-02-14 23:17:37','/img/articleImages/upload-image1690114333197.png','0','<p data-v-md-line="1">本文记录了使用vue3+vite和node.ts的打包过程，为了解决路径前后打包的问题</p>
<h2 data-v-md-heading="vue3-ts-vite" id="toc-head-3" data-v-md-line="4">vue3+ts+vite</h2>
<ol data-v-md-line="5">
<li>安装vite的插件 vite-plugin-env-compatible</li>
</ol>
<div data-v-md-line="6"><div class="v-md-pre-wrapper copy-code-mode v-md-pre-wrapper-bash line-numbers-mode"><pre class="v-md-prism-bash"><code>npm i vite-plugin-env-compatible 
yarn add vite-plugin-env-compatible
pnpm add vite-plugin-env-compatible
ni vite-plugin-env-compatible 
</code></pre>
<div class="line-numbers-wrapper"><span class="line-number">1</span><br><span class="line-number">2</span><br><span class="line-number">3</span><br><span class="line-number">4</span><br></div>
    <button class="v-md-copy-code-btn" type="button">
      <i>
        <svg viewbox="64 64 896 896" focusable="false" data-icon="copy" width="1em" height="1em" fill="currentColor" aria-hidden="true">
          <path d="M832 64H296c-4.4 0-8 3.6-8 8v56c0 4.4 3.6 8 8 8h496v688c0 4.4 3.6 8 8 8h56c4.4 0 8-3.6 8-8V96c0-17.7-14.3-32-32-32zM704 192H192c-17.7 0-32 14.3-32 32v530.7c0 8.5 3.4 16.6 9.4 22.6l173.3 173.3c2.2 2.2 4.7 4 7.4 5.5v1.9h4.2c3.5 1.3 7.2 2 11 2H704c17.7 0 32-14.3 32-32V224c0-17.7-14.3-32-32-32zM350 856.2L263.9 770H350v86.2zM664 888H414V746c0-22.1-17.9-40-40-40H232V264h432v624z"></path>
        </svg>
      </i>
    </button></div></div><p data-v-md-line="12">再到 vite.config.ts 中进行插件配置</p>
<div data-v-md-line="13"><div class="v-md-pre-wrapper copy-code-mode v-md-pre-wrapper-ts line-numbers-mode"><pre class="v-md-prism-ts"><code><span class="token keyword">import</span> envCompatible <span class="token keyword">from</span> <span class="token string">"vite-plugin-env-compatible"</span><span class="token punctuation">;</span>

<span class="token keyword">export</span> <span class="token keyword">default</span> <span class="token function">defineConfig</span><span class="token punctuation">(</span><span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token operator">=&gt;</span> <span class="token punctuation">{</span>
  <span class="token keyword">return</span> <span class="token punctuation">{</span>
    envDir<span class="token operator">:</span> path<span class="token punctuation">.</span><span class="token function">resolve</span><span class="token punctuation">(</span>__dirname<span class="token punctuation">,</span> <span class="token string">"./env"</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
    Plugins<span class="token operator">:</span> <span class="token punctuation">[</span>
      <span class="token function">vue</span><span class="token punctuation">(</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
      <span class="token function">envCompatible</span><span class="token punctuation">(</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
    <span class="token punctuation">]</span><span class="token punctuation">,</span>
  <span class="token punctuation">}</span>
<span class="token punctuation">}</span><span class="token punctuation">)</span>
</code></pre>
<div class="line-numbers-wrapper"><span class="line-number">1</span><br><span class="line-number">2</span><br><span class="line-number">3</span><br><span class="line-number">4</span><br><span class="line-number">5</span><br><span class="line-number">6</span><br><span class="line-number">7</span><br><span class="line-number">8</span><br><span class="line-number">9</span><br><span class="line-number">10</span><br><span class="line-number">11</span><br></div>
    <button class="v-md-copy-code-btn" type="button">
      <i>
        <svg viewbox="64 64 896 896" focusable="false" data-icon="copy" width="1em" height="1em" fill="currentColor" aria-hidden="true">
          <path d="M832 64H296c-4.4 0-8 3.6-8 8v56c0 4.4 3.6 8 8 8h496v688c0 4.4 3.6 8 8 8h56c4.4 0 8-3.6 8-8V96c0-17.7-14.3-32-32-32zM704 192H192c-17.7 0-32 14.3-32 32v530.7c0 8.5 3.4 16.6 9.4 22.6l173.3 173.3c2.2 2.2 4.7 4 7.4 5.5v1.9h4.2c3.5 1.3 7.2 2 11 2H704c17.7 0 32-14.3 32-32V224c0-17.7-14.3-32-32-32zM350 856.2L263.9 770H350v86.2zM664 888H414V746c0-22.1-17.9-40-40-40H232V264h432v624z"></path>
        </svg>
      </i>
    </button></div></div><ol start="2" data-v-md-line="26">
<li>在项目根目录创建.env和.env.production文件，其中分别配置有开发状态下和打包之后要上线的的接口路径。<br>
.env文件文件内容如下： <mark>这里我用到了vite的proxy代理 api，这里可以用服务器地址</mark></li>
</ol>
<div data-v-md-line="28"><div class="v-md-pre-wrapper copy-code-mode v-md-pre-wrapper- line-numbers-mode"><pre class="v-md-prism-"><code>VITE_BASE_URL=/api  
</code></pre>
<div class="line-numbers-wrapper"><span class="line-number">1</span><br></div>
    <button class="v-md-copy-code-btn" type="button">
      <i>
        <svg viewbox="64 64 896 896" focusable="false" data-icon="copy" width="1em" height="1em" fill="currentColor" aria-hidden="true">
          <path d="M832 64H296c-4.4 0-8 3.6-8 8v56c0 4.4 3.6 8 8 8h496v688c0 4.4 3.6 8 8 8h56c4.4 0 8-3.6 8-8V96c0-17.7-14.3-32-32-32zM704 192H192c-17.7 0-32 14.3-32 32v530.7c0 8.5 3.4 16.6 9.4 22.6l173.3 173.3c2.2 2.2 4.7 4 7.4 5.5v1.9h4.2c3.5 1.3 7.2 2 11 2H704c17.7 0 32-14.3 32-32V224c0-17.7-14.3-32-32-32zM350 856.2L263.9 770H350v86.2zM664 888H414V746c0-22.1-17.9-40-40-40H232V264h432v624z"></path>
        </svg>
      </i>
    </button></div></div><p data-v-md-line="31">.env.production文件文件内容如下： <mark>这里使用的是你打包之后需要上传服务器的后台地址（自己注意结尾斜杠）</mark></p>
<div data-v-md-line="32"><div class="v-md-pre-wrapper copy-code-mode v-md-pre-wrapper- line-numbers-mode"><pre class="v-md-prism-"><code>VITE_BASE_URL=http:47.113.222.95:8089
</code></pre>
<div class="line-numbers-wrapper"><span class="line-number">1</span><br></div>
    <button class="v-md-copy-code-btn" type="button">
      <i>
        <svg viewbox="64 64 896 896" focusable="false" data-icon="copy" width="1em" height="1em" fill="currentColor" aria-hidden="true">
          <path d="M832 64H296c-4.4 0-8 3.6-8 8v56c0 4.4 3.6 8 8 8h496v688c0 4.4 3.6 8 8 8h56c4.4 0 8-3.6 8-8V96c0-17.7-14.3-32-32-32zM704 192H192c-17.7 0-32 14.3-32 32v530.7c0 8.5 3.4 16.6 9.4 22.6l173.3 173.3c2.2 2.2 4.7 4 7.4 5.5v1.9h4.2c3.5 1.3 7.2 2 11 2H704c17.7 0 32-14.3 32-32V224c0-17.7-14.3-32-32-32zM350 856.2L263.9 770H350v86.2zM664 888H414V746c0-22.1-17.9-40-40-40H232V264h432v624z"></path>
        </svg>
      </i>
    </button></div></div><ol start="3" data-v-md-line="35">
<li>在vue项目中使用配置路径  (不需要导入任何东西，直接使用import.meta.env来获取即可)</li>
</ol>
<div data-v-md-line="36"><div class="v-md-pre-wrapper copy-code-mode v-md-pre-wrapper-ts line-numbers-mode"><pre class="v-md-prism-ts"><code><span class="token keyword">const</span> api <span class="token operator">=</span> <span class="token keyword">import</span><span class="token punctuation">.</span>meta<span class="token punctuation">.</span>env<span class="token punctuation">.</span><span class="token constant">VITE_BASE_URL</span>
<span class="token function">http</span><span class="token punctuation">(</span><span class="token string">"get"</span><span class="token punctuation">,</span> api <span class="token operator">+</span> <span class="token string">"/proxyApis/jinrishici/info"</span><span class="token punctuation">,</span> headers<span class="token punctuation">)</span><span class="token punctuation">.</span><span class="token function">then</span><span class="token punctuation">(</span><span class="token punctuation">(</span>res<span class="token operator">:</span> ipGetType<span class="token punctuation">)</span> <span class="token operator">=&gt;</span> <span class="token punctuation">{</span>
    <span class="token comment">//将个人信息存入localStorage，避免每次刷新都要请求接口</span>
    <span class="token function">setLocalStorage</span><span class="token punctuation">(</span><span class="token string">"weatherData"</span><span class="token punctuation">,</span> res<span class="token punctuation">.</span>data<span class="token punctuation">)</span>
<span class="token punctuation">}</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
</code></pre>
<div class="line-numbers-wrapper"><span class="line-number">1</span><br><span class="line-number">2</span><br><span class="line-number">3</span><br><span class="line-number">4</span><br><span class="line-number">5</span><br></div>
    <button class="v-md-copy-code-btn" type="button">
      <i>
        <svg viewbox="64 64 896 896" focusable="false" data-icon="copy" width="1em" height="1em" fill="currentColor" aria-hidden="true">
          <path d="M832 64H296c-4.4 0-8 3.6-8 8v56c0 4.4 3.6 8 8 8h496v688c0 4.4 3.6 8 8 8h56c4.4 0 8-3.6 8-8V96c0-17.7-14.3-32-32-32zM704 192H192c-17.7 0-32 14.3-32 32v530.7c0 8.5 3.4 16.6 9.4 22.6l173.3 173.3c2.2 2.2 4.7 4 7.4 5.5v1.9h4.2c3.5 1.3 7.2 2 11 2H704c17.7 0 32-14.3 32-32V224c0-17.7-14.3-32-32-32zM350 856.2L263.9 770H350v86.2zM664 888H414V746c0-22.1-17.9-40-40-40H232V264h432v624z"></path>
        </svg>
      </i>
    </button></div></div><ol start="4" data-v-md-line="43">
<li>这个打包的缺点就是不能在css中使用动态地址，必须通过js渲染（vue的动态style）</li>
</ol>
<h2 data-v-md-heading="node-ts-webpack" id="toc-head-45" data-v-md-line="46">node+ts+webpack</h2>
<p data-v-md-line="47">使用webpack的原因是，网上用vite打包node的参考比较少。webpack对比vite确实不是很便捷，暂时只能做到打包，没办法解决打包之后的路径的问题，只能手动去更换线上路径，比较麻烦，后面想办法再进行优化吧。<br>
以下是打包过程：</p>
<ol data-v-md-line="49">
<li>安装webpack、ts-loader、typescript</li>
</ol>
<div data-v-md-line="50"><div class="v-md-pre-wrapper copy-code-mode v-md-pre-wrapper-bash line-numbers-mode"><pre class="v-md-prism-bash"><code>npm i webpack webpack-cli ts-loader typescript
yarn add webpack webpack-cli ts-loader typescript
pnpm add webpack webpack-cli ts-loader typescript
ni webpack webpack-cli ts-loader typescript
</code></pre>
<div class="line-numbers-wrapper"><span class="line-number">1</span><br><span class="line-number">2</span><br><span class="line-number">3</span><br><span class="line-number">4</span><br></div>
    <button class="v-md-copy-code-btn" type="button">
      <i>
        <svg viewbox="64 64 896 896" focusable="false" data-icon="copy" width="1em" height="1em" fill="currentColor" aria-hidden="true">
          <path d="M832 64H296c-4.4 0-8 3.6-8 8v56c0 4.4 3.6 8 8 8h496v688c0 4.4 3.6 8 8 8h56c4.4 0 8-3.6 8-8V96c0-17.7-14.3-32-32-32zM704 192H192c-17.7 0-32 14.3-32 32v530.7c0 8.5 3.4 16.6 9.4 22.6l173.3 173.3c2.2 2.2 4.7 4 7.4 5.5v1.9h4.2c3.5 1.3 7.2 2 11 2H704c17.7 0 32-14.3 32-32V224c0-17.7-14.3-32-32-32zM350 856.2L263.9 770H350v86.2zM664 888H414V746c0-22.1-17.9-40-40-40H232V264h432v624z"></path>
        </svg>
      </i>
    </button></div></div><ol start="2" data-v-md-line="56">
<li>然后在<mark>webpack.config.js</mark>进行配置，ts文件使用ts-loader进行处理。</li>
</ol>
<div data-v-md-line="57"><div class="v-md-pre-wrapper copy-code-mode v-md-pre-wrapper-js line-numbers-mode"><pre class="v-md-prism-js"><code><span class="token comment">// webpack.config.js</span>
<span class="token keyword">const</span> path <span class="token operator">=</span> <span class="token function">require</span><span class="token punctuation">(</span><span class="token string">"path"</span><span class="token punctuation">)</span><span class="token punctuation">;</span>

module<span class="token punctuation">.</span>exports <span class="token operator">=</span> <span class="token punctuation">{</span>
    <span class="token literal-property property">entry</span><span class="token operator">:</span> <span class="token string">"./app.ts"</span><span class="token punctuation">,</span>
    <span class="token literal-property property">target</span><span class="token operator">:</span> <span class="token string">"node"</span><span class="token punctuation">,</span>
    <span class="token literal-property property">output</span><span class="token operator">:</span> <span class="token punctuation">{</span>
        <span class="token literal-property property">filename</span><span class="token operator">:</span> <span class="token string">"bundle.js"</span><span class="token punctuation">,</span>
        <span class="token literal-property property">path</span><span class="token operator">:</span> path<span class="token punctuation">.</span><span class="token function">resolve</span><span class="token punctuation">(</span>__dirname<span class="token punctuation">,</span> <span class="token string">"dist"</span><span class="token punctuation">)</span><span class="token punctuation">,</span> <span class="token comment">// 输出文件夹路径</span>
        <span class="token literal-property property">publicPath</span><span class="token operator">:</span> <span class="token string">"/"</span> <span class="token comment">// 公共路径，用于处理静态资源的访问路径</span>
    <span class="token punctuation">}</span><span class="token punctuation">,</span>
    <span class="token literal-property property">resolve</span><span class="token operator">:</span> <span class="token punctuation">{</span>
        <span class="token literal-property property">extensions</span><span class="token operator">:</span> <span class="token punctuation">[</span><span class="token string">".ts"</span><span class="token punctuation">,</span> <span class="token string">".js"</span><span class="token punctuation">]</span><span class="token punctuation">,</span>
    <span class="token punctuation">}</span><span class="token punctuation">,</span>
    <span class="token literal-property property">module</span><span class="token operator">:</span> <span class="token punctuation">{</span>
        <span class="token literal-property property">rules</span><span class="token operator">:</span> <span class="token punctuation">[</span>
            <span class="token punctuation">{</span>
                <span class="token literal-property property">test</span><span class="token operator">:</span> <span class="token regex"><span class="token regex-delimiter">/</span><span class="token regex-source language-regex">.ts$</span><span class="token regex-delimiter">/</span></span><span class="token punctuation">,</span>
                <span class="token literal-property property">use</span><span class="token operator">:</span> <span class="token string">"ts-loader"</span><span class="token punctuation">,</span>
                <span class="token literal-property property">exclude</span><span class="token operator">:</span> <span class="token regex"><span class="token regex-delimiter">/</span><span class="token regex-source language-regex">node_modules</span><span class="token regex-delimiter">/</span></span><span class="token punctuation">,</span>
            <span class="token punctuation">}</span><span class="token punctuation">,</span>
        <span class="token punctuation">]</span><span class="token punctuation">,</span>
    <span class="token punctuation">}</span><span class="token punctuation">,</span>
    <span class="token literal-property property">optimization</span><span class="token operator">:</span> <span class="token punctuation">{</span>
        <span class="token literal-property property">minimize</span><span class="token operator">:</span> <span class="token boolean">false</span>
    <span class="token punctuation">}</span><span class="token punctuation">,</span>
    <span class="token literal-property property">mode</span><span class="token operator">:</span> <span class="token string">"production"</span> <span class="token comment">// 生产模式，会对代码进行优化</span>
<span class="token punctuation">}</span><span class="token punctuation">;</span>
</code></pre>
<div class="line-numbers-wrapper"><span class="line-number">1</span><br><span class="line-number">2</span><br><span class="line-number">3</span><br><span class="line-number">4</span><br><span class="line-number">5</span><br><span class="line-number">6</span><br><span class="line-number">7</span><br><span class="line-number">8</span><br><span class="line-number">9</span><br><span class="line-number">10</span><br><span class="line-number">11</span><br><span class="line-number">12</span><br><span class="line-number">13</span><br><span class="line-number">14</span><br><span class="line-number">15</span><br><span class="line-number">16</span><br><span class="line-number">17</span><br><span class="line-number">18</span><br><span class="line-number">19</span><br><span class="line-number">20</span><br><span class="line-number">21</span><br><span class="line-number">22</span><br><span class="line-number">23</span><br><span class="line-number">24</span><br><span class="line-number">25</span><br><span class="line-number">26</span><br><span class="line-number">27</span><br><span class="line-number">28</span><br></div>
    <button class="v-md-copy-code-btn" type="button">
      <i>
        <svg viewbox="64 64 896 896" focusable="false" data-icon="copy" width="1em" height="1em" fill="currentColor" aria-hidden="true">
          <path d="M832 64H296c-4.4 0-8 3.6-8 8v56c0 4.4 3.6 8 8 8h496v688c0 4.4 3.6 8 8 8h56c4.4 0 8-3.6 8-8V96c0-17.7-14.3-32-32-32zM704 192H192c-17.7 0-32 14.3-32 32v530.7c0 8.5 3.4 16.6 9.4 22.6l173.3 173.3c2.2 2.2 4.7 4 7.4 5.5v1.9h4.2c3.5 1.3 7.2 2 11 2H704c17.7 0 32-14.3 32-32V224c0-17.7-14.3-32-32-32zM350 856.2L263.9 770H350v86.2zM664 888H414V746c0-22.1-17.9-40-40-40H232V264h432v624z"></path>
        </svg>
      </i>
    </button></div></div><ol start="3" data-v-md-line="87">
<li>运行指令编写 → package.json</li>
</ol>
<div data-v-md-line="88"><div class="v-md-pre-wrapper copy-code-mode v-md-pre-wrapper-json line-numbers-mode"><pre class="v-md-prism-json"><code><span class="token property">"scripts"</span><span class="token operator">:</span> <span class="token punctuation">{</span>
    <span class="token property">"server"</span><span class="token operator">:</span> <span class="token string">"ts-node-dev  ./app.ts --mode dev"</span><span class="token punctuation">,</span>
    <span class="token property">"tsc"</span><span class="token operator">:</span> <span class="token string">"tsc"</span><span class="token punctuation">,</span>
    <span class="token property">"build"</span><span class="token operator">:</span> <span class="token string">"webpack --mode production"</span><span class="token punctuation">,</span>
    <span class="token property">"rmjs"</span><span class="token operator">:</span> <span class="token string">"ts-node-dev utilsPublic/rmjs.ts"</span><span class="token punctuation">,</span>
    <span class="token property">"perfectBuild"</span><span class="token operator">:</span> <span class="token string">"tsc &amp;&amp; webpack --mode production &amp;&amp; ts-node-dev utilsPublic/rmjs.ts"</span><span class="token punctuation">,</span>
    <span class="token property">"fontUnicode"</span><span class="token operator">:</span> <span class="token string">"ts-node-dev utilsPublic/unique.ts"</span>
<span class="token punctuation">}</span><span class="token punctuation">,</span>
</code></pre>
<div class="line-numbers-wrapper"><span class="line-number">1</span><br><span class="line-number">2</span><br><span class="line-number">3</span><br><span class="line-number">4</span><br><span class="line-number">5</span><br><span class="line-number">6</span><br><span class="line-number">7</span><br><span class="line-number">8</span><br></div>
    <button class="v-md-copy-code-btn" type="button">
      <i>
        <svg viewbox="64 64 896 896" focusable="false" data-icon="copy" width="1em" height="1em" fill="currentColor" aria-hidden="true">
          <path d="M832 64H296c-4.4 0-8 3.6-8 8v56c0 4.4 3.6 8 8 8h496v688c0 4.4 3.6 8 8 8h56c4.4 0 8-3.6 8-8V96c0-17.7-14.3-32-32-32zM704 192H192c-17.7 0-32 14.3-32 32v530.7c0 8.5 3.4 16.6 9.4 22.6l173.3 173.3c2.2 2.2 4.7 4 7.4 5.5v1.9h4.2c3.5 1.3 7.2 2 11 2H704c17.7 0 32-14.3 32-32V224c0-17.7-14.3-32-32-32zM350 856.2L263.9 770H350v86.2zM664 888H414V746c0-22.1-17.9-40-40-40H232V264h432v624z"></path>
        </svg>
      </i>
    </button></div></div><p data-v-md-line="98">tsc : 将ts的代码编译为js<br>
build ：使用webpack将项目中的js进行打包<br>
rmjs : 将编译ts留下的js进行删除（自定义方法，不删除不行啊，在开发模式每次修改内容都不生效）<br>
perfectBuild ： 将node.ts打包一步到位 先转译ts→进行打包→删除js<br>
4. 补充一份删除js的代码  文件路径：utilsPublic/rmjs.ts 自行修改一下即可</p>
<div data-v-md-line="103"><div class="v-md-pre-wrapper copy-code-mode v-md-pre-wrapper-ts line-numbers-mode"><pre class="v-md-prism-ts"><code><span class="token comment">//node 删除项目中所有js文件</span>
<span class="token keyword">import</span> fs <span class="token keyword">from</span> <span class="token string">"node:fs"</span>
<span class="token keyword">import</span> path <span class="token keyword">from</span> <span class="token string">"node:path"</span><span class="token punctuation">;</span>

<span class="token keyword">const</span> files <span class="token operator">=</span> fs<span class="token punctuation">.</span><span class="token function">readdirSync</span><span class="token punctuation">(</span>path<span class="token punctuation">.</span><span class="token function">resolve</span><span class="token punctuation">(</span>__dirname<span class="token punctuation">,</span> <span class="token string">"../"</span><span class="token punctuation">)</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
<span class="token keyword">const</span> exclude <span class="token operator">=</span> <span class="token punctuation">[</span>
    <span class="token string">"node_modules"</span><span class="token punctuation">,</span>
    <span class="token string">".git"</span><span class="token punctuation">,</span>
    <span class="token string">".idea"</span><span class="token punctuation">,</span>
    <span class="token string">"dist"</span><span class="token punctuation">,</span>
    <span class="token string">"public"</span><span class="token punctuation">,</span>
    <span class="token string">"webpack.config.js"</span>
<span class="token punctuation">]</span>

<span class="token comment">// 使用递归寻找出所有的js文件</span>
<span class="token keyword">const</span> findJs <span class="token operator">=</span> <span class="token punctuation">(</span>files<span class="token operator">:</span> <span class="token builtin">string</span><span class="token punctuation">[</span><span class="token punctuation">]</span><span class="token punctuation">,</span> basePath<span class="token operator">:</span> <span class="token builtin">string</span><span class="token punctuation">)</span><span class="token operator">:</span> <span class="token builtin">string</span><span class="token punctuation">[</span><span class="token punctuation">]</span> <span class="token operator">=&gt;</span> <span class="token punctuation">{</span>
    <span class="token keyword">const</span> jsFiles<span class="token operator">:</span> <span class="token builtin">string</span><span class="token punctuation">[</span><span class="token punctuation">]</span> <span class="token operator">=</span> <span class="token punctuation">[</span><span class="token punctuation">]</span><span class="token punctuation">;</span>
    files<span class="token punctuation">.</span><span class="token function">forEach</span><span class="token punctuation">(</span><span class="token punctuation">(</span>item<span class="token punctuation">)</span> <span class="token operator">=&gt;</span> <span class="token punctuation">{</span>
        <span class="token keyword">const</span> fullPath <span class="token operator">=</span> path<span class="token punctuation">.</span><span class="token function">join</span><span class="token punctuation">(</span>basePath<span class="token punctuation">,</span> item<span class="token punctuation">)</span><span class="token punctuation">;</span> <span class="token comment">// 获取文件的完整路径</span>
        <span class="token keyword">if</span> <span class="token punctuation">(</span>exclude<span class="token punctuation">.</span><span class="token function">includes</span><span class="token punctuation">(</span>item<span class="token punctuation">)</span><span class="token punctuation">)</span> <span class="token keyword">return</span><span class="token punctuation">;</span>
        <span class="token keyword">const</span> stat <span class="token operator">=</span> fs<span class="token punctuation">.</span><span class="token function">statSync</span><span class="token punctuation">(</span>fullPath<span class="token punctuation">)</span><span class="token punctuation">;</span>
        <span class="token keyword">if</span> <span class="token punctuation">(</span>stat<span class="token punctuation">.</span><span class="token function">isDirectory</span><span class="token punctuation">(</span><span class="token punctuation">)</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
            <span class="token keyword">const</span> dirFiles <span class="token operator">=</span> fs<span class="token punctuation">.</span><span class="token function">readdirSync</span><span class="token punctuation">(</span>fullPath<span class="token punctuation">)</span><span class="token punctuation">;</span>
            jsFiles<span class="token punctuation">.</span><span class="token function">push</span><span class="token punctuation">(</span><span class="token operator">...</span><span class="token function">findJs</span><span class="token punctuation">(</span>dirFiles<span class="token punctuation">,</span> fullPath<span class="token punctuation">)</span><span class="token punctuation">)</span><span class="token punctuation">;</span> <span class="token comment">// 传入完整路径递归查找子目录</span>
        <span class="token punctuation">}</span> <span class="token keyword">else</span> <span class="token punctuation">{</span>
            <span class="token keyword">if</span> <span class="token punctuation">(</span>item<span class="token punctuation">.</span><span class="token function">endsWith</span><span class="token punctuation">(</span><span class="token string">".js"</span><span class="token punctuation">)</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
                jsFiles<span class="token punctuation">.</span><span class="token function">push</span><span class="token punctuation">(</span>fullPath<span class="token punctuation">)</span><span class="token punctuation">;</span>
            <span class="token punctuation">}</span>
        <span class="token punctuation">}</span>
    <span class="token punctuation">}</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
    <span class="token keyword">return</span> jsFiles<span class="token punctuation">;</span>
<span class="token punctuation">}</span><span class="token punctuation">;</span>
<span class="token keyword">const</span> jsFiles <span class="token operator">=</span> <span class="token function">findJs</span><span class="token punctuation">(</span>files<span class="token punctuation">,</span> path<span class="token punctuation">.</span><span class="token function">resolve</span><span class="token punctuation">(</span>__dirname<span class="token punctuation">,</span> <span class="token string">"../"</span><span class="token punctuation">)</span><span class="token punctuation">)</span><span class="token punctuation">;</span>   
jsFiles<span class="token punctuation">.</span><span class="token function">forEach</span><span class="token punctuation">(</span><span class="token punctuation">(</span>item<span class="token punctuation">)</span> <span class="token operator">=&gt;</span> <span class="token punctuation">{</span>
    fs<span class="token punctuation">.</span><span class="token function">unlinkSync</span><span class="token punctuation">(</span>item<span class="token punctuation">)</span><span class="token punctuation">;</span>
<span class="token punctuation">}</span><span class="token punctuation">)</span>
</code></pre>
<div class="line-numbers-wrapper"><span class="line-number">1</span><br><span class="line-number">2</span><br><span class="line-number">3</span><br><span class="line-number">4</span><br><span class="line-number">5</span><br><span class="line-number">6</span><br><span class="line-number">7</span><br><span class="line-number">8</span><br><span class="line-number">9</span><br><span class="line-number">10</span><br><span class="line-number">11</span><br><span class="line-number">12</span><br><span class="line-number">13</span><br><span class="line-number">14</span><br><span class="line-number">15</span><br><span class="line-number">16</span><br><span class="line-number">17</span><br><span class="line-number">18</span><br><span class="line-number">19</span><br><span class="line-number">20</span><br><span class="line-number">21</span><br><span class="line-number">22</span><br><span class="line-number">23</span><br><span class="line-number">24</span><br><span class="line-number">25</span><br><span class="line-number">26</span><br><span class="line-number">27</span><br><span class="line-number">28</span><br><span class="line-number">29</span><br><span class="line-number">30</span><br><span class="line-number">31</span><br><span class="line-number">32</span><br><span class="line-number">33</span><br><span class="line-number">34</span><br><span class="line-number">35</span><br><span class="line-number">36</span><br></div>
    <button class="v-md-copy-code-btn" type="button">
      <i>
        <svg viewbox="64 64 896 896" focusable="false" data-icon="copy" width="1em" height="1em" fill="currentColor" aria-hidden="true">
          <path d="M832 64H296c-4.4 0-8 3.6-8 8v56c0 4.4 3.6 8 8 8h496v688c0 4.4 3.6 8 8 8h56c4.4 0 8-3.6 8-8V96c0-17.7-14.3-32-32-32zM704 192H192c-17.7 0-32 14.3-32 32v530.7c0 8.5 3.4 16.6 9.4 22.6l173.3 173.3c2.2 2.2 4.7 4 7.4 5.5v1.9h4.2c3.5 1.3 7.2 2 11 2H704c17.7 0 32-14.3 32-32V224c0-17.7-14.3-32-32-32zM350 856.2L263.9 770H350v86.2zM664 888H414V746c0-22.1-17.9-40-40-40H232V264h432v624z"></path>
        </svg>
      </i>
    </button></div></div><ol start="5" data-v-md-line="142">
<li>以上就是node+ts+webpack打包的全过程，缺点十分明显，没办法解决打包前后的路径问题，服务器跟本地的地址切换不方便，得手动去更换。还有就是没办法将静态资源public放入打包的dist文件夹中，得自己去复制一份。</li>
</ol>
<h2 data-v-md-heading="总结" id="toc-head-143" data-v-md-line="144">总结</h2>
<p data-v-md-line="145">写这篇文章的时候很奇怪，不知道为什么快速的添加内容在markdown组件中就会将中文内容转为英文的。比如说快速的敲击几下空格，它会将你选中的内容，或者部分内容转换为英文的。不知道是不是markdown组件自带的。<br>
<img src="/api/public/img/articleImages/upload-image1690188380598.png" alt="点击放大"><br>
<img src="/api/public/img/articleImages/upload-image1690188389965.png" alt="点击放大"></p>
','本文记录了使用vue3+vite和node.ts的打包过程，为了解决路径前后打包的问题','46');
INSERT INTO `wb_articles` (`aid`,`uid`,`create_date`,`title`,`content`,`modified_date`,`cover_img`,`comments_count`,`main`,`partial_content`,`access_count`)  VALUES ('18','1','2023-07-25 01:52:39','vue动态组件切换太快bug','今天将项目的路由跳转改为动态组件的时候遇到一个神奇的bug。还好解决了
下面进行记录一下问题原因以及解决办法，下图就是一个简单的动态路由配置，采用双飞翼结构，左右两侧布局

## 问题介绍
![点击放大](/api/public/img/articleImages/upload-image1690219815215.png)
![点击放大](/api/public/img/articleImages/upload-image1690220629526.png)
记住我圈的位置，我现在要进行多次切换组件。通过左侧的按钮，在连续切换的时候，上一个页面没加载完全，就已经去求换新页面的时候就会将动态组件内的组件移到div class="content"以外去
![点击放大](/api/public/img/articleImages/upload-image1690220891368.png)

## 解决办法
其实根本原因就是，组件内部的同步动作影响到了下一组件，导致vue内置组件component出现问题，必须要单独设置Suspense组件，不能跟图一 一样全局覆盖Suspense，得单独独立设置Suspense
![点击放大](/api/public/img/articleImages/upload-image1690221059187.png)

我在网上看了一下，好像没有人说到过这个bug。所以特此记录一下','2024-02-14 23:21:51','/img/articleImages/upload-image1690220539703.jpeg','0','<p data-v-md-line="1">今天将项目的路由跳转改为动态组件的时候遇到一个神奇的bug。还好解决了<br>
下面进行记录一下问题原因以及解决办法，下图就是一个简单的动态路由配置，采用双飞翼结构，左右两侧布局</p>
<h2 data-v-md-heading="问题介绍" id="toc-head-3" data-v-md-line="4">问题介绍</h2>
<p data-v-md-line="5"><img src="/api/public/img/articleImages/upload-image1690219815215.png" alt="点击放大"><br>
<img src="/api/public/img/articleImages/upload-image1690220629526.png" alt="点击放大"><br>
记住我圈的位置，我现在要进行多次切换组件。通过左侧的按钮，在连续切换的时候，上一个页面没加载完全，就已经去求换新页面的时候就会将动态组件内的组件移到div class=&quot;content&quot;以外去<br>
<img src="/api/public/img/articleImages/upload-image1690220891368.png" alt="点击放大"></p>
<h2 data-v-md-heading="解决办法" id="toc-head-9" data-v-md-line="10">解决办法</h2>
<p data-v-md-line="11">其实根本原因就是，组件内部的同步动作影响到了下一组件，导致vue内置组件component出现问题，必须要单独设置Suspense组件，不能跟图一 一样全局覆盖Suspense，得单独独立设置Suspense<br>
<img src="/api/public/img/articleImages/upload-image1690221059187.png" alt="点击放大"></p>
<p data-v-md-line="14">我在网上看了一下，好像没有人说到过这个bug。所以特此记录一下</p>
','今天将项目的路由跳转改为动态组件的时候遇到一个神奇的bug。还好解决了<br>
下面进行记录一下问题原因以及解决办法，下图就是一个简单的动态路由配置，采用双飞翼结构，左右两侧布局','92');
INSERT INTO `wb_articles` (`aid`,`uid`,`create_date`,`title`,`content`,`modified_date`,`cover_img`,`comments_count`,`main`,`partial_content`,`access_count`)  VALUES ('19','1','2023-08-07 00:17:01','在vue+ts中使用使用子进程来处理数据(worker)','网上的对ts使用worker的教程很少。所以自己研究了一下，还是写出来了。ts其实跟js的是一样的，ts中也是可以加载js的子线程worker.js进程文件的，代码如下


``` ts
// 主线程文件 使用 Web Workers 处理图像数据
  const worker = new Worker("/src/utils/worker.js");


// postMessage函数要传入你需要在子进程用到的数据
  worker.postMessage({
    imageData: imageData,
    params: { hue, saturation, brightness, contrast },
  });


// 通过子进程事件获取到子进程计算的结果
  worker.onmessage = (event) => {
    // 获取处理后的图像数据
    const processedImageData = event.data;


    context!.putImageData(processedImageData, 0, 0);



    // 继续渲染下一帧
    requestAnimationFrame(renderToCanvas);


  };


```
``` js
// 在 worker.js 文件中进行计算处理
onmessage = (event) => {
// 获取主进程传回的数据
  const imageData = event.data.imageData;


  const data = imageData.data;


  const params = event.data.params;



  // 处理图像数据，这里使用你之前定义的 change_per_pix 函数
  for (let i = 0; i < data.length; i += 4) {
    change_per_pix(params, data, i);


  }
  // 处理对比度
  if (params.contrast && params.contrast != 0) {
    let avg = getGrayAverage(data);


    makeContrast(data, avg, params.contrast * 255);


  }
  // 返回处理后的图像数据 最后需要返回数据
  postMessage(imageData);


};



```


其实没想到，ts中可以直接使用js来做子进程，一开始还以为不可以，试了一下，发现没什么问题。
','2024-02-14 23:32:12','/img/articleImages/upload-image1691338740437.jpeg','0','<p data-v-md-line="1">网上的对ts使用worker的教程很少。所以自己研究了一下，还是写出来了。ts其实跟js的是一样的，ts中也是可以加载js的子线程worker.js进程文件的，代码如下</p>
<div data-v-md-line="4"><div class="v-md-pre-wrapper copy-code-mode v-md-pre-wrapper-ts line-numbers-mode"><pre class="v-md-prism-ts"><code><span class="token comment">// 主线程文件 使用 Web Workers 处理图像数据</span>
  <span class="token keyword">const</span> worker <span class="token operator">=</span> <span class="token keyword">new</span> <span class="token class-name">Worker</span><span class="token punctuation">(</span><span class="token string">"/src/utils/worker.js"</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
<span class="token comment">// postMessage函数要传入你需要在子进程用到的数据</span>
  worker<span class="token punctuation">.</span><span class="token function">postMessage</span><span class="token punctuation">(</span><span class="token punctuation">{</span>
    imageData<span class="token operator">:</span> imageData<span class="token punctuation">,</span>
    params<span class="token operator">:</span> <span class="token punctuation">{</span> hue<span class="token punctuation">,</span> saturation<span class="token punctuation">,</span> brightness<span class="token punctuation">,</span> contrast <span class="token punctuation">}</span><span class="token punctuation">,</span>
  <span class="token punctuation">}</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
<span class="token comment">// 通过子进程事件获取到子进程计算的结果</span>
  worker<span class="token punctuation">.</span><span class="token function-variable function">onmessage</span> <span class="token operator">=</span> <span class="token punctuation">(</span>event<span class="token punctuation">)</span> <span class="token operator">=&gt;</span> <span class="token punctuation">{</span>
    <span class="token comment">// 获取处理后的图像数据</span>
    <span class="token keyword">const</span> processedImageData <span class="token operator">=</span> event<span class="token punctuation">.</span>data<span class="token punctuation">;</span>
    context<span class="token operator">!</span><span class="token punctuation">.</span><span class="token function">putImageData</span><span class="token punctuation">(</span>processedImageData<span class="token punctuation">,</span> <span class="token number">0</span><span class="token punctuation">,</span> <span class="token number">0</span><span class="token punctuation">)</span><span class="token punctuation">;</span>

    <span class="token comment">// 继续渲染下一帧</span>
    <span class="token function">requestAnimationFrame</span><span class="token punctuation">(</span>renderToCanvas<span class="token punctuation">)</span><span class="token punctuation">;</span>
  <span class="token punctuation">}</span><span class="token punctuation">;</span>
</code></pre>
<div class="line-numbers-wrapper"><span class="line-number">1</span><br><span class="line-number">2</span><br><span class="line-number">3</span><br><span class="line-number">4</span><br><span class="line-number">5</span><br><span class="line-number">6</span><br><span class="line-number">7</span><br><span class="line-number">8</span><br><span class="line-number">9</span><br><span class="line-number">10</span><br><span class="line-number">11</span><br><span class="line-number">12</span><br><span class="line-number">13</span><br><span class="line-number">14</span><br><span class="line-number">15</span><br><span class="line-number">16</span><br></div>
    <button class="v-md-copy-code-btn" type="button">
      <i>
        <svg viewbox="64 64 896 896" focusable="false" data-icon="copy" width="1em" height="1em" fill="currentColor" aria-hidden="true">
          <path d="M832 64H296c-4.4 0-8 3.6-8 8v56c0 4.4 3.6 8 8 8h496v688c0 4.4 3.6 8 8 8h56c4.4 0 8-3.6 8-8V96c0-17.7-14.3-32-32-32zM704 192H192c-17.7 0-32 14.3-32 32v530.7c0 8.5 3.4 16.6 9.4 22.6l173.3 173.3c2.2 2.2 4.7 4 7.4 5.5v1.9h4.2c3.5 1.3 7.2 2 11 2H704c17.7 0 32-14.3 32-32V224c0-17.7-14.3-32-32-32zM350 856.2L263.9 770H350v86.2zM664 888H414V746c0-22.1-17.9-40-40-40H232V264h432v624z"></path>
        </svg>
      </i>
    </button></div></div><div data-v-md-line="22"><div class="v-md-pre-wrapper copy-code-mode v-md-pre-wrapper-js line-numbers-mode"><pre class="v-md-prism-js"><code><span class="token comment">// 在 worker.js 文件中进行计算处理</span>
<span class="token function-variable function">onmessage</span> <span class="token operator">=</span> <span class="token punctuation">(</span><span class="token parameter">event</span><span class="token punctuation">)</span> <span class="token operator">=&gt;</span> <span class="token punctuation">{</span>
<span class="token comment">// 获取主进程传回的数据</span>
  <span class="token keyword">const</span> imageData <span class="token operator">=</span> event<span class="token punctuation">.</span>data<span class="token punctuation">.</span>imageData<span class="token punctuation">;</span>
  <span class="token keyword">const</span> data <span class="token operator">=</span> imageData<span class="token punctuation">.</span>data<span class="token punctuation">;</span>
  <span class="token keyword">const</span> params <span class="token operator">=</span> event<span class="token punctuation">.</span>data<span class="token punctuation">.</span>params<span class="token punctuation">;</span>

  <span class="token comment">// 处理图像数据，这里使用你之前定义的 change_per_pix 函数</span>
  <span class="token keyword">for</span> <span class="token punctuation">(</span><span class="token keyword">let</span> i <span class="token operator">=</span> <span class="token number">0</span><span class="token punctuation">;</span> i <span class="token operator">&lt;</span> data<span class="token punctuation">.</span>length<span class="token punctuation">;</span> i <span class="token operator">+=</span> <span class="token number">4</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
    <span class="token function">change_per_pix</span><span class="token punctuation">(</span>params<span class="token punctuation">,</span> data<span class="token punctuation">,</span> i<span class="token punctuation">)</span><span class="token punctuation">;</span>
  <span class="token punctuation">}</span>
  <span class="token comment">// 处理对比度</span>
  <span class="token keyword">if</span> <span class="token punctuation">(</span>params<span class="token punctuation">.</span>contrast <span class="token operator">&amp;&amp;</span> params<span class="token punctuation">.</span>contrast <span class="token operator">!=</span> <span class="token number">0</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
    <span class="token keyword">let</span> avg <span class="token operator">=</span> <span class="token function">getGrayAverage</span><span class="token punctuation">(</span>data<span class="token punctuation">)</span><span class="token punctuation">;</span>
    <span class="token function">makeContrast</span><span class="token punctuation">(</span>data<span class="token punctuation">,</span> avg<span class="token punctuation">,</span> params<span class="token punctuation">.</span>contrast <span class="token operator">*</span> <span class="token number">255</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
  <span class="token punctuation">}</span>
  <span class="token comment">// 返回处理后的图像数据 最后需要返回数据</span>
  <span class="token function">postMessage</span><span class="token punctuation">(</span>imageData<span class="token punctuation">)</span><span class="token punctuation">;</span>
<span class="token punctuation">}</span><span class="token punctuation">;</span>

</code></pre>
<div class="line-numbers-wrapper"><span class="line-number">1</span><br><span class="line-number">2</span><br><span class="line-number">3</span><br><span class="line-number">4</span><br><span class="line-number">5</span><br><span class="line-number">6</span><br><span class="line-number">7</span><br><span class="line-number">8</span><br><span class="line-number">9</span><br><span class="line-number">10</span><br><span class="line-number">11</span><br><span class="line-number">12</span><br><span class="line-number">13</span><br><span class="line-number">14</span><br><span class="line-number">15</span><br><span class="line-number">16</span><br><span class="line-number">17</span><br><span class="line-number">18</span><br><span class="line-number">19</span><br><span class="line-number">20</span><br></div>
    <button class="v-md-copy-code-btn" type="button">
      <i>
        <svg viewbox="64 64 896 896" focusable="false" data-icon="copy" width="1em" height="1em" fill="currentColor" aria-hidden="true">
          <path d="M832 64H296c-4.4 0-8 3.6-8 8v56c0 4.4 3.6 8 8 8h496v688c0 4.4 3.6 8 8 8h56c4.4 0 8-3.6 8-8V96c0-17.7-14.3-32-32-32zM704 192H192c-17.7 0-32 14.3-32 32v530.7c0 8.5 3.4 16.6 9.4 22.6l173.3 173.3c2.2 2.2 4.7 4 7.4 5.5v1.9h4.2c3.5 1.3 7.2 2 11 2H704c17.7 0 32-14.3 32-32V224c0-17.7-14.3-32-32-32zM350 856.2L263.9 770H350v86.2zM664 888H414V746c0-22.1-17.9-40-40-40H232V264h432v624z"></path>
        </svg>
      </i>
    </button></div></div><p data-v-md-line="46">其实没想到，ts中可以直接使用js来做子进程，一开始还以为不可以，试了一下，发现没什么问题。</p>
','网上的对ts使用worker的教程很少。所以自己研究了一下，还是写出来了。ts其实跟js的是一样的，ts中也是可以加载js的子线程worker.js进程文件的，代码如下','41');
INSERT INTO `wb_articles` (`aid`,`uid`,`create_date`,`title`,`content`,`modified_date`,`cover_img`,`comments_count`,`main`,`partial_content`,`access_count`)  VALUES ('21','1','2023-08-12 12:32:24','Map对象学习','今天在研究图像缓存的时候，才想起Map属性可以用来处理相同的数据（避免重复，Set当然也行）。其实很早之前就想学习这两个新引用类型的，就是没什么机会去实验，所以直到现在对他们都不是很了解。今天写图像缓存总算的用到了，很不错的方法，可以借鉴。以下是代码展示
![点击放大](/api/public/img/articleImages/upload-image1691771049864.png)


``` ts
// 图片加载器 将图像对象在初始化时加载，并在后续渲染时重复使用。
class ImageLoader {
  // 创建一个私有属性 imageCache，用于存储图像 URL 与图像对象的映射关系
  private imageCache: Map<string, HTMLImageElement> = new Map();


  // 异步方法，用于加载图像并缓存
  async loadImage(src: string): Promise<HTMLImageElement> {
    console.log(this.imageCache); // 打印当前图像缓存，用于调试和观察
    // 如果 imageCache 中已经有了这个 URL 对应的图像对象，直接返回已缓存的对象
    if (this.imageCache.has(src)) {
      return this.imageCache.get(src)!;


    } else {
      // 创建一个新的 HTMLImageElement 对象
      const img = new Image();


      // 设置图像的 URL 为传入的 src
      img.src = src;


      // 等待图像加载和解码完成
      await img.decode();


      // 将图像对象缓存到 imageCache 中，以便下次使用
      this.imageCache.set(src, img);


      // 返回加载好的图像对象
      return img;


    }
  }
}
// 创建一个名为 imageLoader 的 ImageLoader 类的实例，用于加载和缓存图像
export const imageLoader = new ImageLoader();


```','2024-02-10 23:42:25','/img/articleImages/upload-image1691771040480.jpeg','0','<p data-v-md-line="1">今天在研究图像缓存的时候，才想起Map属性可以用来处理相同的数据（避免重复，Set当然也行）。其实很早之前就想学习这两个新引用类型的，就是没什么机会去实验，所以直到现在对他们都不是很了解。今天写图像缓存总算的用到了，很不错的方法，可以借鉴。以下是代码展示<br>
<img src="/api/public/img/articleImages/upload-image1691771049864.png" alt="点击放大"></p>
<div data-v-md-line="5"><div class="v-md-pre-wrapper copy-code-mode v-md-pre-wrapper-ts line-numbers-mode"><pre class="v-md-prism-ts"><code><span class="token comment">// 图片加载器 将图像对象在初始化时加载，并在后续渲染时重复使用。</span>
<span class="token keyword">class</span> <span class="token class-name">ImageLoader</span> <span class="token punctuation">{</span>
  <span class="token comment">// 创建一个私有属性 imageCache，用于存储图像 URL 与图像对象的映射关系</span>
  <span class="token keyword">private</span> imageCache<span class="token operator">:</span> Map<span class="token operator">&lt;</span><span class="token builtin">string</span><span class="token punctuation">,</span> HTMLImageElement<span class="token operator">&gt;</span> <span class="token operator">=</span> <span class="token keyword">new</span> <span class="token class-name">Map</span><span class="token punctuation">(</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
  <span class="token comment">// 异步方法，用于加载图像并缓存</span>
  <span class="token keyword">async</span> <span class="token function">loadImage</span><span class="token punctuation">(</span>src<span class="token operator">:</span> <span class="token builtin">string</span><span class="token punctuation">)</span><span class="token operator">:</span> <span class="token builtin">Promise</span><span class="token operator">&lt;</span>HTMLImageElement<span class="token operator">&gt;</span> <span class="token punctuation">{</span>
    <span class="token builtin">console</span><span class="token punctuation">.</span><span class="token function">log</span><span class="token punctuation">(</span><span class="token keyword">this</span><span class="token punctuation">.</span>imageCache<span class="token punctuation">)</span><span class="token punctuation">;</span> <span class="token comment">// 打印当前图像缓存，用于调试和观察</span>
    <span class="token comment">// 如果 imageCache 中已经有了这个 URL 对应的图像对象，直接返回已缓存的对象</span>
    <span class="token keyword">if</span> <span class="token punctuation">(</span><span class="token keyword">this</span><span class="token punctuation">.</span>imageCache<span class="token punctuation">.</span><span class="token function">has</span><span class="token punctuation">(</span>src<span class="token punctuation">)</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
      <span class="token keyword">return</span> <span class="token keyword">this</span><span class="token punctuation">.</span>imageCache<span class="token punctuation">.</span><span class="token function">get</span><span class="token punctuation">(</span>src<span class="token punctuation">)</span><span class="token operator">!</span><span class="token punctuation">;</span>
    <span class="token punctuation">}</span> <span class="token keyword">else</span> <span class="token punctuation">{</span>
      <span class="token comment">// 创建一个新的 HTMLImageElement 对象</span>
      <span class="token keyword">const</span> img <span class="token operator">=</span> <span class="token keyword">new</span> <span class="token class-name">Image</span><span class="token punctuation">(</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
      <span class="token comment">// 设置图像的 URL 为传入的 src</span>
      img<span class="token punctuation">.</span>src <span class="token operator">=</span> src<span class="token punctuation">;</span>
      <span class="token comment">// 等待图像加载和解码完成</span>
      <span class="token keyword">await</span> img<span class="token punctuation">.</span><span class="token function">decode</span><span class="token punctuation">(</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
      <span class="token comment">// 将图像对象缓存到 imageCache 中，以便下次使用</span>
      <span class="token keyword">this</span><span class="token punctuation">.</span>imageCache<span class="token punctuation">.</span><span class="token function">set</span><span class="token punctuation">(</span>src<span class="token punctuation">,</span> img<span class="token punctuation">)</span><span class="token punctuation">;</span>
      <span class="token comment">// 返回加载好的图像对象</span>
      <span class="token keyword">return</span> img<span class="token punctuation">;</span>
    <span class="token punctuation">}</span>
  <span class="token punctuation">}</span>
<span class="token punctuation">}</span>
<span class="token comment">// 创建一个名为 imageLoader 的 ImageLoader 类的实例，用于加载和缓存图像</span>
<span class="token keyword">export</span> <span class="token keyword">const</span> imageLoader <span class="token operator">=</span> <span class="token keyword">new</span> <span class="token class-name">ImageLoader</span><span class="token punctuation">(</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
</code></pre>
<div class="line-numbers-wrapper"><span class="line-number">1</span><br><span class="line-number">2</span><br><span class="line-number">3</span><br><span class="line-number">4</span><br><span class="line-number">5</span><br><span class="line-number">6</span><br><span class="line-number">7</span><br><span class="line-number">8</span><br><span class="line-number">9</span><br><span class="line-number">10</span><br><span class="line-number">11</span><br><span class="line-number">12</span><br><span class="line-number">13</span><br><span class="line-number">14</span><br><span class="line-number">15</span><br><span class="line-number">16</span><br><span class="line-number">17</span><br><span class="line-number">18</span><br><span class="line-number">19</span><br><span class="line-number">20</span><br><span class="line-number">21</span><br><span class="line-number">22</span><br><span class="line-number">23</span><br><span class="line-number">24</span><br><span class="line-number">25</span><br><span class="line-number">26</span><br></div>
    <button class="v-md-copy-code-btn" type="button">
      <i>
        <svg viewbox="64 64 896 896" focusable="false" data-icon="copy" width="1em" height="1em" fill="currentColor" aria-hidden="true">
          <path d="M832 64H296c-4.4 0-8 3.6-8 8v56c0 4.4 3.6 8 8 8h496v688c0 4.4 3.6 8 8 8h56c4.4 0 8-3.6 8-8V96c0-17.7-14.3-32-32-32zM704 192H192c-17.7 0-32 14.3-32 32v530.7c0 8.5 3.4 16.6 9.4 22.6l173.3 173.3c2.2 2.2 4.7 4 7.4 5.5v1.9h4.2c3.5 1.3 7.2 2 11 2H704c17.7 0 32-14.3 32-32V224c0-17.7-14.3-32-32-32zM350 856.2L263.9 770H350v86.2zM664 888H414V746c0-22.1-17.9-40-40-40H232V264h432v624z"></path>
        </svg>
      </i>
    </button></div></div>','今天在研究图像缓存的时候，才想起Map属性可以用来处理相同的数据（避免重复，Set当然也行）。其实很早之前就想学习这两个新引用类型的，就是没什么机会去实验，所以直到现在对他们都不是很了解。今天写图像缓存总算的用到了，很不错的方法，可以借鉴。以下是代码展示<br>
<img src="/api/public/img/articleImages/upload-image1691771049864.png" alt="点击放大">','123');
INSERT INTO `wb_articles` (`aid`,`uid`,`create_date`,`title`,`content`,`modified_date`,`cover_img`,`comments_count`,`main`,`partial_content`,`access_count`)  VALUES ('26','1','2024-02-06 23:09:15','Git规范（一）','为什么要对 Git 提交日志（message）的格式进行规范约束？
1. 更方便、快捷地浏览和了解项目的历史信息。
2. 有利于保证提交内容的独立性，避免把所有改动都放在一个提交里面。
3. 便于通过脚本自动化生成 CHANGELOG。


## 基本的 message 格式
``` 
<type>[optional scope]: <subject>
[optional body]
[optional footer(s)]
```
其中 message header（即首行）必选，scope、body 和 footer 可选。

### 字数限制
header（首行）：只有一行，不超过 50 个字符
body：每行不超过 72 个字符
footer：每行不超过 72 个字符
::: details 为什么要有字数限制？
header： 像 Linux、Git 这样的开源项目，是以邮件列表作为代码评审的平台，header 要作为邮件的标题，而邮件标题本身就有长 度的限制，并且标题太长也不利于浏览和信息获取。
body 和 footer：源于大部分编程语言的编码规范，最初源于打字机宽度等物理设备的限制，后来慢慢成为默认遵守的规范。
:::
### 1.2.2. 语言选择
在开源项目中：推荐使用英文，因为项目的开发者和参与者可能来自世界各地，使用英文可以更广泛的传递信息。

在内部项目（并且短时间内也不涉及开源）中：应该选择内部人员普遍能够熟练表达的语言。

例如在国内的团队中，可以使用中文。

关于使用中文可能会出现乱码的问题：处理字符集和字符编码的问题应该是每个程序员的必修课。

关于使用英文天然正确性的问题：因地制宜，适合的才是最好的。

## 1.3. message header
### type

::: tip type 用来描述本次提交的改动类型，可选值及对应含义如下：
1. feat: 新增功能
2. fix: 修复 bug
3. docs: 文档相关的改动
4. style: 对代码的格式化改动，代码逻辑并未产生任何变化(例如代码缩进，分号的移除和添加)
5. test: 新增或修改测试用例
6. refactor: 重构代码或其他优化举措
7. chore: 项目工程方面的改动，代码逻辑并未产生任何变化
8. revert: 恢复之前的提交
:::

::: warning
  commit message 的 type 和 changelog 的 type 存在紧密联系，然而它们两者之间并非一一对应，比如在 changelog 中一般不会指出文档 docs 或测试用例 test 等方面发生的变化
css 样式文件的修改一般属于 feat 或者 fix，并不是 style
:::
### scope
scope 用来描述本次提交所涉及到的改动范围（例如模块、功能或其他任何限定的范围）。

scope 的具体取值视项目而定。以淘宝详情页为例，取值可以是：header, footer, favorite, sku, etc...

如果是 monorepo 的项目，scope 取值可以是 subpackage 的名称。例如 babel 项目中对某个 package 的修改：
``` 
  chore(babel-helper-plugin-utils): add npmignore
```

### subject
subject 用来概括和描述本次提交的改动内容，需注意以下几点：

时态方面使用一般现在时，不要使用过去时。虽然查看 message 时，message 内容本身都发生在过去，然而对于主题来说，使用现在时的时态更简洁明确，并且更易达成一致性：

``` 
// good
docs: delete redundant docs

// bad
docs: deleted redundant docs
```
1. 句式使用祈使句。即一般情况不要增加主语。因为在绝大情况下，主语都是作者『我』：

``` 
// good
docs: delete redundant docs

// bad
docs: i delete redundant docs
```
2. 句首无需大写，句尾无需结束标点。因为主题（或标题）本身不用形成完整的句子：
```
// good
docs: delete redundant docs

// bad
docs: Delete redundant docs.
```

### 1.4. message body

日志的内容主体 body 用来描述详细的提交内容，可写可不写，需注意以下几点：

1. 时态方面使用一般现在时，不要用过去时态。
2. 句式视情况而定，一般使用祈使句式。
3. 标点方面遵循一般的文档格式规范。

### 1.5. message footer

footer 通常用于代码评审过程记录、作者签名等。例如：

```markdown
Reported-by: User1 <user1@example.com>
Helped-by: User2 <user2@example.com>
Reviewed-by: User3 <user3@example.com>
Signed-off-by: Author <author@example.com>
```
为什么要有签名区？

因为一个提交的元信息中只有作者（author）、提交者（committer）两个字段，而一段代码的诞生，参与的人往往不止于此，还可能有问题报告者（Reported-by）、代码评审者（Reviewed-by）、上游 Committer 的签名（Signed-off-by）。为此一些开源项目（如 Git、Linux）的一个约定俗成的习惯，是在提交的最后加上签名，每个贡献者一行，从上到下可以看到这段代码诞生的过程。

还可以添加其他元信息，例如：

**引用 Issues**
可以在 commit 信息里使用关键字 + Issue ID（Gitlab / Github 或其他平台的），来表明该提交解决了某个 Issue。推荐使用的关键字有：

``` 
close
closes
closed
fix
fixes
fixed
resolve
resolves
resolved
```
关键字的选用可以根据当前语义、关联的 Issue 是否在当前仓库下，甚至是 commit 消息的长度限制来决定。

``` 
close: 关闭当前仓库的 Issue
fix: 关闭当前或其他仓库的 Issue, 一般指 Bug 修复
resolve: 关闭当前或其他仓库的 Issue
```
关闭多个 Issues 使用如下格式:

``` 
Close #1, #2, #3
Close #1, close #2, close #3

Fix #1, #2, #3
Fix #1, close #2, close #3

Resolve #1, #2, #3
Resolve #1, close #2, close #3
```
**破坏性变动（Breaking changes）**
如果本次提交的改动是破坏性的，需要在这里声明：
==BREAKING CHANGE: 为了组件 API 规范的统一，
本次升级将 size 属性的 value 值从 `s|m|l` 替换为 `small|medium|large`。
请按照如下方式升级：==

``` 
<Button size="s">提交</Button>  改为  <Button size="small">提交</Button>
```
继续使用 size="m" 可能会导致样式错误。

## Git 分支命名规范
### 分支模型选择的说明
目前互联网和社区中流传最广泛的一个分支模型 Git Flow (opens new window)出自 a-successful-git-branching-model (opens new window)这篇十年前的文章，文章作者 Vincent Driessen 在 2020 年三月份的时候已经公开表示，该分支模型已经不适用于现如今持续交付的软件工程方式，推荐在持续交付的软件工程中使用更简单的 Github Flow (opens new window)模型。

### 分支命名
新建分支的命名格式为：{type}-{issue id}-the-thing-you-do

- type：和上文 1.3.1 章节中的 type 保持一致
- issue id：与分支内容相关的 issue id，如果无关，则可以忽略

比如以下格式都满足规范：

- feat-ssr-prefetch：新增 ssr prefetch 功能
- fix-1379-component-insert-order：修复 issue 1379 中提到的组件插入顺序 bug
- revert-14218-memory-leak-on-unmount：回退版本解决 issue 14218 提到的组件卸载时内存泄露的问题

> 注：该命名规范只针对新建的临时分支，不包括如 master、develop 等常驻分支

### 多版本分支命名
在需要同时维护多个版本的项目中，只使用 master 作为主干分支显然是无法满足需求的，但是又不想使用 Git Flow 这种复杂、繁琐的分支结构，那么就可以每发布一个新的版本就单独拉一个新的分支，例如：
- 1.0.0-stable
- 2.0.0-stable

其他开发过程中的分支命名参考上节 2.2 的分支命名规范。

## Git tag 命名规范
Git tag 就是通过语义化的名称来给仓库标注一个个具体的节点。与此同时还可以根据标签名称来大致了解当前项目的兼容性和迭代情况。

命名格式为 v{semver}，semver 是遵循 [semantic version](https://semver.org/lang/zh-CN/) 的版本号，例如 v1.2.3。

相比于使用例如 git tag v1.2.3 这种「轻量标签」，更推荐使用如下命令生成「附注标签」：

git tag -a v1.2.3 -m "发布经销商管理模块"
',NULL,'/img/articleImages/df854277-83ea-420a-a6fa-3bb230c34116.jpeg','15','<p data-v-md-line="1">为什么要对 Git 提交日志（message）的格式进行规范约束？</p>
<ol data-v-md-line="2">
<li>更方便、快捷地浏览和了解项目的历史信息。</li>
<li>有利于保证提交内容的独立性，避免把所有改动都放在一个提交里面。</li>
<li>便于通过脚本自动化生成 CHANGELOG。</li>
</ol>
<h2 data-v-md-heading="基本的-message-格式" id="toc-head-6" data-v-md-line="7">基本的 message 格式</h2>
<div data-v-md-line="8"><div class="v-md-pre-wrapper copy-code-mode v-md-pre-wrapper- line-numbers-mode"><pre class="v-md-prism-"><code>&lt;type&gt;[optional scope]: &lt;subject&gt;


[optional body]
[optional footer(s)]
</code></pre>
<div class="line-numbers-wrapper"><span class="line-number">1</span><br><span class="line-number">2</span><br><span class="line-number">3</span><br></div>
    <button class="v-md-copy-code-btn" type="button">
      <i>
        <svg viewbox="64 64 896 896" focusable="false" data-icon="copy" width="1em" height="1em" fill="currentColor" aria-hidden="true">
          <path d="M832 64H296c-4.4 0-8 3.6-8 8v56c0 4.4 3.6 8 8 8h496v688c0 4.4 3.6 8 8 8h56c4.4 0 8-3.6 8-8V96c0-17.7-14.3-32-32-32zM704 192H192c-17.7 0-32 14.3-32 32v530.7c0 8.5 3.4 16.6 9.4 22.6l173.3 173.3c2.2 2.2 4.7 4 7.4 5.5v1.9h4.2c3.5 1.3 7.2 2 11 2H704c17.7 0 32-14.3 32-32V224c0-17.7-14.3-32-32-32zM350 856.2L263.9 770H350v86.2zM664 888H414V746c0-22.1-17.9-40-40-40H232V264h432v624z"></path>
        </svg>
      </i>
    </button></div></div><p data-v-md-line="13">其中 message header（即首行）必选，scope、body 和 footer 可选。</p>
<h3 data-v-md-heading="字数限制" id="toc-head-14" data-v-md-line="15">字数限制</h3>
<p data-v-md-line="16">header（首行）：只有一行，不超过 50 个字符<br>
body：每行不超过 72 个字符<br>
footer：每行不超过 72 个字符</p>
<details class="v-md-plugin-tip details"><summary>为什么要有字数限制？</summary>
<p data-v-md-line="20">header： 像 Linux、Git 这样的开源项目，是以邮件列表作为代码评审的平台，header 要作为邮件的标题，而邮件标题本身就有长 度的限制，并且标题太长也不利于浏览和信息获取。<br>
body 和 footer：源于大部分编程语言的编码规范，最初源于打字机宽度等物理设备的限制，后来慢慢成为默认遵守的规范。</p>
</details>
<h3 data-v-md-heading="_1-2-2-语言选择" id="toc-head-22" data-v-md-line="23">1.2.2. 语言选择</h3>
<p data-v-md-line="24">在开源项目中：推荐使用英文，因为项目的开发者和参与者可能来自世界各地，使用英文可以更广泛的传递信息。</p>
<p data-v-md-line="26">在内部项目（并且短时间内也不涉及开源）中：应该选择内部人员普遍能够熟练表达的语言。</p>
<p data-v-md-line="28">例如在国内的团队中，可以使用中文。</p>
<p data-v-md-line="30">关于使用中文可能会出现乱码的问题：处理字符集和字符编码的问题应该是每个程序员的必修课。</p>
<p data-v-md-line="32">关于使用英文天然正确性的问题：因地制宜，适合的才是最好的。</p>
<h2 data-v-md-heading="_1-3-message-header" id="toc-head-33" data-v-md-line="34">1.3. message header</h2>
<h3 data-v-md-heading="type" id="toc-head-34" data-v-md-line="35">type</h3>
<div class="v-md-plugin-tip tip"><p class="v-md-plugin-tip-title">type 用来描述本次提交的改动类型，可选值及对应含义如下：</p>
<ol data-v-md-line="38">
<li>feat: 新增功能</li>
<li>fix: 修复 bug</li>
<li>docs: 文档相关的改动</li>
<li>style: 对代码的格式化改动，代码逻辑并未产生任何变化(例如代码缩进，分号的移除和添加)</li>
<li>test: 新增或修改测试用例</li>
<li>refactor: 重构代码或其他优化举措</li>
<li>chore: 项目工程方面的改动，代码逻辑并未产生任何变化</li>
<li>revert: 恢复之前的提交</li>
</ol>
</div>
<div class="v-md-plugin-tip warning"><p class="v-md-plugin-tip-title">注意</p>
<p data-v-md-line="49">commit message 的 type 和 changelog 的 type 存在紧密联系，然而它们两者之间并非一一对应，比如在 changelog 中一般不会指出文档 docs 或测试用例 test 等方面发生的变化<br>
css 样式文件的修改一般属于 feat 或者 fix，并不是 style</p>
</div>
<h3 data-v-md-heading="scope" id="toc-head-51" data-v-md-line="52">scope</h3>
<p data-v-md-line="53">scope 用来描述本次提交所涉及到的改动范围（例如模块、功能或其他任何限定的范围）。</p>
<p data-v-md-line="55">scope 的具体取值视项目而定。以淘宝详情页为例，取值可以是：header, footer, favorite, sku, etc…</p>
<p data-v-md-line="57">如果是 monorepo 的项目，scope 取值可以是 subpackage 的名称。例如 babel 项目中对某个 package 的修改：</p>
<div data-v-md-line="58"><div class="v-md-pre-wrapper copy-code-mode v-md-pre-wrapper- line-numbers-mode"><pre class="v-md-prism-"><code>  chore(babel-helper-plugin-utils): add npmignore
</code></pre>
<div class="line-numbers-wrapper"><span class="line-number">1</span><br></div>
    <button class="v-md-copy-code-btn" type="button">
      <i>
        <svg viewbox="64 64 896 896" focusable="false" data-icon="copy" width="1em" height="1em" fill="currentColor" aria-hidden="true">
          <path d="M832 64H296c-4.4 0-8 3.6-8 8v56c0 4.4 3.6 8 8 8h496v688c0 4.4 3.6 8 8 8h56c4.4 0 8-3.6 8-8V96c0-17.7-14.3-32-32-32zM704 192H192c-17.7 0-32 14.3-32 32v530.7c0 8.5 3.4 16.6 9.4 22.6l173.3 173.3c2.2 2.2 4.7 4 7.4 5.5v1.9h4.2c3.5 1.3 7.2 2 11 2H704c17.7 0 32-14.3 32-32V224c0-17.7-14.3-32-32-32zM350 856.2L263.9 770H350v86.2zM664 888H414V746c0-22.1-17.9-40-40-40H232V264h432v624z"></path>
        </svg>
      </i>
    </button></div></div><h3 data-v-md-heading="subject" id="toc-head-61" data-v-md-line="62">subject</h3>
<p data-v-md-line="63">subject 用来概括和描述本次提交的改动内容，需注意以下几点：</p>
<p data-v-md-line="65">时态方面使用一般现在时，不要使用过去时。虽然查看 message 时，message 内容本身都发生在过去，然而对于主题来说，使用现在时的时态更简洁明确，并且更易达成一致性：</p>
<div data-v-md-line="67"><div class="v-md-pre-wrapper copy-code-mode v-md-pre-wrapper- line-numbers-mode"><pre class="v-md-prism-"><code>// good
docs: delete redundant docs

// bad
docs: deleted redundant docs
</code></pre>
<div class="line-numbers-wrapper"><span class="line-number">1</span><br><span class="line-number">2</span><br><span class="line-number">3</span><br><span class="line-number">4</span><br><span class="line-number">5</span><br></div>
    <button class="v-md-copy-code-btn" type="button">
      <i>
        <svg viewbox="64 64 896 896" focusable="false" data-icon="copy" width="1em" height="1em" fill="currentColor" aria-hidden="true">
          <path d="M832 64H296c-4.4 0-8 3.6-8 8v56c0 4.4 3.6 8 8 8h496v688c0 4.4 3.6 8 8 8h56c4.4 0 8-3.6 8-8V96c0-17.7-14.3-32-32-32zM704 192H192c-17.7 0-32 14.3-32 32v530.7c0 8.5 3.4 16.6 9.4 22.6l173.3 173.3c2.2 2.2 4.7 4 7.4 5.5v1.9h4.2c3.5 1.3 7.2 2 11 2H704c17.7 0 32-14.3 32-32V224c0-17.7-14.3-32-32-32zM350 856.2L263.9 770H350v86.2zM664 888H414V746c0-22.1-17.9-40-40-40H232V264h432v624z"></path>
        </svg>
      </i>
    </button></div></div><ol data-v-md-line="74">
<li>句式使用祈使句。即一般情况不要增加主语。因为在绝大情况下，主语都是作者『我』：</li>
</ol>
<div data-v-md-line="76"><div class="v-md-pre-wrapper copy-code-mode v-md-pre-wrapper- line-numbers-mode"><pre class="v-md-prism-"><code>// good
docs: delete redundant docs

// bad
docs: i delete redundant docs
</code></pre>
<div class="line-numbers-wrapper"><span class="line-number">1</span><br><span class="line-number">2</span><br><span class="line-number">3</span><br><span class="line-number">4</span><br><span class="line-number">5</span><br></div>
    <button class="v-md-copy-code-btn" type="button">
      <i>
        <svg viewbox="64 64 896 896" focusable="false" data-icon="copy" width="1em" height="1em" fill="currentColor" aria-hidden="true">
          <path d="M832 64H296c-4.4 0-8 3.6-8 8v56c0 4.4 3.6 8 8 8h496v688c0 4.4 3.6 8 8 8h56c4.4 0 8-3.6 8-8V96c0-17.7-14.3-32-32-32zM704 192H192c-17.7 0-32 14.3-32 32v530.7c0 8.5 3.4 16.6 9.4 22.6l173.3 173.3c2.2 2.2 4.7 4 7.4 5.5v1.9h4.2c3.5 1.3 7.2 2 11 2H704c17.7 0 32-14.3 32-32V224c0-17.7-14.3-32-32-32zM350 856.2L263.9 770H350v86.2zM664 888H414V746c0-22.1-17.9-40-40-40H232V264h432v624z"></path>
        </svg>
      </i>
    </button></div></div><ol start="2" data-v-md-line="83">
<li>句首无需大写，句尾无需结束标点。因为主题（或标题）本身不用形成完整的句子：</li>
</ol>
<div data-v-md-line="84"><div class="v-md-pre-wrapper copy-code-mode v-md-pre-wrapper- line-numbers-mode"><pre class="v-md-prism-"><code>// good
docs: delete redundant docs

// bad
docs: Delete redundant docs.
</code></pre>
<div class="line-numbers-wrapper"><span class="line-number">1</span><br><span class="line-number">2</span><br><span class="line-number">3</span><br><span class="line-number">4</span><br><span class="line-number">5</span><br></div>
    <button class="v-md-copy-code-btn" type="button">
      <i>
        <svg viewbox="64 64 896 896" focusable="false" data-icon="copy" width="1em" height="1em" fill="currentColor" aria-hidden="true">
          <path d="M832 64H296c-4.4 0-8 3.6-8 8v56c0 4.4 3.6 8 8 8h496v688c0 4.4 3.6 8 8 8h56c4.4 0 8-3.6 8-8V96c0-17.7-14.3-32-32-32zM704 192H192c-17.7 0-32 14.3-32 32v530.7c0 8.5 3.4 16.6 9.4 22.6l173.3 173.3c2.2 2.2 4.7 4 7.4 5.5v1.9h4.2c3.5 1.3 7.2 2 11 2H704c17.7 0 32-14.3 32-32V224c0-17.7-14.3-32-32-32zM350 856.2L263.9 770H350v86.2zM664 888H414V746c0-22.1-17.9-40-40-40H232V264h432v624z"></path>
        </svg>
      </i>
    </button></div></div><h3 data-v-md-heading="_1-4-message-body" id="toc-head-91" data-v-md-line="92">1.4. message body</h3>
<p data-v-md-line="94">日志的内容主体 body 用来描述详细的提交内容，可写可不写，需注意以下几点：</p>
<ol data-v-md-line="96">
<li>时态方面使用一般现在时，不要用过去时态。</li>
<li>句式视情况而定，一般使用祈使句式。</li>
<li>标点方面遵循一般的文档格式规范。</li>
</ol>
<h3 data-v-md-heading="_1-5-message-footer" id="toc-head-99" data-v-md-line="100">1.5. message footer</h3>
<p data-v-md-line="102">footer 通常用于代码评审过程记录、作者签名等。例如：</p>
<div data-v-md-line="104"><div class="v-md-pre-wrapper copy-code-mode v-md-pre-wrapper-markdown line-numbers-mode"><pre class="v-md-prism-markdown"><code>Reported-by: User1 <span class="token tag"><span class="token tag"><span class="token punctuation">&lt;</span>user1@example.com</span><span class="token punctuation">&gt;</span></span>
Helped-by: User2 <span class="token tag"><span class="token tag"><span class="token punctuation">&lt;</span>user2@example.com</span><span class="token punctuation">&gt;</span></span>
Reviewed-by: User3 <span class="token tag"><span class="token tag"><span class="token punctuation">&lt;</span>user3@example.com</span><span class="token punctuation">&gt;</span></span>
Signed-off-by: Author <span class="token tag"><span class="token tag"><span class="token punctuation">&lt;</span>author@example.com</span><span class="token punctuation">&gt;</span></span>
</code></pre>
<div class="line-numbers-wrapper"><span class="line-number">1</span><br><span class="line-number">2</span><br><span class="line-number">3</span><br><span class="line-number">4</span><br></div>
    <button class="v-md-copy-code-btn" type="button">
      <i>
        <svg viewbox="64 64 896 896" focusable="false" data-icon="copy" width="1em" height="1em" fill="currentColor" aria-hidden="true">
          <path d="M832 64H296c-4.4 0-8 3.6-8 8v56c0 4.4 3.6 8 8 8h496v688c0 4.4 3.6 8 8 8h56c4.4 0 8-3.6 8-8V96c0-17.7-14.3-32-32-32zM704 192H192c-17.7 0-32 14.3-32 32v530.7c0 8.5 3.4 16.6 9.4 22.6l173.3 173.3c2.2 2.2 4.7 4 7.4 5.5v1.9h4.2c3.5 1.3 7.2 2 11 2H704c17.7 0 32-14.3 32-32V224c0-17.7-14.3-32-32-32zM350 856.2L263.9 770H350v86.2zM664 888H414V746c0-22.1-17.9-40-40-40H232V264h432v624z"></path>
        </svg>
      </i>
    </button></div></div><p data-v-md-line="110">为什么要有签名区？</p>
<p data-v-md-line="112">因为一个提交的元信息中只有作者（author）、提交者（committer）两个字段，而一段代码的诞生，参与的人往往不止于此，还可能有问题报告者（Reported-by）、代码评审者（Reviewed-by）、上游 Committer 的签名（Signed-off-by）。为此一些开源项目（如 Git、Linux）的一个约定俗成的习惯，是在提交的最后加上签名，每个贡献者一行，从上到下可以看到这段代码诞生的过程。</p>
<p data-v-md-line="114">还可以添加其他元信息，例如：</p>
<p data-v-md-line="116"><strong>引用 Issues</strong><br>
可以在 commit 信息里使用关键字 + Issue ID（Gitlab / Github 或其他平台的），来表明该提交解决了某个 Issue。推荐使用的关键字有：</p>
<div data-v-md-line="119"><div class="v-md-pre-wrapper copy-code-mode v-md-pre-wrapper- line-numbers-mode"><pre class="v-md-prism-"><code>close
closes
closed
fix
fixes
fixed
resolve
resolves
resolved
</code></pre>
<div class="line-numbers-wrapper"><span class="line-number">1</span><br><span class="line-number">2</span><br><span class="line-number">3</span><br><span class="line-number">4</span><br><span class="line-number">5</span><br><span class="line-number">6</span><br><span class="line-number">7</span><br><span class="line-number">8</span><br><span class="line-number">9</span><br></div>
    <button class="v-md-copy-code-btn" type="button">
      <i>
        <svg viewbox="64 64 896 896" focusable="false" data-icon="copy" width="1em" height="1em" fill="currentColor" aria-hidden="true">
          <path d="M832 64H296c-4.4 0-8 3.6-8 8v56c0 4.4 3.6 8 8 8h496v688c0 4.4 3.6 8 8 8h56c4.4 0 8-3.6 8-8V96c0-17.7-14.3-32-32-32zM704 192H192c-17.7 0-32 14.3-32 32v530.7c0 8.5 3.4 16.6 9.4 22.6l173.3 173.3c2.2 2.2 4.7 4 7.4 5.5v1.9h4.2c3.5 1.3 7.2 2 11 2H704c17.7 0 32-14.3 32-32V224c0-17.7-14.3-32-32-32zM350 856.2L263.9 770H350v86.2zM664 888H414V746c0-22.1-17.9-40-40-40H232V264h432v624z"></path>
        </svg>
      </i>
    </button></div></div><p data-v-md-line="130">关键字的选用可以根据当前语义、关联的 Issue 是否在当前仓库下，甚至是 commit 消息的长度限制来决定。</p>
<div data-v-md-line="132"><div class="v-md-pre-wrapper copy-code-mode v-md-pre-wrapper- line-numbers-mode"><pre class="v-md-prism-"><code>close: 关闭当前仓库的 Issue
fix: 关闭当前或其他仓库的 Issue, 一般指 Bug 修复
resolve: 关闭当前或其他仓库的 Issue
</code></pre>
<div class="line-numbers-wrapper"><span class="line-number">1</span><br><span class="line-number">2</span><br><span class="line-number">3</span><br></div>
    <button class="v-md-copy-code-btn" type="button">
      <i>
        <svg viewbox="64 64 896 896" focusable="false" data-icon="copy" width="1em" height="1em" fill="currentColor" aria-hidden="true">
          <path d="M832 64H296c-4.4 0-8 3.6-8 8v56c0 4.4 3.6 8 8 8h496v688c0 4.4 3.6 8 8 8h56c4.4 0 8-3.6 8-8V96c0-17.7-14.3-32-32-32zM704 192H192c-17.7 0-32 14.3-32 32v530.7c0 8.5 3.4 16.6 9.4 22.6l173.3 173.3c2.2 2.2 4.7 4 7.4 5.5v1.9h4.2c3.5 1.3 7.2 2 11 2H704c17.7 0 32-14.3 32-32V224c0-17.7-14.3-32-32-32zM350 856.2L263.9 770H350v86.2zM664 888H414V746c0-22.1-17.9-40-40-40H232V264h432v624z"></path>
        </svg>
      </i>
    </button></div></div><p data-v-md-line="137">关闭多个 Issues 使用如下格式:</p>
<div data-v-md-line="139"><div class="v-md-pre-wrapper copy-code-mode v-md-pre-wrapper- line-numbers-mode"><pre class="v-md-prism-"><code>Close #1, #2, #3
Close #1, close #2, close #3

Fix #1, #2, #3
Fix #1, close #2, close #3

Resolve #1, #2, #3
Resolve #1, close #2, close #3
</code></pre>
<div class="line-numbers-wrapper"><span class="line-number">1</span><br><span class="line-number">2</span><br><span class="line-number">3</span><br><span class="line-number">4</span><br><span class="line-number">5</span><br><span class="line-number">6</span><br><span class="line-number">7</span><br><span class="line-number">8</span><br></div>
    <button class="v-md-copy-code-btn" type="button">
      <i>
        <svg viewbox="64 64 896 896" focusable="false" data-icon="copy" width="1em" height="1em" fill="currentColor" aria-hidden="true">
          <path d="M832 64H296c-4.4 0-8 3.6-8 8v56c0 4.4 3.6 8 8 8h496v688c0 4.4 3.6 8 8 8h56c4.4 0 8-3.6 8-8V96c0-17.7-14.3-32-32-32zM704 192H192c-17.7 0-32 14.3-32 32v530.7c0 8.5 3.4 16.6 9.4 22.6l173.3 173.3c2.2 2.2 4.7 4 7.4 5.5v1.9h4.2c3.5 1.3 7.2 2 11 2H704c17.7 0 32-14.3 32-32V224c0-17.7-14.3-32-32-32zM350 856.2L263.9 770H350v86.2zM664 888H414V746c0-22.1-17.9-40-40-40H232V264h432v624z"></path>
        </svg>
      </i>
    </button></div></div><p data-v-md-line="149"><strong>破坏性变动（Breaking changes）</strong><br>
如果本次提交的改动是破坏性的，需要在这里声明：<br>
<mark>BREAKING CHANGE: 为了组件 API 规范的统一，<br>
本次升级将 size 属性的 value 值从 <code>s|m|l</code> 替换为 <code>small|medium|large</code>。<br>
请按照如下方式升级：</mark></p>
<div data-v-md-line="155"><div class="v-md-pre-wrapper copy-code-mode v-md-pre-wrapper- line-numbers-mode"><pre class="v-md-prism-"><code>&lt;Button size=&quot;s&quot;&gt;提交&lt;/Button&gt;  改为  &lt;Button size=&quot;small&quot;&gt;提交&lt;/Button&gt;


</code></pre>
<div class="line-numbers-wrapper"><span class="line-number">1</span><br></div>
    <button class="v-md-copy-code-btn" type="button">
      <i>
        <svg viewbox="64 64 896 896" focusable="false" data-icon="copy" width="1em" height="1em" fill="currentColor" aria-hidden="true">
          <path d="M832 64H296c-4.4 0-8 3.6-8 8v56c0 4.4 3.6 8 8 8h496v688c0 4.4 3.6 8 8 8h56c4.4 0 8-3.6 8-8V96c0-17.7-14.3-32-32-32zM704 192H192c-17.7 0-32 14.3-32 32v530.7c0 8.5 3.4 16.6 9.4 22.6l173.3 173.3c2.2 2.2 4.7 4 7.4 5.5v1.9h4.2c3.5 1.3 7.2 2 11 2H704c17.7 0 32-14.3 32-32V224c0-17.7-14.3-32-32-32zM350 856.2L263.9 770H350v86.2zM664 888H414V746c0-22.1-17.9-40-40-40H232V264h432v624z"></path>
        </svg>
      </i>
    </button></div></div><p data-v-md-line="158">继续使用 size=“m” 可能会导致样式错误。</p>
<h2 data-v-md-heading="git-分支命名规范" id="toc-head-159" data-v-md-line="160">Git 分支命名规范</h2>
<h3 data-v-md-heading="分支模型选择的说明" id="toc-head-160" data-v-md-line="161">分支模型选择的说明</h3>
<p data-v-md-line="162">目前互联网和社区中流传最广泛的一个分支模型 Git Flow (opens new window)出自 a-successful-git-branching-model (opens new window)这篇十年前的文章，文章作者 Vincent Driessen 在 2020 年三月份的时候已经公开表示，该分支模型已经不适用于现如今持续交付的软件工程方式，推荐在持续交付的软件工程中使用更简单的 Github Flow (opens new window)模型。</p>
<h3 data-v-md-heading="分支命名" id="toc-head-163" data-v-md-line="164">分支命名</h3>
<p data-v-md-line="165">新建分支的命名格式为：{type}-{issue id}-the-thing-you-do</p>
<ul data-v-md-line="167">
<li>type：和上文 1.3.1 章节中的 type 保持一致</li>
<li>issue id：与分支内容相关的 issue id，如果无关，则可以忽略</li>
</ul>
<p data-v-md-line="170">比如以下格式都满足规范：</p>
<ul data-v-md-line="172">
<li>feat-ssr-prefetch：新增 ssr prefetch 功能</li>
<li>fix-1379-component-insert-order：修复 issue 1379 中提到的组件插入顺序 bug</li>
<li>revert-14218-memory-leak-on-unmount：回退版本解决 issue 14218 提到的组件卸载时内存泄露的问题</li>
</ul>
<blockquote data-v-md-line="176">
<p data-v-md-line="176">注：该命名规范只针对新建的临时分支，不包括如 master、develop 等常驻分支</p>
</blockquote>
<h3 data-v-md-heading="多版本分支命名" id="toc-head-177" data-v-md-line="178">多版本分支命名</h3>
<p data-v-md-line="179">在需要同时维护多个版本的项目中，只使用 master 作为主干分支显然是无法满足需求的，但是又不想使用 Git Flow 这种复杂、繁琐的分支结构，那么就可以每发布一个新的版本就单独拉一个新的分支，例如：</p>
<ul data-v-md-line="180">
<li>1.0.0-stable</li>
<li>2.0.0-stable</li>
</ul>
<p data-v-md-line="183">其他开发过程中的分支命名参考上节 2.2 的分支命名规范。</p>
<h2 data-v-md-heading="git-tag-命名规范" id="toc-head-184" data-v-md-line="185">Git tag 命名规范</h2>
<p data-v-md-line="186">Git tag 就是通过语义化的名称来给仓库标注一个个具体的节点。与此同时还可以根据标签名称来大致了解当前项目的兼容性和迭代情况。</p>
<p data-v-md-line="188">命名格式为 v{semver}，semver 是遵循 <a href="https://semver.org/lang/zh-CN/" target="_blank">semantic version<svg xmlns="http://www.w3.org/2000/svg" aria-hidden="true" focusable="false" x="0px" y="0px" viewbox="0 0 100 100" width="15" height="15" class="v-md-svg-outbound"><path fill="currentColor" d="M18.8,85.1h56l0,0c2.2,0,4-1.8,4-4v-32h-8v28h-48v-48h28v-8h-32l0,0c-2.2,0-4,1.8-4,4v56C14.8,83.3,16.6,85.1,18.8,85.1z"></path> <polygon fill="currentColor" points="45.7,48.7 51.3,54.3 77.2,28.5 77.2,37.2 85.2,37.2 85.2,14.9 62.8,14.9 62.8,22.9 71.5,22.9"></polygon></svg></a> 的版本号，例如 v1.2.3。</p>
<p data-v-md-line="190">相比于使用例如 git tag v1.2.3 这种「轻量标签」，更推荐使用如下命令生成「附注标签」：</p>
<p data-v-md-line="192">git tag -a v1.2.3 -m “发布经销商管理模块”</p>
','为什么要对 Git 提交日志（message）的格式进行规范约束？','995');
INSERT INTO `wb_articles` (`aid`,`uid`,`create_date`,`title`,`content`,`modified_date`,`cover_img`,`comments_count`,`main`,`partial_content`,`access_count`)  VALUES ('28','1','2024-08-30 17:43:15','GitHub Actions CI/CD持续集成部署实现过程','# 目标
1. 通过 GitHub 仓库实现项目的自动化构建和部署到私人服务器
2. 在每次 git push 时自动更新服务器上的项目
3. 使用 GitHub Actions 工作流（workflows）简化操作流程
4. 介绍如何将 GitHub 项目构建产物推送至私人服务器
5. 实现跨源代码仓库外运行构建的工作流
6. 提供从头到尾的 GitHub Actions 配置和使用指南

# 流程
1. 项目根目录 添加workflows.yml配置文件
2. 前往github项目中配置Repository secrets 私有变量
3. 服务器安装git并获取其服务器的ssh key，存放入个人github账号中
4. 完成构建，在线项目在git push时会自动更新

## 配置 GitHub Actions 工作流

### 创建工作流配置文件
1. 在项目根目录创建 .github/workflows 文件夹
2. 在该文件夹中创建 deploy.yml 文件

### 编写工作流配置
``` yaml
name: 博客后台部署 (自动触发)

# 提交后的触发器（两个都可以）           # 手动触发器
on:                                     #on:
  push:                                   #workflow_dispatch:
     branches: [master]                     

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2

      - name: 设置Bun
        uses: oven-sh/setup-bun@v1
        with:
          bun-version: latest

      - name: 安装依赖
        run: bun install

      - name: 项目构建打包
        run: bun run build

      # 删除旧的文件
      - name: 清空旧项目文件
        uses: appleboy/ssh-action@v0.1.7
        with:
          host: ${{ secrets.SERVER_HOST }}
          username: ${{ secrets.SERVER_USERNAME }}
          key: ${{ secrets.SERVER_SSH_KEY }}
          script: |
            rm -rf /www/server/nginx/html/admin/*

      # 或者如果你只想上传构建后的文件
      - name: 上传构建后的文件
        uses: appleboy/scp-action@v0.1.7
        with:
          host: ${{ secrets.SERVER_HOST }}
          username: ${{ secrets.SERVER_USERNAME }}
          key: ${{ secrets.SERVER_SSH_KEY }}
          source: "dist/"
          target: "/www/server/nginx/html/admin"
          strip_components: 1 #这样在上传时会删除源路径中的第一个目录（即 dist 目录），直接将 dist 目录中的文件上传到目标目录。
```

## 配置 GitHub Secrets

1. 进入 GitHub 仓库设置
2. 点击 "Secrets and variables" > "Actions"
3. 添加以下 secrets:
> SERVER_HOST: 您的服务器 IP 或域名
SERVER_USER: SSH 用户名
SERVER_SSH_KEY: 服务器的 SSH 私钥

![点击放大](/firstHonoApi/static/img/articleImages/11eba250-312c-4cec-8eec-0a4a85c8f6ad.png)

其中服务器的 SSH 私钥需要在服务器中查询，查询命令：==cd ~/.ssh; cat id_rsa=={.black}   查询结果如下

![点击放大](/firstHonoApi/static/img/articleImages/5333631d-148d-46c4-b1b8-347a5a605d54.png)
将获取的私钥填入secrets中
![点击放大](/firstHonoApi/static/img/articleImages/f528bfc0-d2d5-4b64-a582-4b1f6281ab37.png)

## 服务器配置 Linux环境下

1. 安装 Git：==sudo apt-get install git=={.black}



2. 生成 SSH 密钥对：==ssh-keygen -t rsa -b 4096 -C "your_email@example.com"=={.black} 一直回车即可
3. 查看公钥： ==cd ~/.ssh ; cat id_rsa.pub=={.black}

![点击放大](/firstHonoApi/static/img/articleImages/66b51469-fc7c-4ddf-a7ba-a13e1f0fd841.png)


4. 将上一步以ssh-rsa开头的公钥添加到 GitHub 账户


## 问题及解决方案

### 如果您当前正在使用 OpenSSH 并收到以下错误：

``` bash
  ssh: handshake failed: ssh: unable to authenticate, attempted methods [none publickey]
```
确保您选择的密钥算法受支持。在 Ubuntu 20.04 或更高版本上，您必须明确允许使用 ssh-rsa 算法。将以下行添加到您的 OpenSSH 守护程序文件（可以是 ==/etc/ssh/sshd_config=={.theme} 或 下的插入文件 ==/etc/ssh/sshd_config.d/=={.theme} ）：

``` bash
CASignatureAlgorithms +ssh-rsa
PubkeyAuthentication yes
PermitRootLogin yes
```

修改后重启 SSH 服务：
``` bash
systemctl restart sshd
```

另外，ed25519OpenSSH 默认接受密钥。如果需要，你可以使用它来代替 rsa：[参考文档](https://github.com/appleboy/ssh-action?tab=readme-ov-file#if-you-are-using-openssh)

``` bash
ssh-keygen -t ed25519 -a 200 -C "your_email@example.com"
```

::: details
  完整过程如下所示，下方内容是为了解决（正在使用 OpenSSH 并收到以下错误），不是这个错误的不需要理会
1. 在服务器上生成 SSH 密钥对：登录到您的服务器，然后执行：
``` bash
ssh-keygen -t ed25519 -C "your_email@example.com"
```
按回车接受默认文件位置（通常是 /root/.ssh/id_ed25519）。

2. 查看公钥内容：
``` bash
cat /root/.ssh/id_ed25519.pub
```
3. 将这个公钥内容添加到服务器的 /root/.ssh/authorized_keys 文件中：
``` bash
cat /root/.ssh/id_ed25519.pub >> /root/.ssh/authorized_keys
```

4. 设置正确的权限：
``` bash
chmod 700 /root/.ssh
chmod 600 /root/.ssh/authorized_keys
```

5. 查看私钥内容：
``` bash
cat /root/.ssh/id_ed25519
```
复制整个私钥内容，包括开头的 "-----BEGIN OPENSSH PRIVATE KEY-----" 
和结尾的 "-----END OPENSSH PRIVATE KEY-----"。

6. 因为可能还是不成功，所以建议你在你的 Windows 系统中进行连接测试：
创建一个文件，例如 id_ed25519，将刚才复制的私钥内容粘贴进去。保存文件，并确保它没有 .txt 等扩展名。


使用Windows的PowerShell或者命令行进行连接（ id_ed25519是你复制的ssh key的文件），使用 -v 选项获取详细日志：
``` bash
ssh -i ./id_ed25519 root@你的服务器ip 
```

:::



## 结束
通过遵循本指南，您应该能够成功设置 GitHub Actions 工作流，实现项目的自动化构建和部署。这不仅提高了开发效率，还确保了部署过程的一致性和可靠性。
','2024-09-04 14:49:27','/img/coverRomImg/_____14_VI_2560_1600.jpg','14','<h1 data-v-md-heading="目标" data-v-md-line="1">目标</h1>
<ol data-v-md-line="2">
<li>通过 GitHub 仓库实现项目的自动化构建和部署到私人服务器</li>
<li>在每次 git push 时自动更新服务器上的项目</li>
<li>使用 GitHub Actions 工作流（workflows）简化操作流程</li>
<li>介绍如何将 GitHub 项目构建产物推送至私人服务器</li>
<li>实现跨源代码仓库外运行构建的工作流</li>
<li>提供从头到尾的 GitHub Actions 配置和使用指南</li>
</ol>
<h1 data-v-md-heading="流程" data-v-md-line="9">流程</h1>
<ol data-v-md-line="10">
<li>项目根目录 添加workflows.yml配置文件</li>
<li>前往github项目中配置Repository secrets 私有变量</li>
<li>服务器安装git并获取其服务器的ssh key，存放入个人github账号中</li>
<li>完成构建，在线项目在git push时会自动更新</li>
</ol>
<h2 data-v-md-heading="配置-github-actions-工作流" id="toc-head-14" data-v-md-line="15">配置 GitHub Actions 工作流</h2>
<h3 data-v-md-heading="创建工作流配置文件" id="toc-head-16" data-v-md-line="17">创建工作流配置文件</h3>
<ol data-v-md-line="18">
<li>在项目根目录创建 .github/workflows 文件夹</li>
<li>在该文件夹中创建 deploy.yml 文件</li>
</ol>
<h3 data-v-md-heading="编写工作流配置" id="toc-head-20" data-v-md-line="21">编写工作流配置</h3>
<div data-v-md-line="22"><div class="v-md-pre-wrapper copy-code-mode v-md-pre-wrapper-yaml line-numbers-mode"><pre class="v-md-prism-yaml"><code>name: 博客后台部署 (自动触发)

# 提交后的触发器（两个都可以）           # 手动触发器
on:                                     #on:
  push:                                   #workflow_dispatch:
     branches: [master]                     

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2

      - name: 设置Bun
        uses: oven-sh/setup-bun@v1
        with:
          bun-version: latest

      - name: 安装依赖
        run: bun install

      - name: 项目构建打包
        run: bun run build

      # 删除旧的文件
      - name: 清空旧项目文件
        uses: appleboy/ssh-action@v0.1.7
        with:
          host: ${{ secrets.SERVER_HOST }}
          username: ${{ secrets.SERVER_USERNAME }}
          key: ${{ secrets.SERVER_SSH_KEY }}
          script: |
            rm -rf /www/server/nginx/html/admin/*

      # 或者如果你只想上传构建后的文件
      - name: 上传构建后的文件
        uses: appleboy/scp-action@v0.1.7
        with:
          host: ${{ secrets.SERVER_HOST }}
          username: ${{ secrets.SERVER_USERNAME }}
          key: ${{ secrets.SERVER_SSH_KEY }}
          source: "dist/"
          target: "/www/server/nginx/html/admin"
          strip_components: 1 #这样在上传时会删除源路径中的第一个目录（即 dist 目录），直接将 dist 目录中的文件上传到目标目录。
</code></pre>
<div class="line-numbers-wrapper"><span class="line-number">1</span><br><span class="line-number">2</span><br><span class="line-number">3</span><br><span class="line-number">4</span><br><span class="line-number">5</span><br><span class="line-number">6</span><br><span class="line-number">7</span><br><span class="line-number">8</span><br><span class="line-number">9</span><br><span class="line-number">10</span><br><span class="line-number">11</span><br><span class="line-number">12</span><br><span class="line-number">13</span><br><span class="line-number">14</span><br><span class="line-number">15</span><br><span class="line-number">16</span><br><span class="line-number">17</span><br><span class="line-number">18</span><br><span class="line-number">19</span><br><span class="line-number">20</span><br><span class="line-number">21</span><br><span class="line-number">22</span><br><span class="line-number">23</span><br><span class="line-number">24</span><br><span class="line-number">25</span><br><span class="line-number">26</span><br><span class="line-number">27</span><br><span class="line-number">28</span><br><span class="line-number">29</span><br><span class="line-number">30</span><br><span class="line-number">31</span><br><span class="line-number">32</span><br><span class="line-number">33</span><br><span class="line-number">34</span><br><span class="line-number">35</span><br><span class="line-number">36</span><br><span class="line-number">37</span><br><span class="line-number">38</span><br><span class="line-number">39</span><br><span class="line-number">40</span><br><span class="line-number">41</span><br><span class="line-number">42</span><br><span class="line-number">43</span><br><span class="line-number">44</span><br></div>
    <button class="v-md-copy-code-btn" type="button">
      <i>
        <svg viewBox="64 64 896 896" data-icon="copy" width="1em" height="1em" fill="currentColor">
          <path d="M832 64H296c-4.4 0-8 3.6-8 8v56c0 4.4 3.6 8 8 8h496v688c0 4.4 3.6 8 8 8h56c4.4 0 8-3.6 8-8V96c0-17.7-14.3-32-32-32zM704 192H192c-17.7 0-32 14.3-32 32v530.7c0 8.5 3.4 16.6 9.4 22.6l173.3 173.3c2.2 2.2 4.7 4 7.4 5.5v1.9h4.2c3.5 1.3 7.2 2 11 2H704c17.7 0 32-14.3 32-32V224c0-17.7-14.3-32-32-32zM350 856.2L263.9 770H350v86.2zM664 888H414V746c0-22.1-17.9-40-40-40H232V264h432v624z"></path>
        </svg>
      </i>
    </button></div></div><h2 data-v-md-heading="配置-github-secrets" id="toc-head-68" data-v-md-line="69">配置 GitHub Secrets</h2>
<ol data-v-md-line="71">
<li>进入 GitHub 仓库设置</li>
<li>点击 “Secrets and variables” &gt; “Actions”</li>
<li>添加以下 secrets:</li>
</ol>
<blockquote data-v-md-line="74">
<p data-v-md-line="74">SERVER_HOST: 您的服务器 IP 或域名<br>
SERVER_USER: SSH 用户名<br>
SERVER_SSH_KEY: 服务器的 SSH 私钥</p>
</blockquote>
<p data-v-md-line="78"><img src="/firstHonoApi/static/img/articleImages/11eba250-312c-4cec-8eec-0a4a85c8f6ad.png" alt="点击放大"></p>
<p data-v-md-line="80">其中服务器的 SSH 私钥需要在服务器中查询，查询命令：<mark class="black">cd ~/.ssh; cat id_rsa</mark>   查询结果如下</p>
<p data-v-md-line="82"><img src="/firstHonoApi/static/img/articleImages/5333631d-148d-46c4-b1b8-347a5a605d54.png" alt="点击放大"><br>
将获取的私钥填入secrets中<br>
<img src="/firstHonoApi/static/img/articleImages/f528bfc0-d2d5-4b64-a582-4b1f6281ab37.png" alt="点击放大"></p>
<h2 data-v-md-heading="服务器配置-linux环境下" id="toc-head-85" data-v-md-line="86">服务器配置 Linux环境下</h2>
<ol data-v-md-line="88">
<li>
<p data-v-md-line="88">安装 Git：<mark class="black">sudo apt-get install git</mark></p>
</li>
<li>
<p data-v-md-line="92">生成 SSH 密钥对：<mark class="black">ssh-keygen -t rsa -b 4096 -C “your_email@example.com”</mark> 一直回车即可</p>
</li>
<li>
<p data-v-md-line="93">查看公钥： <mark class="black">cd ~/.ssh ; cat id_rsa.pub</mark></p>
</li>
</ol>
<p data-v-md-line="95"><img src="/firstHonoApi/static/img/articleImages/66b51469-fc7c-4ddf-a7ba-a13e1f0fd841.png" alt="点击放大"></p>
<ol start="4" data-v-md-line="98">
<li>将上一步以ssh-rsa开头的公钥添加到 GitHub 账户</li>
</ol>
<h2 data-v-md-heading="问题及解决方案" id="toc-head-100" data-v-md-line="101">问题及解决方案</h2>
<h3 data-v-md-heading="如果您当前正在使用-openssh-并收到以下错误" id="toc-head-102" data-v-md-line="103">如果您当前正在使用 OpenSSH 并收到以下错误：</h3>
<div data-v-md-line="105"><div class="v-md-pre-wrapper copy-code-mode v-md-pre-wrapper-bash line-numbers-mode"><pre class="v-md-prism-bash"><code>  ssh: handshake failed: ssh: unable to authenticate, attempted methods <span class="token punctuation">[</span>none publickey<span class="token punctuation">]</span>
</code></pre>
<div class="line-numbers-wrapper"><span class="line-number">1</span><br></div>
    <button class="v-md-copy-code-btn" type="button">
      <i>
        <svg viewBox="64 64 896 896" data-icon="copy" width="1em" height="1em" fill="currentColor">
          <path d="M832 64H296c-4.4 0-8 3.6-8 8v56c0 4.4 3.6 8 8 8h496v688c0 4.4 3.6 8 8 8h56c4.4 0 8-3.6 8-8V96c0-17.7-14.3-32-32-32zM704 192H192c-17.7 0-32 14.3-32 32v530.7c0 8.5 3.4 16.6 9.4 22.6l173.3 173.3c2.2 2.2 4.7 4 7.4 5.5v1.9h4.2c3.5 1.3 7.2 2 11 2H704c17.7 0 32-14.3 32-32V224c0-17.7-14.3-32-32-32zM350 856.2L263.9 770H350v86.2zM664 888H414V746c0-22.1-17.9-40-40-40H232V264h432v624z"></path>
        </svg>
      </i>
    </button></div></div><p data-v-md-line="108">确保您选择的密钥算法受支持。在 Ubuntu 20.04 或更高版本上，您必须明确允许使用 ssh-rsa 算法。将以下行添加到您的 OpenSSH 守护程序文件（可以是 <mark class="theme">/etc/ssh/sshd_config</mark> 或 下的插入文件 <mark class="theme">/etc/ssh/sshd_config.d/</mark> ）：</p>
<div data-v-md-line="110"><div class="v-md-pre-wrapper copy-code-mode v-md-pre-wrapper-bash line-numbers-mode"><pre class="v-md-prism-bash"><code>CASignatureAlgorithms +ssh-rsa
PubkeyAuthentication <span class="token function">yes</span>
PermitRootLogin <span class="token function">yes</span>
</code></pre>
<div class="line-numbers-wrapper"><span class="line-number">1</span><br><span class="line-number">2</span><br><span class="line-number">3</span><br></div>
    <button class="v-md-copy-code-btn" type="button">
      <i>
        <svg viewBox="64 64 896 896" data-icon="copy" width="1em" height="1em" fill="currentColor">
          <path d="M832 64H296c-4.4 0-8 3.6-8 8v56c0 4.4 3.6 8 8 8h496v688c0 4.4 3.6 8 8 8h56c4.4 0 8-3.6 8-8V96c0-17.7-14.3-32-32-32zM704 192H192c-17.7 0-32 14.3-32 32v530.7c0 8.5 3.4 16.6 9.4 22.6l173.3 173.3c2.2 2.2 4.7 4 7.4 5.5v1.9h4.2c3.5 1.3 7.2 2 11 2H704c17.7 0 32-14.3 32-32V224c0-17.7-14.3-32-32-32zM350 856.2L263.9 770H350v86.2zM664 888H414V746c0-22.1-17.9-40-40-40H232V264h432v624z"></path>
        </svg>
      </i>
    </button></div></div><p data-v-md-line="116">修改后重启 SSH 服务：</p>
<div data-v-md-line="117"><div class="v-md-pre-wrapper copy-code-mode v-md-pre-wrapper-bash line-numbers-mode"><pre class="v-md-prism-bash"><code>systemctl restart sshd
</code></pre>
<div class="line-numbers-wrapper"><span class="line-number">1</span><br></div>
    <button class="v-md-copy-code-btn" type="button">
      <i>
        <svg viewBox="64 64 896 896" data-icon="copy" width="1em" height="1em" fill="currentColor">
          <path d="M832 64H296c-4.4 0-8 3.6-8 8v56c0 4.4 3.6 8 8 8h496v688c0 4.4 3.6 8 8 8h56c4.4 0 8-3.6 8-8V96c0-17.7-14.3-32-32-32zM704 192H192c-17.7 0-32 14.3-32 32v530.7c0 8.5 3.4 16.6 9.4 22.6l173.3 173.3c2.2 2.2 4.7 4 7.4 5.5v1.9h4.2c3.5 1.3 7.2 2 11 2H704c17.7 0 32-14.3 32-32V224c0-17.7-14.3-32-32-32zM350 856.2L263.9 770H350v86.2zM664 888H414V746c0-22.1-17.9-40-40-40H232V264h432v624z"></path>
        </svg>
      </i>
    </button></div></div><p data-v-md-line="121">另外，ed25519OpenSSH 默认接受密钥。如果需要，你可以使用它来代替 rsa：<a href="https://github.com/appleboy/ssh-action?tab=readme-ov-file#if-you-are-using-openssh" target="_blank">参考文档<svg x="0px" y="0px" viewBox="0 0 100 100" width="15" height="15" class="v-md-svg-outbound"><path fill="currentColor" d="M18.8,85.1h56l0,0c2.2,0,4-1.8,4-4v-32h-8v28h-48v-48h28v-8h-32l0,0c-2.2,0-4,1.8-4,4v56C14.8,83.3,16.6,85.1,18.8,85.1z"></path> <polygon fill="currentColor" points="45.7,48.7 51.3,54.3 77.2,28.5 77.2,37.2 85.2,37.2 85.2,14.9 62.8,14.9 62.8,22.9 71.5,22.9"></polygon></svg></a></p>
<div data-v-md-line="123"><div class="v-md-pre-wrapper copy-code-mode v-md-pre-wrapper-bash line-numbers-mode"><pre class="v-md-prism-bash"><code>ssh-keygen <span class="token parameter variable">-t</span> ed25519 <span class="token parameter variable">-a</span> <span class="token number">200</span> <span class="token parameter variable">-C</span> <span class="token string">"your_email@example.com"</span>
</code></pre>
<div class="line-numbers-wrapper"><span class="line-number">1</span><br></div>
    <button class="v-md-copy-code-btn" type="button">
      <i>
        <svg viewBox="64 64 896 896" data-icon="copy" width="1em" height="1em" fill="currentColor">
          <path d="M832 64H296c-4.4 0-8 3.6-8 8v56c0 4.4 3.6 8 8 8h496v688c0 4.4 3.6 8 8 8h56c4.4 0 8-3.6 8-8V96c0-17.7-14.3-32-32-32zM704 192H192c-17.7 0-32 14.3-32 32v530.7c0 8.5 3.4 16.6 9.4 22.6l173.3 173.3c2.2 2.2 4.7 4 7.4 5.5v1.9h4.2c3.5 1.3 7.2 2 11 2H704c17.7 0 32-14.3 32-32V224c0-17.7-14.3-32-32-32zM350 856.2L263.9 770H350v86.2zM664 888H414V746c0-22.1-17.9-40-40-40H232V264h432v624z"></path>
        </svg>
      </i>
    </button></div></div><details class="v-md-plugin-tip details"><summary>详细信息</summary>
<p data-v-md-line="128">完整过程如下所示，下方内容是为了解决（正在使用 OpenSSH 并收到以下错误），不是这个错误的不需要理会</p>
<ol data-v-md-line="129">
<li>在服务器上生成 SSH 密钥对：登录到您的服务器，然后执行：</li>
</ol>
<div data-v-md-line="130"><div class="v-md-pre-wrapper copy-code-mode v-md-pre-wrapper-bash line-numbers-mode"><pre class="v-md-prism-bash"><code>ssh-keygen <span class="token parameter variable">-t</span> ed25519 <span class="token parameter variable">-C</span> <span class="token string">"your_email@example.com"</span>
</code></pre>
<div class="line-numbers-wrapper"><span class="line-number">1</span><br></div>
    <button class="v-md-copy-code-btn" type="button">
      <i>
        <svg viewBox="64 64 896 896" data-icon="copy" width="1em" height="1em" fill="currentColor">
          <path d="M832 64H296c-4.4 0-8 3.6-8 8v56c0 4.4 3.6 8 8 8h496v688c0 4.4 3.6 8 8 8h56c4.4 0 8-3.6 8-8V96c0-17.7-14.3-32-32-32zM704 192H192c-17.7 0-32 14.3-32 32v530.7c0 8.5 3.4 16.6 9.4 22.6l173.3 173.3c2.2 2.2 4.7 4 7.4 5.5v1.9h4.2c3.5 1.3 7.2 2 11 2H704c17.7 0 32-14.3 32-32V224c0-17.7-14.3-32-32-32zM350 856.2L263.9 770H350v86.2zM664 888H414V746c0-22.1-17.9-40-40-40H232V264h432v624z"></path>
        </svg>
      </i>
    </button></div></div><p data-v-md-line="133">按回车接受默认文件位置（通常是 /root/.ssh/id_ed25519）。</p>
<ol start="2" data-v-md-line="135">
<li>查看公钥内容：</li>
</ol>
<div data-v-md-line="136"><div class="v-md-pre-wrapper copy-code-mode v-md-pre-wrapper-bash line-numbers-mode"><pre class="v-md-prism-bash"><code><span class="token function">cat</span> /root/.ssh/id_ed25519.pub
</code></pre>
<div class="line-numbers-wrapper"><span class="line-number">1</span><br></div>
    <button class="v-md-copy-code-btn" type="button">
      <i>
        <svg viewBox="64 64 896 896" data-icon="copy" width="1em" height="1em" fill="currentColor">
          <path d="M832 64H296c-4.4 0-8 3.6-8 8v56c0 4.4 3.6 8 8 8h496v688c0 4.4 3.6 8 8 8h56c4.4 0 8-3.6 8-8V96c0-17.7-14.3-32-32-32zM704 192H192c-17.7 0-32 14.3-32 32v530.7c0 8.5 3.4 16.6 9.4 22.6l173.3 173.3c2.2 2.2 4.7 4 7.4 5.5v1.9h4.2c3.5 1.3 7.2 2 11 2H704c17.7 0 32-14.3 32-32V224c0-17.7-14.3-32-32-32zM350 856.2L263.9 770H350v86.2zM664 888H414V746c0-22.1-17.9-40-40-40H232V264h432v624z"></path>
        </svg>
      </i>
    </button></div></div><ol start="3" data-v-md-line="139">
<li>将这个公钥内容添加到服务器的 /root/.ssh/authorized_keys 文件中：</li>
</ol>
<div data-v-md-line="140"><div class="v-md-pre-wrapper copy-code-mode v-md-pre-wrapper-bash line-numbers-mode"><pre class="v-md-prism-bash"><code><span class="token function">cat</span> /root/.ssh/id_ed25519.pub <span class="token operator">&gt;&gt;</span> /root/.ssh/authorized_keys
</code></pre>
<div class="line-numbers-wrapper"><span class="line-number">1</span><br></div>
    <button class="v-md-copy-code-btn" type="button">
      <i>
        <svg viewBox="64 64 896 896" data-icon="copy" width="1em" height="1em" fill="currentColor">
          <path d="M832 64H296c-4.4 0-8 3.6-8 8v56c0 4.4 3.6 8 8 8h496v688c0 4.4 3.6 8 8 8h56c4.4 0 8-3.6 8-8V96c0-17.7-14.3-32-32-32zM704 192H192c-17.7 0-32 14.3-32 32v530.7c0 8.5 3.4 16.6 9.4 22.6l173.3 173.3c2.2 2.2 4.7 4 7.4 5.5v1.9h4.2c3.5 1.3 7.2 2 11 2H704c17.7 0 32-14.3 32-32V224c0-17.7-14.3-32-32-32zM350 856.2L263.9 770H350v86.2zM664 888H414V746c0-22.1-17.9-40-40-40H232V264h432v624z"></path>
        </svg>
      </i>
    </button></div></div><ol start="4" data-v-md-line="144">
<li>设置正确的权限：</li>
</ol>
<div data-v-md-line="145"><div class="v-md-pre-wrapper copy-code-mode v-md-pre-wrapper-bash line-numbers-mode"><pre class="v-md-prism-bash"><code><span class="token function">chmod</span> <span class="token number">700</span> /root/.ssh
<span class="token function">chmod</span> <span class="token number">600</span> /root/.ssh/authorized_keys
</code></pre>
<div class="line-numbers-wrapper"><span class="line-number">1</span><br><span class="line-number">2</span><br></div>
    <button class="v-md-copy-code-btn" type="button">
      <i>
        <svg viewBox="64 64 896 896" data-icon="copy" width="1em" height="1em" fill="currentColor">
          <path d="M832 64H296c-4.4 0-8 3.6-8 8v56c0 4.4 3.6 8 8 8h496v688c0 4.4 3.6 8 8 8h56c4.4 0 8-3.6 8-8V96c0-17.7-14.3-32-32-32zM704 192H192c-17.7 0-32 14.3-32 32v530.7c0 8.5 3.4 16.6 9.4 22.6l173.3 173.3c2.2 2.2 4.7 4 7.4 5.5v1.9h4.2c3.5 1.3 7.2 2 11 2H704c17.7 0 32-14.3 32-32V224c0-17.7-14.3-32-32-32zM350 856.2L263.9 770H350v86.2zM664 888H414V746c0-22.1-17.9-40-40-40H232V264h432v624z"></path>
        </svg>
      </i>
    </button></div></div><ol start="5" data-v-md-line="150">
<li>查看私钥内容：</li>
</ol>
<div data-v-md-line="151"><div class="v-md-pre-wrapper copy-code-mode v-md-pre-wrapper-bash line-numbers-mode"><pre class="v-md-prism-bash"><code><span class="token function">cat</span> /root/.ssh/id_ed25519
</code></pre>
<div class="line-numbers-wrapper"><span class="line-number">1</span><br></div>
    <button class="v-md-copy-code-btn" type="button">
      <i>
        <svg viewBox="64 64 896 896" data-icon="copy" width="1em" height="1em" fill="currentColor">
          <path d="M832 64H296c-4.4 0-8 3.6-8 8v56c0 4.4 3.6 8 8 8h496v688c0 4.4 3.6 8 8 8h56c4.4 0 8-3.6 8-8V96c0-17.7-14.3-32-32-32zM704 192H192c-17.7 0-32 14.3-32 32v530.7c0 8.5 3.4 16.6 9.4 22.6l173.3 173.3c2.2 2.2 4.7 4 7.4 5.5v1.9h4.2c3.5 1.3 7.2 2 11 2H704c17.7 0 32-14.3 32-32V224c0-17.7-14.3-32-32-32zM350 856.2L263.9 770H350v86.2zM664 888H414V746c0-22.1-17.9-40-40-40H232V264h432v624z"></path>
        </svg>
      </i>
    </button></div></div><p data-v-md-line="154">复制整个私钥内容，包括开头的 “-----BEGIN OPENSSH PRIVATE KEY-----”<br>
和结尾的 “-----END OPENSSH PRIVATE KEY-----”。</p>
<ol start="6" data-v-md-line="157">
<li>因为可能还是不成功，所以建议你在你的 Windows 系统中进行连接测试：<br>
创建一个文件，例如 id_ed25519，将刚才复制的私钥内容粘贴进去。保存文件，并确保它没有 .txt 等扩展名。</li>
</ol>
<p data-v-md-line="161">使用Windows的PowerShell或者命令行进行连接（ id_ed25519是你复制的ssh key的文件），使用 -v 选项获取详细日志：</p>
<div data-v-md-line="162"><div class="v-md-pre-wrapper copy-code-mode v-md-pre-wrapper-bash line-numbers-mode"><pre class="v-md-prism-bash"><code><span class="token function">ssh</span> <span class="token parameter variable">-i</span> ./id_ed25519 root@你的服务器ip 
</code></pre>
<div class="line-numbers-wrapper"><span class="line-number">1</span><br></div>
    <button class="v-md-copy-code-btn" type="button">
      <i>
        <svg viewBox="64 64 896 896" data-icon="copy" width="1em" height="1em" fill="currentColor">
          <path d="M832 64H296c-4.4 0-8 3.6-8 8v56c0 4.4 3.6 8 8 8h496v688c0 4.4 3.6 8 8 8h56c4.4 0 8-3.6 8-8V96c0-17.7-14.3-32-32-32zM704 192H192c-17.7 0-32 14.3-32 32v530.7c0 8.5 3.4 16.6 9.4 22.6l173.3 173.3c2.2 2.2 4.7 4 7.4 5.5v1.9h4.2c3.5 1.3 7.2 2 11 2H704c17.7 0 32-14.3 32-32V224c0-17.7-14.3-32-32-32zM350 856.2L263.9 770H350v86.2zM664 888H414V746c0-22.1-17.9-40-40-40H232V264h432v624z"></path>
        </svg>
      </i>
    </button></div></div></details>
<h2 data-v-md-heading="结束" id="toc-head-169" data-v-md-line="170">结束</h2>
<p data-v-md-line="171">通过遵循本指南，您应该能够成功设置 GitHub Actions 工作流，实现项目的自动化构建和部署。这不仅提高了开发效率，还确保了部署过程的一致性和可靠性。</p>
','目标','733');
-- ----------------------------
-- Table structure for table wb_articles_types
-- ----------------------------
DROP TABLE IF EXISTS `wb_articles_types`;
CREATE TABLE `wb_articles_types` (
  `aid` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  PRIMARY KEY (`aid`,`type_id`) USING BTREE,
  KEY `type_id` (`type_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of wb_articles_types
-- ----------------------------
INSERT INTO `wb_articles_types` (`aid`,`type_id`)  VALUES ('0','1');
INSERT INTO `wb_articles_types` (`aid`,`type_id`)  VALUES ('1','1');
INSERT INTO `wb_articles_types` (`aid`,`type_id`)  VALUES ('15','1');
INSERT INTO `wb_articles_types` (`aid`,`type_id`)  VALUES ('16','1');
INSERT INTO `wb_articles_types` (`aid`,`type_id`)  VALUES ('18','1');
INSERT INTO `wb_articles_types` (`aid`,`type_id`)  VALUES ('21','1');
INSERT INTO `wb_articles_types` (`aid`,`type_id`)  VALUES ('28','1');
INSERT INTO `wb_articles_types` (`aid`,`type_id`)  VALUES ('0','22');
INSERT INTO `wb_articles_types` (`aid`,`type_id`)  VALUES ('2','22');
INSERT INTO `wb_articles_types` (`aid`,`type_id`)  VALUES ('16','22');
INSERT INTO `wb_articles_types` (`aid`,`type_id`)  VALUES ('18','22');
INSERT INTO `wb_articles_types` (`aid`,`type_id`)  VALUES ('21','22');
INSERT INTO `wb_articles_types` (`aid`,`type_id`)  VALUES ('27','22');
INSERT INTO `wb_articles_types` (`aid`,`type_id`)  VALUES ('28','22');
INSERT INTO `wb_articles_types` (`aid`,`type_id`)  VALUES ('29','22');
INSERT INTO `wb_articles_types` (`aid`,`type_id`)  VALUES ('30','22');
INSERT INTO `wb_articles_types` (`aid`,`type_id`)  VALUES ('33','22');
INSERT INTO `wb_articles_types` (`aid`,`type_id`)  VALUES ('34','22');
INSERT INTO `wb_articles_types` (`aid`,`type_id`)  VALUES ('36','22');
INSERT INTO `wb_articles_types` (`aid`,`type_id`)  VALUES ('37','22');
INSERT INTO `wb_articles_types` (`aid`,`type_id`)  VALUES ('38','22');
INSERT INTO `wb_articles_types` (`aid`,`type_id`)  VALUES ('27','23');
INSERT INTO `wb_articles_types` (`aid`,`type_id`)  VALUES ('28','23');
INSERT INTO `wb_articles_types` (`aid`,`type_id`)  VALUES ('31','23');
INSERT INTO `wb_articles_types` (`aid`,`type_id`)  VALUES ('32','23');
INSERT INTO `wb_articles_types` (`aid`,`type_id`)  VALUES ('2','25');
INSERT INTO `wb_articles_types` (`aid`,`type_id`)  VALUES ('16','25');
INSERT INTO `wb_articles_types` (`aid`,`type_id`)  VALUES ('19','25');
INSERT INTO `wb_articles_types` (`aid`,`type_id`)  VALUES ('15','26');
INSERT INTO `wb_articles_types` (`aid`,`type_id`)  VALUES ('28','26');
INSERT INTO `wb_articles_types` (`aid`,`type_id`)  VALUES ('30','26');
INSERT INTO `wb_articles_types` (`aid`,`type_id`)  VALUES ('35','26');
INSERT INTO `wb_articles_types` (`aid`,`type_id`)  VALUES ('19','27');
INSERT INTO `wb_articles_types` (`aid`,`type_id`)  VALUES ('35','27');
INSERT INTO `wb_articles_types` (`aid`,`type_id`)  VALUES ('18','29');
INSERT INTO `wb_articles_types` (`aid`,`type_id`)  VALUES ('26','30');
INSERT INTO `wb_articles_types` (`aid`,`type_id`)  VALUES ('29','30');
-- ----------------------------
-- Table structure for table wb_articlestype
-- ----------------------------
DROP TABLE IF EXISTS `wb_articlestype`;
CREATE TABLE `wb_articlestype` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(6) DEFAULT NULL,
  `whether_use` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`type_id`) USING BTREE,
  UNIQUE KEY `unique_name_constraint` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of wb_articlestype
-- ----------------------------
INSERT INTO `wb_articlestype` (`type_id`,`name`,`whether_use`)  VALUES ('1','学习记录',1);
INSERT INTO `wb_articlestype` (`type_id`,`name`,`whether_use`)  VALUES ('22','技术分享',1);
INSERT INTO `wb_articlestype` (`type_id`,`name`,`whether_use`)  VALUES ('23','生活记录',1);
INSERT INTO `wb_articlestype` (`type_id`,`name`,`whether_use`)  VALUES ('24','数码分享',1);
INSERT INTO `wb_articlestype` (`type_id`,`name`,`whether_use`)  VALUES ('25','ts-vue',1);
INSERT INTO `wb_articlestype` (`type_id`,`name`,`whether_use`)  VALUES ('26','Linux',1);
INSERT INTO `wb_articlestype` (`type_id`,`name`,`whether_use`)  VALUES ('27','好物分享',1);
INSERT INTO `wb_articlestype` (`type_id`,`name`,`whether_use`)  VALUES ('28','游戏玩家',1);
INSERT INTO `wb_articlestype` (`type_id`,`name`,`whether_use`)  VALUES ('29','bug',1);
INSERT INTO `wb_articlestype` (`type_id`,`name`,`whether_use`)  VALUES ('30','代码规范',1);
INSERT INTO `wb_articlestype` (`type_id`,`name`,`whether_use`)  VALUES ('31','测试',1);
-- ----------------------------
-- Table structure for table wb_comments
-- ----------------------------
DROP TABLE IF EXISTS `wb_comments`;
CREATE TABLE `wb_comments` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) DEFAULT NULL,
  `article_id` int(11) DEFAULT NULL,
  `reply_id` int(11) DEFAULT NULL,
  `ground_id` int(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `user_ip` varchar(255) DEFAULT NULL,
  `create_date` int(11) DEFAULT NULL,
  `head_img` varchar(255) DEFAULT NULL,
  `deviceSystem` varchar(255) DEFAULT NULL,
  `browserSystem` varchar(255) DEFAULT NULL,
  `reply_people` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`comment_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of wb_comments
-- ----------------------------
INSERT INTO `wb_comments` (`comment_id`,`content`,`article_id`,`reply_id`,`ground_id`,`email`,`user_name`,`user_ip`,`create_date`,`head_img`,`deviceSystem`,`browserSystem`,`reply_people`)  VALUES ('26','啊水水','28','0','0','lzyszds@qq.com','lzyszds','广西南宁市','1729236880','/img/comments/NO.0005.jpg','Windows 10','Chrome129.0.0.0',NULL);
INSERT INTO `wb_comments` (`comment_id`,`content`,`article_id`,`reply_id`,`ground_id`,`email`,`user_name`,`user_ip`,`create_date`,`head_img`,`deviceSystem`,`browserSystem`,`reply_people`)  VALUES ('27','飒飒','28','26','26','lzyszds@qq.com','lzyszds','广西南宁市','1729238657','/img/comments/NO.0005.jpg','Windows 10','Chrome129.0.0.0','lzyszds');
INSERT INTO `wb_comments` (`comment_id`,`content`,`article_id`,`reply_id`,`ground_id`,`email`,`user_name`,`user_ip`,`create_date`,`head_img`,`deviceSystem`,`browserSystem`,`reply_people`)  VALUES ('28','阿萨','28','26','26','lzyszds@qq.com','lzyszds','广西南宁市','1729238726','/img/comments/NO.0005.jpg','Windows 10','Chrome129.0.0.0','lzyszds');
INSERT INTO `wb_comments` (`comment_id`,`content`,`article_id`,`reply_id`,`ground_id`,`email`,`user_name`,`user_ip`,`create_date`,`head_img`,`deviceSystem`,`browserSystem`,`reply_people`)  VALUES ('29','顶顶顶','28','28','26','lzyszds@qq.com','lzyszds','广西南宁市','1729238729','/img/comments/NO.0005.jpg','Windows 10','Chrome129.0.0.0','lzyszds');
-- ----------------------------
-- Table structure for table wb_configuration
-- ----------------------------
DROP TABLE IF EXISTS `wb_configuration`;
CREATE TABLE `wb_configuration` (
  `systemset_id` int(11) NOT NULL AUTO_INCREMENT,
  `system_type` varchar(255) DEFAULT 'Blog',
  `system_key` varchar(255) DEFAULT NULL,
  `system_value` text,
  PRIMARY KEY (`systemset_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of wb_configuration
-- ----------------------------
-- ----------------------------
-- Table structure for table wb_footer
-- ----------------------------
DROP TABLE IF EXISTS `wb_footer`;
CREATE TABLE `wb_footer` (
  `footer_id` int(11) NOT NULL AUTO_INCREMENT,
  `footer_type` varchar(10) DEFAULT NULL,
  `footer_content` text,
  `footer_url` text,
  `footer_order` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`footer_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of wb_footer
-- ----------------------------
INSERT INTO `wb_footer` (`footer_id`,`footer_type`,`footer_content`,`footer_url`,`footer_order`,`created_at`)  VALUES ('1','技术支持','VueUse','https://vueuse.org/','1','2024-04-13 13:38:32');
INSERT INTO `wb_footer` (`footer_id`,`footer_type`,`footer_content`,`footer_url`,`footer_order`,`created_at`)  VALUES ('2','协议','隐私协议','https://vueuse.org/','4','2024-04-13 13:40:11');
INSERT INTO `wb_footer` (`footer_id`,`footer_type`,`footer_content`,`footer_url`,`footer_order`,`created_at`)  VALUES ('3','在线工具','图片压缩','https://tinify.cn/','3','2024-04-13 13:41:00');
INSERT INTO `wb_footer` (`footer_id`,`footer_type`,`footer_content`,`footer_url`,`footer_order`,`created_at`)  VALUES ('4','在线工具','地图小工具','https://datav.aliyun.com/portal/school/atlas/area_selector','3','2024-04-13 13:41:40');
INSERT INTO `wb_footer` (`footer_id`,`footer_type`,`footer_content`,`footer_url`,`footer_order`,`created_at`)  VALUES ('5','在线工具','文本对比','https://www.qqxiuzi.cn/zh/wenbenbidui/','3','2024-04-13 13:42:05');
INSERT INTO `wb_footer` (`footer_id`,`footer_type`,`footer_content`,`footer_url`,`footer_order`,`created_at`)  VALUES ('6','Ai工具','通义千文','https://tongyi.aliyun.com/qianwen/','2','2024-04-13 13:44:15');
INSERT INTO `wb_footer` (`footer_id`,`footer_type`,`footer_content`,`footer_url`,`footer_order`,`created_at`)  VALUES ('7','Ai工具','文言一心','https://yiyan.baidu.com/','2','2024-04-13 13:44:38');
INSERT INTO `wb_footer` (`footer_id`,`footer_type`,`footer_content`,`footer_url`,`footer_order`,`created_at`)  VALUES ('8','Ai工具','chatGPT','https://chat.openai.com/chat','2','2024-04-13 13:44:59');
INSERT INTO `wb_footer` (`footer_id`,`footer_type`,`footer_content`,`footer_url`,`footer_order`,`created_at`)  VALUES ('9','Ai工具','Gemini','https://gemini.google.com/app','2','2024-04-13 13:45:34');
-- ----------------------------
-- Table structure for table wb_map_adcode_citycode
-- ----------------------------
DROP TABLE IF EXISTS `wb_map_adcode_citycode`;
CREATE TABLE `wb_map_adcode_citycode` (
  `adcode` int(11) NOT NULL,
  `city` varchar(255) DEFAULT NULL,
  `citycode` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`adcode`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of wb_map_adcode_citycode
-- ----------------------------
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('100000','中华人民共和国',NULL);
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('110000','北京市','010');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('110101','东城区','010');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('110102','西城区','010');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('110105','朝阳区','010');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('110106','丰台区','010');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('110107','石景山区','010');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('110108','海淀区','010');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('110109','门头沟区','010');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('110111','房山区','010');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('110112','通州区','010');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('110113','顺义区','010');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('110114','昌平区','010');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('110115','大兴区','010');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('110116','怀柔区','010');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('110117','平谷区','010');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('110118','密云区','010');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('110119','延庆区','010');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('120000','天津市','022');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('120101','和平区','022');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('120102','河东区','022');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('120103','河西区','022');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('120104','南开区','022');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('120105','河北区','022');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('120106','红桥区','022');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('120110','东丽区','022');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('120111','西青区','022');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('120112','津南区','022');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('120113','北辰区','022');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('120114','武清区','022');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('120115','宝坻区','022');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('120116','滨海新区','022');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('120117','宁河区','022');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('120118','静海区','022');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('120119','蓟州区','022');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130000','河北省',NULL);
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130100','石家庄市','0311');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130102','长安区','0311');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130104','桥西区','0311');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130105','新华区','0311');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130107','井陉矿区','0311');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130108','裕华区','0311');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130109','藁城区','0311');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130110','鹿泉区','0311');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130111','栾城区','0311');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130121','井陉县','0311');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130123','正定县','0311');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130125','行唐县','0311');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130126','灵寿县','0311');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130127','高邑县','0311');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130128','深泽县','0311');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130129','赞皇县','0311');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130130','无极县','0311');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130131','平山县','0311');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130132','元氏县','0311');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130133','赵县','0311');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130181','辛集市','0311');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130183','晋州市','0311');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130184','新乐市','0311');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130200','唐山市','0315');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130202','路南区','0315');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130203','路北区','0315');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130204','古冶区','0315');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130205','开平区','0315');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130207','丰南区','0315');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130208','丰润区','0315');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130209','曹妃甸区','0315');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130224','滦南县','0315');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130225','乐亭县','0315');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130227','迁西县','0315');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130229','玉田县','0315');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130281','遵化市','0315');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130283','迁安市','0315');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130284','滦州市','0315');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130300','秦皇岛市','0335');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130302','海港区','0335');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130303','山海关区','0335');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130304','北戴河区','0335');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130306','抚宁区','0335');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130321','青龙满族自治县','0335');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130322','昌黎县','0335');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130324','卢龙县','0335');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130400','邯郸市','0310');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130402','邯山区','0310');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130403','丛台区','0310');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130404','复兴区','0310');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130406','峰峰矿区','0310');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130407','肥乡区','0310');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130408','永年区','0310');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130423','临漳县','0310');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130424','成安县','0310');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130425','大名县','0310');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130426','涉县','0310');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130427','磁县','0310');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130430','邱县','0310');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130431','鸡泽县','0310');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130432','广平县','0310');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130433','馆陶县','0310');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130434','魏县','0310');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130435','曲周县','0310');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130481','武安市','0310');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130500','邢台市','0319');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130502','襄都区','0319');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130503','信都区','0319');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130505','任泽区','0319');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130506','南和区','0319');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130522','临城县','0319');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130523','内丘县','0319');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130524','柏乡县','0319');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130525','隆尧县','0319');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130528','宁晋县','0319');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130529','巨鹿县','0319');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130530','新河县','0319');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130531','广宗县','0319');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130532','平乡县','0319');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130533','威县','0319');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130534','清河县','0319');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130535','临西县','0319');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130581','南宫市','0319');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130582','沙河市','0319');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130600','保定市','0312');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130602','竞秀区','0312');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130606','莲池区','0312');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130607','满城区','0312');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130608','清苑区','0312');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130609','徐水区','0312');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130623','涞水县','0312');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130624','阜平县','0312');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130626','定兴县','0312');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130627','唐县','0312');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130628','高阳县','0312');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130629','容城县','0312');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130630','涞源县','0312');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130631','望都县','0312');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130632','安新县','0312');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130633','易县','0312');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130634','曲阳县','0312');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130635','蠡县','0312');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130636','顺平县','0312');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130637','博野县','0312');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130638','雄县','0312');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130681','涿州市','0312');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130682','定州市','0312');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130683','安国市','0312');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130684','高碑店市','0312');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130700','张家口市','0313');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130702','桥东区','0313');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130703','桥西区','0313');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130705','宣化区','0313');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130706','下花园区','0313');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130708','万全区','0313');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130709','崇礼区','0313');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130722','张北县','0313');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130723','康保县','0313');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130724','沽源县','0313');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130725','尚义县','0313');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130726','蔚县','0313');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130727','阳原县','0313');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130728','怀安县','0313');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130730','怀来县','0313');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130731','涿鹿县','0313');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130732','赤城县','0313');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130800','承德市','0314');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130802','双桥区','0314');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130803','双滦区','0314');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130804','鹰手营子矿区','0314');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130821','承德县','0314');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130822','兴隆县','0314');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130824','滦平县','0314');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130825','隆化县','0314');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130826','丰宁满族自治县','0314');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130827','宽城满族自治县','0314');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130828','围场满族蒙古族自治县','0314');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130881','平泉市','0314');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130900','沧州市','0317');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130902','新华区','0317');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130903','运河区','0317');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130921','沧县','0317');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130922','青县','0317');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130923','东光县','0317');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130924','海兴县','0317');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130925','盐山县','0317');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130926','肃宁县','0317');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130927','南皮县','0317');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130928','吴桥县','0317');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130929','献县','0317');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130930','孟村回族自治县','0317');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130981','泊头市','0317');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130982','任丘市','0317');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130983','黄骅市','0317');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('130984','河间市','0317');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('131000','廊坊市','0316');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('131002','安次区','0316');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('131003','广阳区','0316');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('131022','固安县','0316');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('131023','永清县','0316');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('131024','香河县','0316');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('131025','大城县','0316');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('131026','文安县','0316');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('131028','大厂回族自治县','0316');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('131081','霸州市','0316');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('131082','三河市','0316');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('131100','衡水市','0318');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('131102','桃城区','0318');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('131103','冀州区','0318');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('131121','枣强县','0318');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('131122','武邑县','0318');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('131123','武强县','0318');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('131124','饶阳县','0318');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('131125','安平县','0318');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('131126','故城县','0318');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('131127','景县','0318');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('131128','阜城县','0318');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('131182','深州市','0318');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('140000','山西省',NULL);
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('140100','太原市','0351');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('140105','小店区','0351');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('140106','迎泽区','0351');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('140107','杏花岭区','0351');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('140108','尖草坪区','0351');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('140109','万柏林区','0351');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('140110','晋源区','0351');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('140121','清徐县','0351');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('140122','阳曲县','0351');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('140123','娄烦县','0351');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('140181','古交市','0351');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('140200','大同市','0352');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('140212','新荣区','0352');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('140213','平城区','0352');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('140214','云冈区','0352');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('140215','云州区','0352');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('140221','阳高县','0352');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('140222','天镇县','0352');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('140223','广灵县','0352');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('140224','灵丘县','0352');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('140225','浑源县','0352');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('140226','左云县','0352');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('140300','阳泉市','0353');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('140302','城区','0353');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('140303','矿区','0353');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('140311','郊区','0353');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('140321','平定县','0353');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('140322','盂县','0353');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('140400','长治市','0355');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('140403','潞州区','0355');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('140404','上党区','0355');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('140405','屯留区','0355');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('140406','潞城区','0355');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('140423','襄垣县','0355');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('140425','平顺县','0355');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('140426','黎城县','0355');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('140427','壶关县','0355');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('140428','长子县','0355');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('140429','武乡县','0355');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('140430','沁县','0355');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('140431','沁源县','0355');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('140500','晋城市','0356');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('140502','城区','0356');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('140521','沁水县','0356');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('140522','阳城县','0356');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('140524','陵川县','0356');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('140525','泽州县','0356');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('140581','高平市','0356');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('140600','朔州市','0349');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('140602','朔城区','0349');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('140603','平鲁区','0349');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('140621','山阴县','0349');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('140622','应县','0349');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('140623','右玉县','0349');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('140681','怀仁市','0349');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('140700','晋中市','0354');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('140702','榆次区','0354');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('140703','太谷区','0354');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('140721','榆社县','0354');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('140722','左权县','0354');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('140723','和顺县','0354');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('140724','昔阳县','0354');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('140725','寿阳县','0354');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('140727','祁县','0354');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('140728','平遥县','0354');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('140729','灵石县','0354');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('140781','介休市','0354');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('140800','运城市','0359');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('140802','盐湖区','0359');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('140821','临猗县','0359');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('140822','万荣县','0359');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('140823','闻喜县','0359');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('140824','稷山县','0359');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('140825','新绛县','0359');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('140826','绛县','0359');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('140827','垣曲县','0359');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('140828','夏县','0359');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('140829','平陆县','0359');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('140830','芮城县','0359');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('140881','永济市','0359');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('140882','河津市','0359');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('140900','忻州市','0350');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('140902','忻府区','0350');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('140921','定襄县','0350');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('140922','五台县','0350');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('140923','代县','0350');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('140924','繁峙县','0350');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('140925','宁武县','0350');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('140926','静乐县','0350');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('140927','神池县','0350');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('140928','五寨县','0350');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('140929','岢岚县','0350');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('140930','河曲县','0350');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('140931','保德县','0350');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('140932','偏关县','0350');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('140981','原平市','0350');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('141000','临汾市','0357');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('141002','尧都区','0357');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('141021','曲沃县','0357');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('141022','翼城县','0357');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('141023','襄汾县','0357');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('141024','洪洞县','0357');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('141025','古县','0357');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('141026','安泽县','0357');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('141027','浮山县','0357');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('141028','吉县','0357');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('141029','乡宁县','0357');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('141030','大宁县','0357');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('141031','隰县','0357');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('141032','永和县','0357');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('141033','蒲县','0357');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('141034','汾西县','0357');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('141081','侯马市','0357');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('141082','霍州市','0357');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('141100','吕梁市','0358');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('141102','离石区','0358');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('141121','文水县','0358');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('141122','交城县','0358');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('141123','兴县','0358');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('141124','临县','0358');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('141125','柳林县','0358');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('141126','石楼县','0358');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('141127','岚县','0358');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('141128','方山县','0358');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('141129','中阳县','0358');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('141130','交口县','0358');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('141181','孝义市','0358');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('141182','汾阳市','0358');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('150000','内蒙古自治区',NULL);
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('150100','呼和浩特市','0471');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('150102','新城区','0471');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('150103','回民区','0471');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('150104','玉泉区','0471');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('150105','赛罕区','0471');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('150121','土默特左旗','0471');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('150122','托克托县','0471');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('150123','和林格尔县','0471');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('150124','清水河县','0471');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('150125','武川县','0471');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('150200','包头市','0472');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('150202','东河区','0472');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('150203','昆都仑区','0472');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('150204','青山区','0472');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('150205','石拐区','0472');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('150206','白云鄂博矿区','0472');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('150207','九原区','0472');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('150221','土默特右旗','0472');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('150222','固阳县','0472');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('150223','达尔罕茂明安联合旗','0472');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('150300','乌海市','0473');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('150302','海勃湾区','0473');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('150303','海南区','0473');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('150304','乌达区','0473');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('150400','赤峰市','0476');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('150402','红山区','0476');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('150403','元宝山区','0476');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('150404','松山区','0476');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('150421','阿鲁科尔沁旗','0476');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('150422','巴林左旗','0476');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('150423','巴林右旗','0476');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('150424','林西县','0476');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('150425','克什克腾旗','0476');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('150426','翁牛特旗','0476');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('150428','喀喇沁旗','0476');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('150429','宁城县','0476');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('150430','敖汉旗','0476');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('150500','通辽市','0475');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('150502','科尔沁区','0475');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('150521','科尔沁左翼中旗','0475');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('150522','科尔沁左翼后旗','0475');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('150523','开鲁县','0475');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('150524','库伦旗','0475');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('150525','奈曼旗','0475');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('150526','扎鲁特旗','0475');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('150581','霍林郭勒市','0475');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('150600','鄂尔多斯市','0477');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('150602','东胜区','0477');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('150603','康巴什区','0477');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('150621','达拉特旗','0477');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('150622','准格尔旗','0477');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('150623','鄂托克前旗','0477');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('150624','鄂托克旗','0477');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('150625','杭锦旗','0477');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('150626','乌审旗','0477');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('150627','伊金霍洛旗','0477');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('150700','呼伦贝尔市','0470');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('150702','海拉尔区','0470');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('150703','扎赉诺尔区','0470');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('150721','阿荣旗','0470');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('150722','莫力达瓦达斡尔族自治旗','0470');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('150723','鄂伦春自治旗','0470');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('150724','鄂温克族自治旗','0470');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('150725','陈巴尔虎旗','0470');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('150726','新巴尔虎左旗','0470');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('150727','新巴尔虎右旗','0470');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('150781','满洲里市','0470');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('150782','牙克石市','0470');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('150783','扎兰屯市','0470');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('150784','额尔古纳市','0470');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('150785','根河市','0470');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('150800','巴彦淖尔市','0478');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('150802','临河区','0478');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('150821','五原县','0478');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('150822','磴口县','0478');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('150823','乌拉特前旗','0478');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('150824','乌拉特中旗','0478');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('150825','乌拉特后旗','0478');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('150826','杭锦后旗','0478');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('150900','乌兰察布市','0474');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('150902','集宁区','0474');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('150921','卓资县','0474');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('150922','化德县','0474');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('150923','商都县','0474');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('150924','兴和县','0474');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('150925','凉城县','0474');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('150926','察哈尔右翼前旗','0474');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('150927','察哈尔右翼中旗','0474');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('150928','察哈尔右翼后旗','0474');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('150929','四子王旗','0474');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('150981','丰镇市','0474');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('152200','兴安盟','0482');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('152201','乌兰浩特市','0482');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('152202','阿尔山市','0482');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('152221','科尔沁右翼前旗','0482');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('152222','科尔沁右翼中旗','0482');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('152223','扎赉特旗','0482');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('152224','突泉县','0482');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('152500','锡林郭勒盟','0479');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('152501','二连浩特市','0479');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('152502','锡林浩特市','0479');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('152522','阿巴嘎旗','0479');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('152523','苏尼特左旗','0479');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('152524','苏尼特右旗','0479');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('152525','东乌珠穆沁旗','0479');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('152526','西乌珠穆沁旗','0479');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('152527','太仆寺旗','0479');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('152528','镶黄旗','0479');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('152529','正镶白旗','0479');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('152530','正蓝旗','0479');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('152531','多伦县','0479');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('152900','阿拉善盟','0483');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('152921','阿拉善左旗','0483');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('152922','阿拉善右旗','0483');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('152923','额济纳旗','0483');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('210000','辽宁省',NULL);
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('210100','沈阳市','024');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('210102','和平区','024');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('210103','沈河区','024');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('210104','大东区','024');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('210105','皇姑区','024');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('210106','铁西区','024');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('210111','苏家屯区','024');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('210112','浑南区','024');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('210113','沈北新区','024');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('210114','于洪区','024');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('210115','辽中区','024');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('210123','康平县','024');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('210124','法库县','024');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('210181','新民市','024');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('210200','大连市','0411');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('210202','中山区','0411');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('210203','西岗区','0411');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('210204','沙河口区','0411');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('210211','甘井子区','0411');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('210212','旅顺口区','0411');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('210213','金州区','0411');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('210214','普兰店区','0411');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('210224','长海县','0411');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('210281','瓦房店市','0411');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('210283','庄河市','0411');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('210300','鞍山市','0412');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('210302','铁东区','0412');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('210303','铁西区','0412');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('210304','立山区','0412');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('210311','千山区','0412');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('210321','台安县','0412');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('210323','岫岩满族自治县','0412');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('210381','海城市','0412');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('210400','抚顺市','0413');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('210402','新抚区','0413');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('210403','东洲区','0413');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('210404','望花区','0413');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('210411','顺城区','0413');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('210421','抚顺县','0413');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('210422','新宾满族自治县','0413');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('210423','清原满族自治县','0413');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('210500','本溪市','0414');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('210502','平山区','0414');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('210503','溪湖区','0414');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('210504','明山区','0414');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('210505','南芬区','0414');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('210521','本溪满族自治县','0414');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('210522','桓仁满族自治县','0414');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('210600','丹东市','0415');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('210602','元宝区','0415');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('210603','振兴区','0415');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('210604','振安区','0415');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('210624','宽甸满族自治县','0415');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('210681','东港市','0415');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('210682','凤城市','0415');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('210700','锦州市','0416');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('210702','古塔区','0416');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('210703','凌河区','0416');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('210711','太和区','0416');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('210726','黑山县','0416');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('210727','义县','0416');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('210781','凌海市','0416');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('210782','北镇市','0416');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('210800','营口市','0417');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('210802','站前区','0417');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('210803','西市区','0417');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('210804','鲅鱼圈区','0417');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('210811','老边区','0417');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('210881','盖州市','0417');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('210882','大石桥市','0417');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('210900','阜新市','0418');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('210902','海州区','0418');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('210903','新邱区','0418');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('210904','太平区','0418');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('210905','清河门区','0418');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('210911','细河区','0418');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('210921','阜新蒙古族自治县','0418');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('210922','彰武县','0418');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('211000','辽阳市','0419');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('211002','白塔区','0419');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('211003','文圣区','0419');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('211004','宏伟区','0419');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('211005','弓长岭区','0419');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('211011','太子河区','0419');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('211021','辽阳县','0419');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('211081','灯塔市','0419');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('211100','盘锦市','0427');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('211102','双台子区','0427');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('211103','兴隆台区','0427');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('211104','大洼区','0427');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('211122','盘山县','0427');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('211200','铁岭市','0410');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('211202','银州区','0410');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('211204','清河区','0410');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('211221','铁岭县','0410');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('211223','西丰县','0410');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('211224','昌图县','0410');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('211281','调兵山市','0410');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('211282','开原市','0410');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('211300','朝阳市','0421');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('211302','双塔区','0421');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('211303','龙城区','0421');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('211321','朝阳县','0421');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('211322','建平县','0421');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('211324','喀喇沁左翼蒙古族自治县','0421');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('211381','北票市','0421');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('211382','凌源市','0421');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('211400','葫芦岛市','0429');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('211402','连山区','0429');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('211403','龙港区','0429');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('211404','南票区','0429');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('211421','绥中县','0429');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('211422','建昌县','0429');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('211481','兴城市','0429');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('220000','吉林省',NULL);
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('220100','长春市','0431');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('220102','南关区','0431');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('220103','宽城区','0431');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('220104','朝阳区','0431');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('220105','二道区','0431');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('220106','绿园区','0431');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('220112','双阳区','0431');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('220113','九台区','0431');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('220122','农安县','0431');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('220182','榆树市','0431');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('220183','德惠市','0431');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('220184','公主岭市','0431');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('220200','吉林市','0432');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('220202','昌邑区','0432');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('220203','龙潭区','0432');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('220204','船营区','0432');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('220211','丰满区','0432');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('220221','永吉县','0432');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('220281','蛟河市','0432');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('220282','桦甸市','0432');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('220283','舒兰市','0432');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('220284','磐石市','0432');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('220300','四平市','0434');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('220302','铁西区','0434');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('220303','铁东区','0434');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('220322','梨树县','0434');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('220323','伊通满族自治县','0434');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('220382','双辽市','0434');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('220400','辽源市','0437');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('220402','龙山区','0437');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('220403','西安区','0437');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('220421','东丰县','0437');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('220422','东辽县','0437');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('220500','通化市','0435');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('220502','东昌区','0435');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('220503','二道江区','0435');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('220521','通化县','0435');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('220523','辉南县','0435');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('220524','柳河县','0435');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('220581','梅河口市','0435');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('220582','集安市','0435');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('220600','白山市','0439');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('220602','浑江区','0439');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('220605','江源区','0439');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('220621','抚松县','0439');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('220622','靖宇县','0439');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('220623','长白朝鲜族自治县','0439');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('220681','临江市','0439');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('220700','松原市','0438');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('220702','宁江区','0438');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('220721','前郭尔罗斯蒙古族自治县','0438');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('220722','长岭县','0438');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('220723','乾安县','0438');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('220781','扶余市','0438');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('220800','白城市','0436');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('220802','洮北区','0436');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('220821','镇赉县','0436');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('220822','通榆县','0436');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('220881','洮南市','0436');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('220882','大安市','0436');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('222400','延边朝鲜族自治州','1433');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('222401','延吉市','1433');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('222402','图们市','1433');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('222403','敦化市','1433');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('222404','珲春市','1433');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('222405','龙井市','1433');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('222406','和龙市','1433');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('222424','汪清县','1433');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('222426','安图县','1433');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('230000','黑龙江省',NULL);
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('230100','哈尔滨市','0451');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('230102','道里区','0451');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('230103','南岗区','0451');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('230104','道外区','0451');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('230108','平房区','0451');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('230109','松北区','0451');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('230110','香坊区','0451');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('230111','呼兰区','0451');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('230112','阿城区','0451');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('230113','双城区','0451');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('230123','依兰县','0451');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('230124','方正县','0451');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('230125','宾县','0451');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('230126','巴彦县','0451');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('230127','木兰县','0451');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('230128','通河县','0451');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('230129','延寿县','0451');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('230183','尚志市','0451');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('230184','五常市','0451');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('230200','齐齐哈尔市','0452');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('230202','龙沙区','0452');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('230203','建华区','0452');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('230204','铁锋区','0452');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('230205','昂昂溪区','0452');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('230206','富拉尔基区','0452');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('230207','碾子山区','0452');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('230208','梅里斯达斡尔族区','0452');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('230221','龙江县','0452');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('230223','依安县','0452');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('230224','泰来县','0452');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('230225','甘南县','0452');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('230227','富裕县','0452');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('230229','克山县','0452');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('230230','克东县','0452');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('230231','拜泉县','0452');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('230281','讷河市','0452');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('230300','鸡西市','0467');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('230302','鸡冠区','0467');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('230303','恒山区','0467');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('230304','滴道区','0467');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('230305','梨树区','0467');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('230306','城子河区','0467');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('230307','麻山区','0467');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('230321','鸡东县','0467');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('230381','虎林市','0467');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('230382','密山市','0467');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('230400','鹤岗市','0468');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('230402','向阳区','0468');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('230403','工农区','0468');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('230404','南山区','0468');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('230405','兴安区','0468');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('230406','东山区','0468');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('230407','兴山区','0468');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('230421','萝北县','0468');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('230422','绥滨县','0468');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('230500','双鸭山市','0469');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('230502','尖山区','0469');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('230503','岭东区','0469');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('230505','四方台区','0469');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('230506','宝山区','0469');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('230521','集贤县','0469');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('230522','友谊县','0469');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('230523','宝清县','0469');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('230524','饶河县','0469');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('230600','大庆市','0459');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('230602','萨尔图区','0459');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('230603','龙凤区','0459');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('230604','让胡路区','0459');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('230605','红岗区','0459');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('230606','大同区','0459');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('230621','肇州县','0459');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('230622','肇源县','0459');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('230623','林甸县','0459');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('230624','杜尔伯特蒙古族自治县','0459');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('230700','伊春市','0458');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('230717','伊美区','0458');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('230718','乌翠区','0458');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('230719','友好区','0458');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('230722','嘉荫县','0458');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('230723','汤旺县','0458');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('230724','丰林县','0458');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('230725','大箐山县','0458');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('230726','南岔县','0458');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('230751','金林区','0458');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('230781','铁力市','0458');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('230800','佳木斯市','0454');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('230803','向阳区','0454');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('230804','前进区','0454');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('230805','东风区','0454');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('230811','郊区','0454');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('230822','桦南县','0454');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('230826','桦川县','0454');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('230828','汤原县','0454');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('230881','同江市','0454');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('230882','富锦市','0454');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('230883','抚远市','0454');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('230900','七台河市','0464');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('230902','新兴区','0464');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('230903','桃山区','0464');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('230904','茄子河区','0464');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('230921','勃利县','0464');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('231000','牡丹江市','0453');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('231002','东安区','0453');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('231003','阳明区','0453');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('231004','爱民区','0453');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('231005','西安区','0453');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('231025','林口县','0453');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('231081','绥芬河市','0453');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('231083','海林市','0453');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('231084','宁安市','0453');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('231085','穆棱市','0453');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('231086','东宁市','0453');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('231100','黑河市','0456');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('231102','爱辉区','0456');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('231123','逊克县','0456');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('231124','孙吴县','0456');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('231181','北安市','0456');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('231182','五大连池市','0456');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('231183','嫩江市','0456');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('231200','绥化市','0455');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('231202','北林区','0455');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('231221','望奎县','0455');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('231222','兰西县','0455');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('231223','青冈县','0455');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('231224','庆安县','0455');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('231225','明水县','0455');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('231226','绥棱县','0455');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('231281','安达市','0455');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('231282','肇东市','0455');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('231283','海伦市','0455');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('232700','大兴安岭地区','0457');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('232701','漠河市','0457');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('232718','加格达奇区','0457');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('232721','呼玛县','0457');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('232722','塔河县','0457');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('310000','上海市','021');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('310101','黄浦区','021');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('310104','徐汇区','021');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('310105','长宁区','021');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('310106','静安区','021');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('310107','普陀区','021');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('310109','虹口区','021');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('310110','杨浦区','021');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('310112','闵行区','021');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('310113','宝山区','021');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('310114','嘉定区','021');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('310115','浦东新区','021');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('310116','金山区','021');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('310117','松江区','021');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('310118','青浦区','021');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('310120','奉贤区','021');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('310151','崇明区','021');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('320000','江苏省',NULL);
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('320100','南京市','025');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('320102','玄武区','025');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('320104','秦淮区','025');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('320105','建邺区','025');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('320106','鼓楼区','025');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('320111','浦口区','025');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('320113','栖霞区','025');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('320114','雨花台区','025');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('320115','江宁区','025');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('320116','六合区','025');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('320117','溧水区','025');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('320118','高淳区','025');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('320200','无锡市','0510');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('320205','锡山区','0510');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('320206','惠山区','0510');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('320211','滨湖区','0510');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('320213','梁溪区','0510');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('320214','新吴区','0510');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('320281','江阴市','0510');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('320282','宜兴市','0510');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('320300','徐州市','0516');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('320302','鼓楼区','0516');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('320303','云龙区','0516');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('320305','贾汪区','0516');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('320311','泉山区','0516');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('320312','铜山区','0516');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('320321','丰县','0516');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('320322','沛县','0516');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('320324','睢宁县','0516');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('320381','新沂市','0516');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('320382','邳州市','0516');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('320400','常州市','0519');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('320402','天宁区','0519');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('320404','钟楼区','0519');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('320411','新北区','0519');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('320412','武进区','0519');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('320413','金坛区','0519');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('320481','溧阳市','0519');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('320500','苏州市','0512');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('320505','虎丘区','0512');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('320506','吴中区','0512');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('320507','相城区','0512');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('320508','姑苏区','0512');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('320509','吴江区','0512');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('320581','常熟市','0512');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('320582','张家港市','0512');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('320583','昆山市','0512');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('320585','太仓市','0512');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('320600','南通市','0513');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('320612','通州区','0513');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('320613','崇川区','0513');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('320614','海门区','0513');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('320623','如东县','0513');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('320681','启东市','0513');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('320682','如皋市','0513');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('320685','海安市','0513');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('320700','连云港市','0518');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('320703','连云区','0518');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('320706','海州区','0518');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('320707','赣榆区','0518');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('320722','东海县','0518');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('320723','灌云县','0518');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('320724','灌南县','0518');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('320800','淮安市','0517');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('320803','淮安区','0517');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('320804','淮阴区','0517');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('320812','清江浦区','0517');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('320813','洪泽区','0517');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('320826','涟水县','0517');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('320830','盱眙县','0517');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('320831','金湖县','0517');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('320900','盐城市','0515');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('320902','亭湖区','0515');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('320903','盐都区','0515');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('320904','大丰区','0515');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('320921','响水县','0515');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('320922','滨海县','0515');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('320923','阜宁县','0515');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('320924','射阳县','0515');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('320925','建湖县','0515');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('320981','东台市','0515');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('321000','扬州市','0514');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('321002','广陵区','0514');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('321003','邗江区','0514');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('321012','江都区','0514');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('321023','宝应县','0514');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('321081','仪征市','0514');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('321084','高邮市','0514');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('321100','镇江市','0511');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('321102','京口区','0511');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('321111','润州区','0511');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('321112','丹徒区','0511');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('321181','丹阳市','0511');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('321182','扬中市','0511');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('321183','句容市','0511');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('321200','泰州市','0523');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('321202','海陵区','0523');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('321203','高港区','0523');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('321204','姜堰区','0523');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('321281','兴化市','0523');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('321282','靖江市','0523');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('321283','泰兴市','0523');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('321300','宿迁市','0527');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('321302','宿城区','0527');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('321311','宿豫区','0527');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('321322','沭阳县','0527');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('321323','泗阳县','0527');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('321324','泗洪县','0527');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('330000','浙江省',NULL);
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('330100','杭州市','0571');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('330102','上城区','0571');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('330105','拱墅区','0571');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('330106','西湖区','0571');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('330108','滨江区','0571');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('330109','萧山区','0571');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('330110','余杭区','0571');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('330111','富阳区','0571');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('330112','临安区','0571');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('330113','临平区','0571');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('330114','钱塘区','0571');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('330122','桐庐县','0571');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('330127','淳安县','0571');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('330182','建德市','0571');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('330200','宁波市','0574');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('330203','海曙区','0574');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('330205','江北区','0574');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('330206','北仑区','0574');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('330211','镇海区','0574');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('330212','鄞州区','0574');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('330213','奉化区','0574');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('330225','象山县','0574');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('330226','宁海县','0574');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('330281','余姚市','0574');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('330282','慈溪市','0574');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('330300','温州市','0577');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('330302','鹿城区','0577');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('330303','龙湾区','0577');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('330304','瓯海区','0577');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('330305','洞头区','0577');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('330324','永嘉县','0577');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('330326','平阳县','0577');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('330327','苍南县','0577');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('330328','文成县','0577');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('330329','泰顺县','0577');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('330381','瑞安市','0577');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('330382','乐清市','0577');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('330383','龙港市','0577');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('330400','嘉兴市','0573');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('330402','南湖区','0573');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('330411','秀洲区','0573');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('330421','嘉善县','0573');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('330424','海盐县','0573');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('330481','海宁市','0573');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('330482','平湖市','0573');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('330483','桐乡市','0573');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('330500','湖州市','0572');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('330502','吴兴区','0572');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('330503','南浔区','0572');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('330521','德清县','0572');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('330522','长兴县','0572');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('330523','安吉县','0572');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('330600','绍兴市','0575');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('330602','越城区','0575');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('330603','柯桥区','0575');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('330604','上虞区','0575');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('330624','新昌县','0575');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('330681','诸暨市','0575');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('330683','嵊州市','0575');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('330700','金华市','0579');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('330702','婺城区','0579');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('330703','金东区','0579');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('330723','武义县','0579');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('330726','浦江县','0579');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('330727','磐安县','0579');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('330781','兰溪市','0579');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('330782','义乌市','0579');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('330783','东阳市','0579');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('330784','永康市','0579');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('330800','衢州市','0570');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('330802','柯城区','0570');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('330803','衢江区','0570');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('330822','常山县','0570');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('330824','开化县','0570');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('330825','龙游县','0570');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('330881','江山市','0570');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('330900','舟山市','0580');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('330902','定海区','0580');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('330903','普陀区','0580');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('330921','岱山县','0580');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('330922','嵊泗县','0580');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('331000','台州市','0576');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('331002','椒江区','0576');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('331003','黄岩区','0576');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('331004','路桥区','0576');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('331022','三门县','0576');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('331023','天台县','0576');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('331024','仙居县','0576');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('331081','温岭市','0576');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('331082','临海市','0576');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('331083','玉环市','0576');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('331100','丽水市','0578');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('331102','莲都区','0578');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('331121','青田县','0578');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('331122','缙云县','0578');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('331123','遂昌县','0578');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('331124','松阳县','0578');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('331125','云和县','0578');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('331126','庆元县','0578');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('331127','景宁畲族自治县','0578');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('331181','龙泉市','0578');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('340000','安徽省',NULL);
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('340100','合肥市','0551');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('340102','瑶海区','0551');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('340103','庐阳区','0551');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('340104','蜀山区','0551');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('340111','包河区','0551');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('340121','长丰县','0551');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('340122','肥东县','0551');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('340123','肥西县','0551');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('340124','庐江县','0551');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('340181','巢湖市','0551');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('340200','芜湖市','0553');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('340202','镜湖区','0553');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('340207','鸠江区','0553');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('340209','弋江区','0553');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('340210','湾沚区','0553');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('340212','繁昌区','0553');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('340223','南陵县','0553');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('340281','无为市','0553');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('340300','蚌埠市','0552');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('340302','龙子湖区','0552');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('340303','蚌山区','0552');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('340304','禹会区','0552');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('340311','淮上区','0552');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('340321','怀远县','0552');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('340322','五河县','0552');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('340323','固镇县','0552');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('340400','淮南市','0554');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('340402','大通区','0554');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('340403','田家庵区','0554');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('340404','谢家集区','0554');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('340405','八公山区','0554');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('340406','潘集区','0554');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('340421','凤台县','0554');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('340422','寿县','0554');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('340500','马鞍山市','0555');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('340503','花山区','0555');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('340504','雨山区','0555');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('340506','博望区','0555');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('340521','当涂县','0555');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('340522','含山县','0555');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('340523','和县','0555');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('340600','淮北市','0561');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('340602','杜集区','0561');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('340603','相山区','0561');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('340604','烈山区','0561');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('340621','濉溪县','0561');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('340700','铜陵市','0562');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('340705','铜官区','0562');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('340706','义安区','0562');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('340711','郊区','0562');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('340722','枞阳县','0562');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('340800','安庆市','0556');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('340802','迎江区','0556');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('340803','大观区','0556');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('340811','宜秀区','0556');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('340822','怀宁县','0556');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('340825','太湖县','0556');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('340826','宿松县','0556');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('340827','望江县','0556');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('340828','岳西县','0556');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('340881','桐城市','0556');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('340882','潜山市','0556');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('341000','黄山市','0559');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('341002','屯溪区','0559');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('341003','黄山区','0559');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('341004','徽州区','0559');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('341021','歙县','0559');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('341022','休宁县','0559');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('341023','黟县','0559');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('341024','祁门县','0559');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('341100','滁州市','0550');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('341102','琅琊区','0550');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('341103','南谯区','0550');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('341122','来安县','0550');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('341124','全椒县','0550');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('341125','定远县','0550');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('341126','凤阳县','0550');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('341181','天长市','0550');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('341182','明光市','0550');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('341200','阜阳市','1558');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('341202','颍州区','1558');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('341203','颍东区','1558');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('341204','颍泉区','1558');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('341221','临泉县','1558');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('341222','太和县','1558');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('341225','阜南县','1558');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('341226','颍上县','1558');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('341282','界首市','1558');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('341300','宿州市','0557');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('341302','埇桥区','0557');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('341321','砀山县','0557');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('341322','萧县','0557');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('341323','灵璧县','0557');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('341324','泗县','0557');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('341500','六安市','0564');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('341502','金安区','0564');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('341503','裕安区','0564');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('341504','叶集区','0564');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('341522','霍邱县','0564');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('341523','舒城县','0564');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('341524','金寨县','0564');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('341525','霍山县','0564');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('341600','亳州市','0558');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('341602','谯城区','0558');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('341621','涡阳县','0558');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('341622','蒙城县','0558');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('341623','利辛县','0558');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('341700','池州市','0566');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('341702','贵池区','0566');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('341721','东至县','0566');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('341722','石台县','0566');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('341723','青阳县','0566');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('341800','宣城市','0563');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('341802','宣州区','0563');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('341821','郎溪县','0563');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('341823','泾县','0563');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('341824','绩溪县','0563');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('341825','旌德县','0563');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('341881','宁国市','0563');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('341882','广德市','0563');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('350000','福建省',NULL);
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('350100','福州市','0591');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('350102','鼓楼区','0591');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('350103','台江区','0591');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('350104','仓山区','0591');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('350105','马尾区','0591');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('350111','晋安区','0591');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('350112','长乐区','0591');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('350121','闽侯县','0591');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('350122','连江县','0591');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('350123','罗源县','0591');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('350124','闽清县','0591');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('350125','永泰县','0591');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('350128','平潭县','0591');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('350181','福清市','0591');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('350200','厦门市','0592');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('350203','思明区','0592');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('350205','海沧区','0592');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('350206','湖里区','0592');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('350211','集美区','0592');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('350212','同安区','0592');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('350213','翔安区','0592');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('350300','莆田市','0594');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('350302','城厢区','0594');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('350303','涵江区','0594');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('350304','荔城区','0594');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('350305','秀屿区','0594');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('350322','仙游县','0594');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('350400','三明市','0598');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('350404','三元区','0598');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('350405','沙县区','0598');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('350421','明溪县','0598');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('350423','清流县','0598');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('350424','宁化县','0598');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('350425','大田县','0598');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('350426','尤溪县','0598');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('350428','将乐县','0598');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('350429','泰宁县','0598');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('350430','建宁县','0598');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('350481','永安市','0598');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('350500','泉州市','0595');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('350502','鲤城区','0595');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('350503','丰泽区','0595');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('350504','洛江区','0595');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('350505','泉港区','0595');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('350521','惠安县','0595');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('350524','安溪县','0595');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('350525','永春县','0595');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('350526','德化县','0595');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('350527','金门县','0595');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('350581','石狮市','0595');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('350582','晋江市','0595');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('350583','南安市','0595');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('350600','漳州市','0596');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('350602','芗城区','0596');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('350603','龙文区','0596');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('350604','龙海区','0596');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('350605','长泰区','0596');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('350622','云霄县','0596');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('350623','漳浦县','0596');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('350624','诏安县','0596');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('350626','东山县','0596');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('350627','南靖县','0596');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('350628','平和县','0596');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('350629','华安县','0596');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('350700','南平市','0599');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('350702','延平区','0599');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('350703','建阳区','0599');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('350721','顺昌县','0599');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('350722','浦城县','0599');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('350723','光泽县','0599');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('350724','松溪县','0599');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('350725','政和县','0599');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('350781','邵武市','0599');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('350782','武夷山市','0599');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('350783','建瓯市','0599');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('350800','龙岩市','0597');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('350802','新罗区','0597');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('350803','永定区','0597');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('350821','长汀县','0597');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('350823','上杭县','0597');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('350824','武平县','0597');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('350825','连城县','0597');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('350881','漳平市','0597');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('350900','宁德市','0593');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('350902','蕉城区','0593');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('350921','霞浦县','0593');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('350922','古田县','0593');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('350923','屏南县','0593');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('350924','寿宁县','0593');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('350925','周宁县','0593');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('350926','柘荣县','0593');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('350981','福安市','0593');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('350982','福鼎市','0593');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('360000','江西省',NULL);
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('360100','南昌市','0791');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('360102','东湖区','0791');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('360103','西湖区','0791');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('360104','青云谱区','0791');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('360111','青山湖区','0791');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('360112','新建区','0791');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('360113','红谷滩区','0791');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('360121','南昌县','0791');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('360123','安义县','0791');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('360124','进贤县','0791');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('360200','景德镇市','0798');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('360202','昌江区','0798');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('360203','珠山区','0798');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('360222','浮梁县','0798');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('360281','乐平市','0798');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('360300','萍乡市','0799');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('360302','安源区','0799');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('360313','湘东区','0799');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('360321','莲花县','0799');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('360322','上栗县','0799');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('360323','芦溪县','0799');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('360400','九江市','0792');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('360402','濂溪区','0792');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('360403','浔阳区','0792');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('360404','柴桑区','0792');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('360423','武宁县','0792');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('360424','修水县','0792');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('360425','永修县','0792');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('360426','德安县','0792');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('360428','都昌县','0792');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('360429','湖口县','0792');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('360430','彭泽县','0792');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('360481','瑞昌市','0792');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('360482','共青城市','0792');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('360483','庐山市','0792');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('360500','新余市','0790');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('360502','渝水区','0790');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('360521','分宜县','0790');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('360600','鹰潭市','0701');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('360602','月湖区','0701');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('360603','余江区','0701');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('360681','贵溪市','0701');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('360700','赣州市','0797');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('360702','章贡区','0797');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('360703','南康区','0797');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('360704','赣县区','0797');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('360722','信丰县','0797');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('360723','大余县','0797');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('360724','上犹县','0797');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('360725','崇义县','0797');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('360726','安远县','0797');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('360728','定南县','0797');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('360729','全南县','0797');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('360730','宁都县','0797');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('360731','于都县','0797');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('360732','兴国县','0797');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('360733','会昌县','0797');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('360734','寻乌县','0797');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('360735','石城县','0797');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('360781','瑞金市','0797');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('360783','龙南市','0797');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('360800','吉安市','0796');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('360802','吉州区','0796');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('360803','青原区','0796');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('360821','吉安县','0796');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('360822','吉水县','0796');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('360823','峡江县','0796');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('360824','新干县','0796');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('360825','永丰县','0796');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('360826','泰和县','0796');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('360827','遂川县','0796');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('360828','万安县','0796');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('360829','安福县','0796');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('360830','永新县','0796');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('360881','井冈山市','0796');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('360900','宜春市','0795');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('360902','袁州区','0795');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('360921','奉新县','0795');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('360922','万载县','0795');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('360923','上高县','0795');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('360924','宜丰县','0795');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('360925','靖安县','0795');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('360926','铜鼓县','0795');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('360981','丰城市','0795');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('360982','樟树市','0795');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('360983','高安市','0795');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('361000','抚州市','0794');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('361002','临川区','0794');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('361003','东乡区','0794');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('361021','南城县','0794');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('361022','黎川县','0794');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('361023','南丰县','0794');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('361024','崇仁县','0794');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('361025','乐安县','0794');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('361026','宜黄县','0794');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('361027','金溪县','0794');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('361028','资溪县','0794');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('361030','广昌县','0794');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('361100','上饶市','0793');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('361102','信州区','0793');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('361103','广丰区','0793');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('361104','广信区','0793');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('361123','玉山县','0793');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('361124','铅山县','0793');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('361125','横峰县','0793');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('361126','弋阳县','0793');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('361127','余干县','0793');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('361128','鄱阳县','0793');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('361129','万年县','0793');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('361130','婺源县','0793');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('361181','德兴市','0793');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('370000','山东省',NULL);
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('370100','济南市','0531');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('370102','历下区','0531');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('370103','市中区','0531');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('370104','槐荫区','0531');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('370105','天桥区','0531');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('370112','历城区','0531');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('370113','长清区','0531');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('370114','章丘区','0531');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('370115','济阳区','0531');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('370116','莱芜区','0531');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('370117','钢城区','0531');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('370124','平阴县','0531');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('370126','商河县','0531');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('370200','青岛市','0532');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('370202','市南区','0532');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('370203','市北区','0532');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('370211','黄岛区','0532');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('370212','崂山区','0532');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('370213','李沧区','0532');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('370214','城阳区','0532');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('370215','即墨区','0532');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('370281','胶州市','0532');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('370283','平度市','0532');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('370285','莱西市','0532');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('370300','淄博市','0533');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('370302','淄川区','0533');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('370303','张店区','0533');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('370304','博山区','0533');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('370305','临淄区','0533');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('370306','周村区','0533');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('370321','桓台县','0533');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('370322','高青县','0533');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('370323','沂源县','0533');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('370400','枣庄市','0632');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('370402','市中区','0632');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('370403','薛城区','0632');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('370404','峄城区','0632');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('370405','台儿庄区','0632');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('370406','山亭区','0632');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('370481','滕州市','0632');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('370500','东营市','0546');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('370502','东营区','0546');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('370503','河口区','0546');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('370505','垦利区','0546');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('370522','利津县','0546');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('370523','广饶县','0546');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('370600','烟台市','0535');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('370602','芝罘区','0535');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('370611','福山区','0535');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('370612','牟平区','0535');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('370613','莱山区','0535');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('370614','蓬莱区','0535');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('370681','龙口市','0535');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('370682','莱阳市','0535');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('370683','莱州市','0535');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('370685','招远市','0535');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('370686','栖霞市','0535');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('370687','海阳市','0535');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('370700','潍坊市','0536');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('370702','潍城区','0536');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('370703','寒亭区','0536');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('370704','坊子区','0536');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('370705','奎文区','0536');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('370724','临朐县','0536');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('370725','昌乐县','0536');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('370781','青州市','0536');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('370782','诸城市','0536');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('370783','寿光市','0536');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('370784','安丘市','0536');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('370785','高密市','0536');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('370786','昌邑市','0536');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('370800','济宁市','0537');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('370811','任城区','0537');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('370812','兖州区','0537');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('370826','微山县','0537');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('370827','鱼台县','0537');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('370828','金乡县','0537');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('370829','嘉祥县','0537');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('370830','汶上县','0537');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('370831','泗水县','0537');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('370832','梁山县','0537');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('370881','曲阜市','0537');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('370883','邹城市','0537');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('370900','泰安市','0538');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('370902','泰山区','0538');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('370911','岱岳区','0538');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('370921','宁阳县','0538');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('370923','东平县','0538');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('370982','新泰市','0538');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('370983','肥城市','0538');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('371000','威海市','0631');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('371002','环翠区','0631');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('371003','文登区','0631');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('371082','荣成市','0631');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('371083','乳山市','0631');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('371100','日照市','0633');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('371102','东港区','0633');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('371103','岚山区','0633');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('371121','五莲县','0633');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('371122','莒县','0633');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('371300','临沂市','0539');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('371302','兰山区','0539');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('371311','罗庄区','0539');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('371312','河东区','0539');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('371321','沂南县','0539');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('371322','郯城县','0539');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('371323','沂水县','0539');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('371324','兰陵县','0539');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('371325','费县','0539');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('371326','平邑县','0539');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('371327','莒南县','0539');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('371328','蒙阴县','0539');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('371329','临沭县','0539');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('371400','德州市','0534');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('371402','德城区','0534');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('371403','陵城区','0534');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('371422','宁津县','0534');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('371423','庆云县','0534');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('371424','临邑县','0534');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('371425','齐河县','0534');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('371426','平原县','0534');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('371427','夏津县','0534');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('371428','武城县','0534');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('371481','乐陵市','0534');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('371482','禹城市','0534');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('371500','聊城市','0635');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('371502','东昌府区','0635');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('371503','茌平区','0635');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('371521','阳谷县','0635');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('371522','莘县','0635');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('371524','东阿县','0635');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('371525','冠县','0635');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('371526','高唐县','0635');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('371581','临清市','0635');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('371600','滨州市','0543');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('371602','滨城区','0543');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('371603','沾化区','0543');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('371621','惠民县','0543');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('371622','阳信县','0543');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('371623','无棣县','0543');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('371625','博兴县','0543');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('371681','邹平市','0543');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('371700','菏泽市','0530');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('371702','牡丹区','0530');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('371703','定陶区','0530');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('371721','曹县','0530');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('371722','单县','0530');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('371723','成武县','0530');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('371724','巨野县','0530');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('371725','郓城县','0530');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('371726','鄄城县','0530');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('371728','东明县','0530');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('410000','河南省',NULL);
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('410100','郑州市','0371');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('410102','中原区','0371');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('410103','二七区','0371');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('410104','管城回族区','0371');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('410105','金水区','0371');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('410106','上街区','0371');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('410108','惠济区','0371');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('410122','中牟县','0371');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('410181','巩义市','0371');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('410182','荥阳市','0371');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('410183','新密市','0371');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('410184','新郑市','0371');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('410185','登封市','0371');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('410200','开封市','0378');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('410202','龙亭区','0378');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('410203','顺河回族区','0378');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('410204','鼓楼区','0378');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('410205','禹王台区','0378');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('410212','祥符区','0378');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('410221','杞县','0378');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('410222','通许县','0378');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('410223','尉氏县','0378');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('410225','兰考县','0378');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('410300','洛阳市','0379');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('410302','老城区','0379');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('410303','西工区','0379');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('410304','瀍河回族区','0379');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('410305','涧西区','0379');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('410307','偃师区','0379');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('410308','孟津区','0379');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('410311','洛龙区','0379');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('410323','新安县','0379');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('410324','栾川县','0379');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('410325','嵩县','0379');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('410326','汝阳县','0379');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('410327','宜阳县','0379');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('410328','洛宁县','0379');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('410329','伊川县','0379');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('410400','平顶山市','0375');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('410402','新华区','0375');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('410403','卫东区','0375');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('410404','石龙区','0375');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('410411','湛河区','0375');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('410421','宝丰县','0375');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('410422','叶县','0375');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('410423','鲁山县','0375');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('410425','郏县','0375');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('410481','舞钢市','0375');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('410482','汝州市','0375');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('410500','安阳市','0372');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('410502','文峰区','0372');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('410503','北关区','0372');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('410505','殷都区','0372');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('410506','龙安区','0372');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('410522','安阳县','0372');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('410523','汤阴县','0372');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('410526','滑县','0372');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('410527','内黄县','0372');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('410581','林州市','0372');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('410600','鹤壁市','0392');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('410602','鹤山区','0392');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('410603','山城区','0392');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('410611','淇滨区','0392');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('410621','浚县','0392');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('410622','淇县','0392');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('410700','新乡市','0373');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('410702','红旗区','0373');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('410703','卫滨区','0373');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('410704','凤泉区','0373');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('410711','牧野区','0373');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('410721','新乡县','0373');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('410724','获嘉县','0373');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('410725','原阳县','0373');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('410726','延津县','0373');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('410727','封丘县','0373');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('410781','卫辉市','0373');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('410782','辉县市','0373');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('410783','长垣市','0373');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('410800','焦作市','0391');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('410802','解放区','0391');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('410803','中站区','0391');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('410804','马村区','0391');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('410811','山阳区','0391');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('410821','修武县','0391');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('410822','博爱县','0391');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('410823','武陟县','0391');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('410825','温县','0391');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('410882','沁阳市','0391');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('410883','孟州市','0391');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('410900','濮阳市','0393');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('410902','华龙区','0393');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('410922','清丰县','0393');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('410923','南乐县','0393');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('410926','范县','0393');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('410927','台前县','0393');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('410928','濮阳县','0393');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('411000','许昌市','0374');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('411002','魏都区','0374');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('411003','建安区','0374');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('411024','鄢陵县','0374');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('411025','襄城县','0374');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('411081','禹州市','0374');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('411082','长葛市','0374');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('411100','漯河市','0395');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('411102','源汇区','0395');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('411103','郾城区','0395');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('411104','召陵区','0395');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('411121','舞阳县','0395');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('411122','临颍县','0395');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('411200','三门峡市','0398');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('411202','湖滨区','0398');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('411203','陕州区','0398');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('411221','渑池县','0398');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('411224','卢氏县','0398');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('411281','义马市','0398');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('411282','灵宝市','0398');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('411300','南阳市','0377');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('411302','宛城区','0377');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('411303','卧龙区','0377');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('411321','南召县','0377');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('411322','方城县','0377');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('411323','西峡县','0377');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('411324','镇平县','0377');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('411325','内乡县','0377');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('411326','淅川县','0377');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('411327','社旗县','0377');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('411328','唐河县','0377');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('411329','新野县','0377');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('411330','桐柏县','0377');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('411381','邓州市','0377');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('411400','商丘市','0370');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('411402','梁园区','0370');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('411403','睢阳区','0370');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('411421','民权县','0370');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('411422','睢县','0370');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('411423','宁陵县','0370');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('411424','柘城县','0370');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('411425','虞城县','0370');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('411426','夏邑县','0370');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('411481','永城市','0370');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('411500','信阳市','0376');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('411502','浉河区','0376');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('411503','平桥区','0376');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('411521','罗山县','0376');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('411522','光山县','0376');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('411523','新县','0376');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('411524','商城县','0376');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('411525','固始县','0376');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('411526','潢川县','0376');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('411527','淮滨县','0376');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('411528','息县','0376');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('411600','周口市','0394');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('411602','川汇区','0394');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('411603','淮阳区','0394');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('411621','扶沟县','0394');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('411622','西华县','0394');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('411623','商水县','0394');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('411624','沈丘县','0394');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('411625','郸城县','0394');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('411627','太康县','0394');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('411628','鹿邑县','0394');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('411681','项城市','0394');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('411700','驻马店市','0396');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('411702','驿城区','0396');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('411721','西平县','0396');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('411722','上蔡县','0396');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('411723','平舆县','0396');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('411724','正阳县','0396');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('411725','确山县','0396');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('411726','泌阳县','0396');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('411727','汝南县','0396');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('411728','遂平县','0396');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('411729','新蔡县','0396');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('419001','济源市','1391');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('420000','湖北省',NULL);
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('420100','武汉市','027');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('420102','江岸区','027');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('420103','江汉区','027');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('420104','硚口区','027');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('420105','汉阳区','027');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('420106','武昌区','027');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('420107','青山区','027');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('420111','洪山区','027');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('420112','东西湖区','027');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('420113','汉南区','027');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('420114','蔡甸区','027');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('420115','江夏区','027');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('420116','黄陂区','027');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('420117','新洲区','027');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('420200','黄石市','0714');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('420202','黄石港区','0714');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('420203','西塞山区','0714');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('420204','下陆区','0714');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('420205','铁山区','0714');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('420222','阳新县','0714');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('420281','大冶市','0714');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('420300','十堰市','0719');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('420302','茅箭区','0719');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('420303','张湾区','0719');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('420304','郧阳区','0719');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('420322','郧西县','0719');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('420323','竹山县','0719');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('420324','竹溪县','0719');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('420325','房县','0719');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('420381','丹江口市','0719');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('420500','宜昌市','0717');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('420502','西陵区','0717');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('420503','伍家岗区','0717');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('420504','点军区','0717');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('420505','猇亭区','0717');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('420506','夷陵区','0717');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('420525','远安县','0717');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('420526','兴山县','0717');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('420527','秭归县','0717');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('420528','长阳土家族自治县','0717');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('420529','五峰土家族自治县','0717');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('420581','宜都市','0717');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('420582','当阳市','0717');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('420583','枝江市','0717');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('420600','襄阳市','0710');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('420602','襄城区','0710');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('420606','樊城区','0710');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('420607','襄州区','0710');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('420624','南漳县','0710');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('420625','谷城县','0710');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('420626','保康县','0710');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('420682','老河口市','0710');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('420683','枣阳市','0710');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('420684','宜城市','0710');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('420700','鄂州市','0711');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('420702','梁子湖区','0711');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('420703','华容区','0711');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('420704','鄂城区','0711');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('420800','荆门市','0724');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('420802','东宝区','0724');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('420804','掇刀区','0724');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('420822','沙洋县','0724');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('420881','钟祥市','0724');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('420882','京山市','0724');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('420900','孝感市','0712');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('420902','孝南区','0712');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('420921','孝昌县','0712');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('420922','大悟县','0712');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('420923','云梦县','0712');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('420981','应城市','0712');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('420982','安陆市','0712');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('420984','汉川市','0712');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('421000','荆州市','0716');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('421002','沙市区','0716');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('421003','荆州区','0716');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('421022','公安县','0716');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('421024','江陵县','0716');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('421081','石首市','0716');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('421083','洪湖市','0716');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('421087','松滋市','0716');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('421088','监利市','0716');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('421100','黄冈市','0713');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('421102','黄州区','0713');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('421121','团风县','0713');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('421122','红安县','0713');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('421123','罗田县','0713');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('421124','英山县','0713');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('421125','浠水县','0713');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('421126','蕲春县','0713');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('421127','黄梅县','0713');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('421181','麻城市','0713');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('421182','武穴市','0713');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('421200','咸宁市','0715');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('421202','咸安区','0715');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('421221','嘉鱼县','0715');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('421222','通城县','0715');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('421223','崇阳县','0715');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('421224','通山县','0715');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('421281','赤壁市','0715');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('421300','随州市','0722');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('421303','曾都区','0722');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('421321','随县','0722');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('421381','广水市','0722');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('422800','恩施土家族苗族自治州','0718');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('422801','恩施市','0718');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('422802','利川市','0718');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('422822','建始县','0718');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('422823','巴东县','0718');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('422825','宣恩县','0718');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('422826','咸丰县','0718');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('422827','来凤县','0718');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('422828','鹤峰县','0718');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('429004','仙桃市','0728');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('429005','潜江市','2728');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('429006','天门市','1728');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('429021','神农架林区','1719');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('430000','湖南省',NULL);
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('430100','长沙市','0731');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('430102','芙蓉区','0731');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('430103','天心区','0731');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('430104','岳麓区','0731');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('430105','开福区','0731');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('430111','雨花区','0731');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('430112','望城区','0731');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('430121','长沙县','0731');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('430181','浏阳市','0731');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('430182','宁乡市','0731');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('430200','株洲市','0733');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('430202','荷塘区','0733');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('430203','芦淞区','0733');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('430204','石峰区','0733');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('430211','天元区','0733');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('430212','渌口区','0733');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('430223','攸县','0733');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('430224','茶陵县','0733');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('430225','炎陵县','0733');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('430281','醴陵市','0733');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('430300','湘潭市','0732');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('430302','雨湖区','0732');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('430304','岳塘区','0732');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('430321','湘潭县','0732');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('430381','湘乡市','0732');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('430382','韶山市','0732');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('430400','衡阳市','0734');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('430405','珠晖区','0734');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('430406','雁峰区','0734');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('430407','石鼓区','0734');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('430408','蒸湘区','0734');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('430412','南岳区','0734');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('430421','衡阳县','0734');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('430422','衡南县','0734');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('430423','衡山县','0734');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('430424','衡东县','0734');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('430426','祁东县','0734');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('430481','耒阳市','0734');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('430482','常宁市','0734');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('430500','邵阳市','0739');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('430502','双清区','0739');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('430503','大祥区','0739');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('430511','北塔区','0739');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('430522','新邵县','0739');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('430523','邵阳县','0739');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('430524','隆回县','0739');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('430525','洞口县','0739');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('430527','绥宁县','0739');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('430528','新宁县','0739');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('430529','城步苗族自治县','0739');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('430581','武冈市','0739');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('430582','邵东市','0739');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('430600','岳阳市','0730');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('430602','岳阳楼区','0730');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('430603','云溪区','0730');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('430611','君山区','0730');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('430621','岳阳县','0730');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('430623','华容县','0730');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('430624','湘阴县','0730');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('430626','平江县','0730');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('430681','汨罗市','0730');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('430682','临湘市','0730');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('430700','常德市','0736');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('430702','武陵区','0736');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('430703','鼎城区','0736');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('430721','安乡县','0736');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('430722','汉寿县','0736');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('430723','澧县','0736');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('430724','临澧县','0736');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('430725','桃源县','0736');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('430726','石门县','0736');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('430781','津市市','0736');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('430800','张家界市','0744');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('430802','永定区','0744');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('430811','武陵源区','0744');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('430821','慈利县','0744');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('430822','桑植县','0744');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('430900','益阳市','0737');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('430902','资阳区','0737');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('430903','赫山区','0737');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('430921','南县','0737');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('430922','桃江县','0737');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('430923','安化县','0737');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('430981','沅江市','0737');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('431000','郴州市','0735');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('431002','北湖区','0735');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('431003','苏仙区','0735');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('431021','桂阳县','0735');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('431022','宜章县','0735');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('431023','永兴县','0735');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('431024','嘉禾县','0735');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('431025','临武县','0735');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('431026','汝城县','0735');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('431027','桂东县','0735');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('431028','安仁县','0735');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('431081','资兴市','0735');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('431100','永州市','0746');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('431102','零陵区','0746');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('431103','冷水滩区','0746');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('431122','东安县','0746');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('431123','双牌县','0746');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('431124','道县','0746');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('431125','江永县','0746');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('431126','宁远县','0746');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('431127','蓝山县','0746');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('431128','新田县','0746');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('431129','江华瑶族自治县','0746');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('431181','祁阳市','0746');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('431200','怀化市','0745');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('431202','鹤城区','0745');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('431221','中方县','0745');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('431222','沅陵县','0745');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('431223','辰溪县','0745');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('431224','溆浦县','0745');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('431225','会同县','0745');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('431226','麻阳苗族自治县','0745');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('431227','新晃侗族自治县','0745');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('431228','芷江侗族自治县','0745');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('431229','靖州苗族侗族自治县','0745');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('431230','通道侗族自治县','0745');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('431281','洪江市','0745');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('431300','娄底市','0738');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('431302','娄星区','0738');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('431321','双峰县','0738');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('431322','新化县','0738');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('431381','冷水江市','0738');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('431382','涟源市','0738');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('433100','湘西土家族苗族自治州','0743');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('433101','吉首市','0743');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('433122','泸溪县','0743');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('433123','凤凰县','0743');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('433124','花垣县','0743');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('433125','保靖县','0743');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('433126','古丈县','0743');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('433127','永顺县','0743');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('433130','龙山县','0743');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('440000','广东省',NULL);
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('440100','广州市','020');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('440103','荔湾区','020');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('440104','越秀区','020');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('440105','海珠区','020');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('440106','天河区','020');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('440111','白云区','020');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('440112','黄埔区','020');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('440113','番禺区','020');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('440114','花都区','020');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('440115','南沙区','020');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('440117','从化区','020');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('440118','增城区','020');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('440200','韶关市','0751');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('440203','武江区','0751');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('440204','浈江区','0751');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('440205','曲江区','0751');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('440222','始兴县','0751');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('440224','仁化县','0751');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('440229','翁源县','0751');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('440232','乳源瑶族自治县','0751');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('440233','新丰县','0751');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('440281','乐昌市','0751');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('440282','南雄市','0751');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('440300','深圳市','0755');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('440303','罗湖区','0755');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('440304','福田区','0755');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('440305','南山区','0755');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('440306','宝安区','0755');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('440307','龙岗区','0755');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('440308','盐田区','0755');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('440309','龙华区','0755');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('440310','坪山区','0755');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('440311','光明区','0755');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('440400','珠海市','0756');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('440402','香洲区','0756');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('440403','斗门区','0756');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('440404','金湾区','0756');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('440500','汕头市','0754');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('440507','龙湖区','0754');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('440511','金平区','0754');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('440512','濠江区','0754');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('440513','潮阳区','0754');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('440514','潮南区','0754');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('440515','澄海区','0754');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('440523','南澳县','0754');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('440600','佛山市','0757');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('440604','禅城区','0757');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('440605','南海区','0757');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('440606','顺德区','0757');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('440607','三水区','0757');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('440608','高明区','0757');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('440700','江门市','0750');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('440703','蓬江区','0750');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('440704','江海区','0750');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('440705','新会区','0750');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('440781','台山市','0750');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('440783','开平市','0750');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('440784','鹤山市','0750');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('440785','恩平市','0750');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('440800','湛江市','0759');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('440802','赤坎区','0759');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('440803','霞山区','0759');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('440804','坡头区','0759');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('440811','麻章区','0759');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('440823','遂溪县','0759');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('440825','徐闻县','0759');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('440881','廉江市','0759');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('440882','雷州市','0759');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('440883','吴川市','0759');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('440900','茂名市','0668');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('440902','茂南区','0668');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('440904','电白区','0668');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('440981','高州市','0668');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('440982','化州市','0668');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('440983','信宜市','0668');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('441200','肇庆市','0758');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('441202','端州区','0758');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('441203','鼎湖区','0758');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('441204','高要区','0758');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('441223','广宁县','0758');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('441224','怀集县','0758');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('441225','封开县','0758');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('441226','德庆县','0758');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('441284','四会市','0758');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('441300','惠州市','0752');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('441302','惠城区','0752');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('441303','惠阳区','0752');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('441322','博罗县','0752');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('441323','惠东县','0752');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('441324','龙门县','0752');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('441400','梅州市','0753');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('441402','梅江区','0753');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('441403','梅县区','0753');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('441422','大埔县','0753');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('441423','丰顺县','0753');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('441424','五华县','0753');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('441426','平远县','0753');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('441427','蕉岭县','0753');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('441481','兴宁市','0753');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('441500','汕尾市','0660');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('441502','城区','0660');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('441521','海丰县','0660');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('441523','陆河县','0660');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('441581','陆丰市','0660');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('441600','河源市','0762');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('441602','源城区','0762');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('441621','紫金县','0762');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('441622','龙川县','0762');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('441623','连平县','0762');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('441624','和平县','0762');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('441625','东源县','0762');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('441700','阳江市','0662');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('441702','江城区','0662');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('441704','阳东区','0662');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('441721','阳西县','0662');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('441781','阳春市','0662');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('441800','清远市','0763');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('441802','清城区','0763');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('441803','清新区','0763');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('441821','佛冈县','0763');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('441823','阳山县','0763');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('441825','连山壮族瑶族自治县','0763');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('441826','连南瑶族自治县','0763');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('441881','英德市','0763');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('441882','连州市','0763');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('441900','东莞市','0769');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('442000','中山市','0760');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('445100','潮州市','0768');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('445102','湘桥区','0768');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('445103','潮安区','0768');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('445122','饶平县','0768');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('445200','揭阳市','0663');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('445202','榕城区','0663');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('445203','揭东区','0663');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('445222','揭西县','0663');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('445224','惠来县','0663');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('445281','普宁市','0663');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('445300','云浮市','0766');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('445302','云城区','0766');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('445303','云安区','0766');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('445321','新兴县','0766');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('445322','郁南县','0766');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('445381','罗定市','0766');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('450000','广西壮族自治区',NULL);
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('450100','南宁市','0771');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('450102','兴宁区','0771');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('450103','青秀区','0771');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('450105','江南区','0771');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('450107','西乡塘区','0771');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('450108','良庆区','0771');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('450109','邕宁区','0771');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('450110','武鸣区','0771');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('450123','隆安县','0771');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('450124','马山县','0771');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('450125','上林县','0771');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('450126','宾阳县','0771');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('450181','横州市','0771');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('450200','柳州市','0772');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('450202','城中区','0772');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('450203','鱼峰区','0772');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('450204','柳南区','0772');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('450205','柳北区','0772');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('450206','柳江区','0772');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('450222','柳城县','0772');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('450223','鹿寨县','0772');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('450224','融安县','0772');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('450225','融水苗族自治县','0772');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('450226','三江侗族自治县','0772');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('450300','桂林市','0773');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('450302','秀峰区','0773');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('450303','叠彩区','0773');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('450304','象山区','0773');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('450305','七星区','0773');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('450311','雁山区','0773');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('450312','临桂区','0773');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('450321','阳朔县','0773');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('450323','灵川县','0773');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('450324','全州县','0773');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('450325','兴安县','0773');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('450326','永福县','0773');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('450327','灌阳县','0773');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('450328','龙胜各族自治县','0773');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('450329','资源县','0773');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('450330','平乐县','0773');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('450332','恭城瑶族自治县','0773');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('450381','荔浦市','0773');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('450400','梧州市','0774');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('450403','万秀区','0774');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('450405','长洲区','0774');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('450406','龙圩区','0774');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('450421','苍梧县','0774');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('450422','藤县','0774');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('450423','蒙山县','0774');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('450481','岑溪市','0774');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('450500','北海市','0779');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('450502','海城区','0779');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('450503','银海区','0779');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('450512','铁山港区','0779');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('450521','合浦县','0779');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('450600','防城港市','0770');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('450602','港口区','0770');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('450603','防城区','0770');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('450621','上思县','0770');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('450681','东兴市','0770');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('450700','钦州市','0777');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('450702','钦南区','0777');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('450703','钦北区','0777');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('450721','灵山县','0777');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('450722','浦北县','0777');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('450800','贵港市','1755');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('450802','港北区','1755');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('450803','港南区','1755');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('450804','覃塘区','1755');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('450821','平南县','1755');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('450881','桂平市','1755');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('450900','玉林市','0775');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('450902','玉州区','0775');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('450903','福绵区','0775');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('450921','容县','0775');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('450922','陆川县','0775');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('450923','博白县','0775');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('450924','兴业县','0775');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('450981','北流市','0775');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('451000','百色市','0776');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('451002','右江区','0776');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('451003','田阳区','0776');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('451022','田东县','0776');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('451024','德保县','0776');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('451026','那坡县','0776');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('451027','凌云县','0776');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('451028','乐业县','0776');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('451029','田林县','0776');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('451030','西林县','0776');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('451031','隆林各族自治县','0776');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('451081','靖西市','0776');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('451082','平果市','0776');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('451100','贺州市','1774');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('451102','八步区','1774');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('451103','平桂区','1774');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('451121','昭平县','1774');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('451122','钟山县','1774');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('451123','富川瑶族自治县','1774');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('451200','河池市','0778');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('451202','金城江区','0778');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('451203','宜州区','0778');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('451221','南丹县','0778');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('451222','天峨县','0778');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('451223','凤山县','0778');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('451224','东兰县','0778');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('451225','罗城仫佬族自治县','0778');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('451226','环江毛南族自治县','0778');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('451227','巴马瑶族自治县','0778');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('451228','都安瑶族自治县','0778');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('451229','大化瑶族自治县','0778');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('451300','来宾市','1772');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('451302','兴宾区','1772');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('451321','忻城县','1772');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('451322','象州县','1772');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('451323','武宣县','1772');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('451324','金秀瑶族自治县','1772');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('451381','合山市','1772');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('451400','崇左市','1771');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('451402','江州区','1771');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('451421','扶绥县','1771');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('451422','宁明县','1771');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('451423','龙州县','1771');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('451424','大新县','1771');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('451425','天等县','1771');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('451481','凭祥市','1771');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('460000','海南省',NULL);
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('460100','海口市','0898');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('460105','秀英区','0898');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('460106','龙华区','0898');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('460107','琼山区','0898');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('460108','美兰区','0898');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('460200','三亚市','0899');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('460202','海棠区','0899');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('460203','吉阳区','0899');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('460204','天涯区','0899');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('460205','崖州区','0899');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('460300','三沙市','2898');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('460301','西沙区','2898');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('460302','南沙区','2898');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('460400','儋州市','0805');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('469001','五指山市','1897');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('469002','琼海市','1894');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('469005','文昌市','1893');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('469006','万宁市','1898');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('469007','东方市','0807');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('469021','定安县','0806');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('469022','屯昌县','1892');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('469023','澄迈县','0804');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('469024','临高县','1896');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('469025','白沙黎族自治县','0802');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('469026','昌江黎族自治县','0803');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('469027','乐东黎族自治县','2802');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('469028','陵水黎族自治县','0809');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('469029','保亭黎族苗族自治县','0801');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('469030','琼中黎族苗族自治县','1899');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('500000','重庆市','023');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('500101','万州区','023');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('500102','涪陵区','023');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('500103','渝中区','023');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('500104','大渡口区','023');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('500105','江北区','023');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('500106','沙坪坝区','023');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('500107','九龙坡区','023');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('500108','南岸区','023');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('500109','北碚区','023');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('500110','綦江区','023');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('500111','大足区','023');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('500112','渝北区','023');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('500113','巴南区','023');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('500114','黔江区','023');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('500115','长寿区','023');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('500116','江津区','023');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('500117','合川区','023');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('500118','永川区','023');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('500119','南川区','023');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('500120','璧山区','023');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('500151','铜梁区','023');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('500152','潼南区','023');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('500153','荣昌区','023');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('500154','开州区','023');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('500155','梁平区','023');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('500156','武隆区','023');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('500229','城口县','023');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('500230','丰都县','023');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('500231','垫江县','023');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('500233','忠县','023');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('500235','云阳县','023');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('500236','奉节县','023');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('500237','巫山县','023');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('500238','巫溪县','023');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('500240','石柱土家族自治县','023');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('500241','秀山土家族苗族自治县','023');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('500242','酉阳土家族苗族自治县','023');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('500243','彭水苗族土家族自治县','023');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('510000','四川省',NULL);
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('510100','成都市','028');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('510104','锦江区','028');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('510105','青羊区','028');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('510106','金牛区','028');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('510107','武侯区','028');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('510108','成华区','028');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('510112','龙泉驿区','028');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('510113','青白江区','028');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('510114','新都区','028');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('510115','温江区','028');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('510116','双流区','028');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('510117','郫都区','028');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('510118','新津区','028');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('510121','金堂县','028');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('510129','大邑县','028');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('510131','蒲江县','028');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('510181','都江堰市','028');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('510182','彭州市','028');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('510183','邛崃市','028');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('510184','崇州市','028');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('510185','简阳市','028');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('510300','自贡市','0813');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('510302','自流井区','0813');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('510303','贡井区','0813');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('510304','大安区','0813');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('510311','沿滩区','0813');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('510321','荣县','0813');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('510322','富顺县','0813');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('510400','攀枝花市','0812');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('510402','东区','0812');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('510403','西区','0812');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('510411','仁和区','0812');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('510421','米易县','0812');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('510422','盐边县','0812');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('510500','泸州市','0830');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('510502','江阳区','0830');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('510503','纳溪区','0830');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('510504','龙马潭区','0830');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('510521','泸县','0830');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('510522','合江县','0830');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('510524','叙永县','0830');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('510525','古蔺县','0830');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('510600','德阳市','0838');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('510603','旌阳区','0838');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('510604','罗江区','0838');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('510623','中江县','0838');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('510681','广汉市','0838');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('510682','什邡市','0838');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('510683','绵竹市','0838');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('510700','绵阳市','0816');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('510703','涪城区','0816');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('510704','游仙区','0816');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('510705','安州区','0816');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('510722','三台县','0816');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('510723','盐亭县','0816');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('510725','梓潼县','0816');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('510726','北川羌族自治县','0816');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('510727','平武县','0816');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('510781','江油市','0816');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('510800','广元市','0839');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('510802','利州区','0839');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('510811','昭化区','0839');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('510812','朝天区','0839');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('510821','旺苍县','0839');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('510822','青川县','0839');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('510823','剑阁县','0839');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('510824','苍溪县','0839');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('510900','遂宁市','0825');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('510903','船山区','0825');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('510904','安居区','0825');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('510921','蓬溪县','0825');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('510923','大英县','0825');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('510981','射洪市','0825');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('511000','内江市','1832');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('511002','市中区','1832');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('511011','东兴区','1832');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('511024','威远县','1832');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('511025','资中县','1832');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('511083','隆昌市','1832');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('511100','乐山市','0833');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('511102','市中区','0833');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('511111','沙湾区','0833');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('511112','五通桥区','0833');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('511113','金口河区','0833');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('511123','犍为县','0833');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('511124','井研县','0833');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('511126','夹江县','0833');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('511129','沐川县','0833');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('511132','峨边彝族自治县','0833');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('511133','马边彝族自治县','0833');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('511181','峨眉山市','0833');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('511300','南充市','0817');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('511302','顺庆区','0817');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('511303','高坪区','0817');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('511304','嘉陵区','0817');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('511321','南部县','0817');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('511322','营山县','0817');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('511323','蓬安县','0817');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('511324','仪陇县','0817');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('511325','西充县','0817');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('511381','阆中市','0817');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('511400','眉山市','1833');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('511402','东坡区','1833');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('511403','彭山区','1833');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('511421','仁寿县','1833');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('511423','洪雅县','1833');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('511424','丹棱县','1833');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('511425','青神县','1833');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('511500','宜宾市','0831');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('511502','翠屏区','0831');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('511503','南溪区','0831');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('511504','叙州区','0831');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('511523','江安县','0831');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('511524','长宁县','0831');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('511525','高县','0831');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('511526','珙县','0831');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('511527','筠连县','0831');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('511528','兴文县','0831');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('511529','屏山县','0831');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('511600','广安市','0826');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('511602','广安区','0826');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('511603','前锋区','0826');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('511621','岳池县','0826');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('511622','武胜县','0826');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('511623','邻水县','0826');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('511681','华蓥市','0826');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('511700','达州市','0818');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('511702','通川区','0818');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('511703','达川区','0818');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('511722','宣汉县','0818');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('511723','开江县','0818');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('511724','大竹县','0818');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('511725','渠县','0818');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('511781','万源市','0818');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('511800','雅安市','0835');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('511802','雨城区','0835');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('511803','名山区','0835');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('511822','荥经县','0835');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('511823','汉源县','0835');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('511824','石棉县','0835');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('511825','天全县','0835');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('511826','芦山县','0835');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('511827','宝兴县','0835');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('511900','巴中市','0827');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('511902','巴州区','0827');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('511903','恩阳区','0827');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('511921','通江县','0827');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('511922','南江县','0827');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('511923','平昌县','0827');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('512000','资阳市','0832');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('512002','雁江区','0832');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('512021','安岳县','0832');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('512022','乐至县','0832');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('513200','阿坝藏族羌族自治州','0837');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('513201','马尔康市','0837');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('513221','汶川县','0837');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('513222','理县','0837');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('513223','茂县','0837');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('513224','松潘县','0837');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('513225','九寨沟县','0837');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('513226','金川县','0837');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('513227','小金县','0837');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('513228','黑水县','0837');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('513230','壤塘县','0837');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('513231','阿坝县','0837');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('513232','若尔盖县','0837');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('513233','红原县','0837');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('513300','甘孜藏族自治州','0836');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('513301','康定市','0836');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('513322','泸定县','0836');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('513323','丹巴县','0836');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('513324','九龙县','0836');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('513325','雅江县','0836');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('513326','道孚县','0836');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('513327','炉霍县','0836');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('513328','甘孜县','0836');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('513329','新龙县','0836');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('513330','德格县','0836');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('513331','白玉县','0836');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('513332','石渠县','0836');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('513333','色达县','0836');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('513334','理塘县','0836');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('513335','巴塘县','0836');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('513336','乡城县','0836');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('513337','稻城县','0836');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('513338','得荣县','0836');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('513400','凉山彝族自治州','0834');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('513401','西昌市','0834');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('513402','会理市','0834');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('513422','木里藏族自治县','0834');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('513423','盐源县','0834');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('513424','德昌县','0834');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('513426','会东县','0834');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('513427','宁南县','0834');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('513428','普格县','0834');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('513429','布拖县','0834');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('513430','金阳县','0834');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('513431','昭觉县','0834');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('513432','喜德县','0834');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('513433','冕宁县','0834');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('513434','越西县','0834');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('513435','甘洛县','0834');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('513436','美姑县','0834');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('513437','雷波县','0834');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('520000','贵州省',NULL);
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('520100','贵阳市','0851');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('520102','南明区','0851');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('520103','云岩区','0851');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('520111','花溪区','0851');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('520112','乌当区','0851');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('520113','白云区','0851');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('520115','观山湖区','0851');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('520121','开阳县','0851');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('520122','息烽县','0851');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('520123','修文县','0851');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('520181','清镇市','0851');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('520200','六盘水市','0858');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('520201','钟山区','0858');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('520203','六枝特区','0858');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('520204','水城区','0858');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('520281','盘州市','0858');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('520300','遵义市','0852');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('520302','红花岗区','0852');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('520303','汇川区','0852');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('520304','播州区','0852');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('520322','桐梓县','0852');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('520323','绥阳县','0852');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('520324','正安县','0852');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('520325','道真仡佬族苗族自治县','0852');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('520326','务川仡佬族苗族自治县','0852');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('520327','凤冈县','0852');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('520328','湄潭县','0852');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('520329','余庆县','0852');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('520330','习水县','0852');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('520381','赤水市','0852');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('520382','仁怀市','0852');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('520400','安顺市','0853');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('520402','西秀区','0853');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('520403','平坝区','0853');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('520422','普定县','0853');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('520423','镇宁布依族苗族自治县','0853');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('520424','关岭布依族苗族自治县','0853');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('520425','紫云苗族布依族自治县','0853');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('520500','毕节市','0857');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('520502','七星关区','0857');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('520521','大方县','0857');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('520523','金沙县','0857');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('520524','织金县','0857');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('520525','纳雍县','0857');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('520526','威宁彝族回族苗族自治县','0857');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('520527','赫章县','0857');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('520581','黔西市','0857');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('520600','铜仁市','0856');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('520602','碧江区','0856');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('520603','万山区','0856');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('520621','江口县','0856');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('520622','玉屏侗族自治县','0856');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('520623','石阡县','0856');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('520624','思南县','0856');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('520625','印江土家族苗族自治县','0856');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('520626','德江县','0856');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('520627','沿河土家族自治县','0856');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('520628','松桃苗族自治县','0856');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('522300','黔西南布依族苗族自治州','0859');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('522301','兴义市','0859');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('522302','兴仁市','0859');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('522323','普安县','0859');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('522324','晴隆县','0859');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('522325','贞丰县','0859');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('522326','望谟县','0859');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('522327','册亨县','0859');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('522328','安龙县','0859');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('522600','黔东南苗族侗族自治州','0855');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('522601','凯里市','0855');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('522622','黄平县','0855');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('522623','施秉县','0855');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('522624','三穗县','0855');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('522625','镇远县','0855');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('522626','岑巩县','0855');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('522627','天柱县','0855');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('522628','锦屏县','0855');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('522629','剑河县','0855');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('522630','台江县','0855');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('522631','黎平县','0855');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('522632','榕江县','0855');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('522633','从江县','0855');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('522634','雷山县','0855');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('522635','麻江县','0855');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('522636','丹寨县','0855');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('522700','黔南布依族苗族自治州','0854');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('522701','都匀市','0854');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('522702','福泉市','0854');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('522722','荔波县','0854');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('522723','贵定县','0854');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('522725','瓮安县','0854');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('522726','独山县','0854');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('522727','平塘县','0854');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('522728','罗甸县','0854');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('522729','长顺县','0854');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('522730','龙里县','0854');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('522731','惠水县','0854');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('522732','三都水族自治县','0854');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('530000','云南省',NULL);
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('530100','昆明市','0871');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('530102','五华区','0871');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('530103','盘龙区','0871');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('530111','官渡区','0871');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('530112','西山区','0871');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('530113','东川区','0871');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('530114','呈贡区','0871');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('530115','晋宁区','0871');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('530124','富民县','0871');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('530125','宜良县','0871');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('530126','石林彝族自治县','0871');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('530127','嵩明县','0871');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('530128','禄劝彝族苗族自治县','0871');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('530129','寻甸回族彝族自治县','0871');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('530181','安宁市','0871');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('530300','曲靖市','0874');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('530302','麒麟区','0874');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('530303','沾益区','0874');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('530304','马龙区','0874');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('530322','陆良县','0874');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('530323','师宗县','0874');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('530324','罗平县','0874');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('530325','富源县','0874');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('530326','会泽县','0874');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('530381','宣威市','0874');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('530400','玉溪市','0877');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('530402','红塔区','0877');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('530403','江川区','0877');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('530423','通海县','0877');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('530424','华宁县','0877');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('530425','易门县','0877');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('530426','峨山彝族自治县','0877');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('530427','新平彝族傣族自治县','0877');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('530428','元江哈尼族彝族傣族自治县','0877');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('530481','澄江市','0877');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('530500','保山市','0875');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('530502','隆阳区','0875');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('530521','施甸县','0875');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('530523','龙陵县','0875');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('530524','昌宁县','0875');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('530581','腾冲市','0875');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('530600','昭通市','0870');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('530602','昭阳区','0870');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('530621','鲁甸县','0870');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('530622','巧家县','0870');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('530623','盐津县','0870');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('530624','大关县','0870');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('530625','永善县','0870');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('530626','绥江县','0870');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('530627','镇雄县','0870');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('530628','彝良县','0870');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('530629','威信县','0870');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('530681','水富市','0870');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('530700','丽江市','0888');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('530702','古城区','0888');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('530721','玉龙纳西族自治县','0888');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('530722','永胜县','0888');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('530723','华坪县','0888');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('530724','宁蒗彝族自治县','0888');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('530800','普洱市','0879');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('530802','思茅区','0879');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('530821','宁洱哈尼族彝族自治县','0879');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('530822','墨江哈尼族自治县','0879');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('530823','景东彝族自治县','0879');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('530824','景谷傣族彝族自治县','0879');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('530825','镇沅彝族哈尼族拉祜族自治县','0879');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('530826','江城哈尼族彝族自治县','0879');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('530827','孟连傣族拉祜族佤族自治县','0879');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('530828','澜沧拉祜族自治县','0879');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('530829','西盟佤族自治县','0879');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('530900','临沧市','0883');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('530902','临翔区','0883');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('530921','凤庆县','0883');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('530922','云县','0883');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('530923','永德县','0883');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('530924','镇康县','0883');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('530925','双江拉祜族佤族布朗族傣族自治县','0883');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('530926','耿马傣族佤族自治县','0883');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('530927','沧源佤族自治县','0883');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('532300','楚雄彝族自治州','0878');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('532301','楚雄市','0878');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('532302','禄丰市','0878');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('532322','双柏县','0878');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('532323','牟定县','0878');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('532324','南华县','0878');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('532325','姚安县','0878');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('532326','大姚县','0878');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('532327','永仁县','0878');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('532328','元谋县','0878');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('532329','武定县','0878');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('532500','红河哈尼族彝族自治州','0873');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('532501','个旧市','0873');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('532502','开远市','0873');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('532503','蒙自市','0873');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('532504','弥勒市','0873');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('532523','屏边苗族自治县','0873');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('532524','建水县','0873');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('532525','石屏县','0873');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('532527','泸西县','0873');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('532528','元阳县','0873');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('532529','红河县','0873');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('532530','金平苗族瑶族傣族自治县','0873');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('532531','绿春县','0873');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('532532','河口瑶族自治县','0873');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('532600','文山壮族苗族自治州','0876');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('532601','文山市','0876');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('532622','砚山县','0876');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('532623','西畴县','0876');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('532624','麻栗坡县','0876');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('532625','马关县','0876');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('532626','丘北县','0876');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('532627','广南县','0876');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('532628','富宁县','0876');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('532800','西双版纳傣族自治州','0691');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('532801','景洪市','0691');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('532822','勐海县','0691');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('532823','勐腊县','0691');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('532900','大理白族自治州','0872');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('532901','大理市','0872');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('532922','漾濞彝族自治县','0872');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('532923','祥云县','0872');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('532924','宾川县','0872');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('532925','弥渡县','0872');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('532926','南涧彝族自治县','0872');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('532927','巍山彝族回族自治县','0872');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('532928','永平县','0872');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('532929','云龙县','0872');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('532930','洱源县','0872');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('532931','剑川县','0872');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('532932','鹤庆县','0872');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('533100','德宏傣族景颇族自治州','0692');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('533102','瑞丽市','0692');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('533103','芒市','0692');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('533122','梁河县','0692');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('533123','盈江县','0692');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('533124','陇川县','0692');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('533300','怒江傈僳族自治州','0886');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('533301','泸水市','0886');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('533323','福贡县','0886');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('533324','贡山独龙族怒族自治县','0886');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('533325','兰坪白族普米族自治县','0886');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('533400','迪庆藏族自治州','0887');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('533401','香格里拉市','0887');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('533422','德钦县','0887');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('533423','维西傈僳族自治县','0887');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('540000','西藏自治区',NULL);
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('540100','拉萨市','0891');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('540102','城关区','0891');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('540103','堆龙德庆区','0891');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('540104','达孜区','0891');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('540121','林周县','0891');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('540122','当雄县','0891');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('540123','尼木县','0891');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('540124','曲水县','0891');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('540127','墨竹工卡县','0891');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('540200','日喀则市','0892');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('540202','桑珠孜区','0892');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('540221','南木林县','0892');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('540222','江孜县','0892');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('540223','定日县','0892');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('540224','萨迦县','0892');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('540225','拉孜县','0892');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('540226','昂仁县','0892');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('540227','谢通门县','0892');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('540228','白朗县','0892');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('540229','仁布县','0892');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('540230','康马县','0892');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('540231','定结县','0892');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('540232','仲巴县','0892');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('540233','亚东县','0892');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('540234','吉隆县','0892');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('540235','聂拉木县','0892');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('540236','萨嘎县','0892');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('540237','岗巴县','0892');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('540300','昌都市','0895');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('540302','卡若区','0895');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('540321','江达县','0895');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('540322','贡觉县','0895');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('540323','类乌齐县','0895');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('540324','丁青县','0895');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('540325','察雅县','0895');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('540326','八宿县','0895');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('540327','左贡县','0895');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('540328','芒康县','0895');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('540329','洛隆县','0895');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('540330','边坝县','0895');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('540400','林芝市','0894');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('540402','巴宜区','0894');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('540421','工布江达县','0894');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('540422','米林县','0894');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('610117','高陵区','029');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('610118','鄠邑区','029');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('610122','蓝田县','029');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('610124','周至县','029');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('610200','铜川市','0919');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('610202','王益区','0919');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('610203','印台区','0919');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('610204','耀州区','0919');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('610222','宜君县','0919');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('610300','宝鸡市','0917');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('610302','渭滨区','0917');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('610303','金台区','0917');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('610304','陈仓区','0917');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('610305','凤翔区','0917');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('610323','岐山县','0917');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('610324','扶风县','0917');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('610326','眉县','0917');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('610327','陇县','0917');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('610328','千阳县','0917');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('610329','麟游县','0917');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('610330','凤县','0917');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('610331','太白县','0917');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('610400','咸阳市','0910');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('610402','秦都区','0910');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('610403','杨陵区','0910');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('610404','渭城区','0910');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('610422','三原县','0910');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('610423','泾阳县','0910');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('610424','乾县','0910');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('610425','礼泉县','0910');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('610426','永寿县','0910');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('610428','长武县','0910');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('610429','旬邑县','0910');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('610430','淳化县','0910');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('610431','武功县','0910');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('610481','兴平市','0910');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('610482','彬州市','0910');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('610500','渭南市','0913');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('610502','临渭区','0913');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('610503','华州区','0913');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('610522','潼关县','0913');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('610523','大荔县','0913');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('610524','合阳县','0913');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('610525','澄城县','0913');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('610526','蒲城县','0913');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('610527','白水县','0913');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('610528','富平县','0913');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('610581','韩城市','0913');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('610582','华阴市','0913');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('610600','延安市','0911');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('610602','宝塔区','0911');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('610603','安塞区','0911');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('610621','延长县','0911');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('610622','延川县','0911');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('610625','志丹县','0911');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('610626','吴起县','0911');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('610627','甘泉县','0911');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('610628','富县','0911');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('610629','洛川县','0911');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('610630','宜川县','0911');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('610631','黄龙县','0911');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('610632','黄陵县','0911');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('610681','子长市','0911');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('610700','汉中市','0916');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('610702','汉台区','0916');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('610703','南郑区','0916');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('610722','城固县','0916');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('610723','洋县','0916');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('610724','西乡县','0916');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('610725','勉县','0916');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('610726','宁强县','0916');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('610727','略阳县','0916');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('610728','镇巴县','0916');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('610729','留坝县','0916');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('610730','佛坪县','0916');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('610800','榆林市','0912');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('610802','榆阳区','0912');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('610803','横山区','0912');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('610822','府谷县','0912');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('610824','靖边县','0912');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('610825','定边县','0912');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('610826','绥德县','0912');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('610827','米脂县','0912');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('610828','佳县','0912');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('610829','吴堡县','0912');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('610830','清涧县','0912');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('610831','子洲县','0912');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('610881','神木市','0912');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('610900','安康市','0915');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('610902','汉滨区','0915');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('610921','汉阴县','0915');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('610922','石泉县','0915');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('610923','宁陕县','0915');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('610924','紫阳县','0915');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('610925','岚皋县','0915');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('610926','平利县','0915');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('610927','镇坪县','0915');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('610929','白河县','0915');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('610981','旬阳市','0915');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('611000','商洛市','0914');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('611002','商州区','0914');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('611021','洛南县','0914');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('611022','丹凤县','0914');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('611023','商南县','0914');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('611024','山阳县','0914');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('611025','镇安县','0914');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('611026','柞水县','0914');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('620000','甘肃省',NULL);
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('620100','兰州市','0931');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('620102','城关区','0931');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('620103','七里河区','0931');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('620104','西固区','0931');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('620105','安宁区','0931');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('620111','红古区','0931');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('620121','永登县','0931');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('620122','皋兰县','0931');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('620123','榆中县','0931');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('620200','嘉峪关市','1937');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('620300','金昌市','0935');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('620302','金川区','0935');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('620321','永昌县','0935');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('620400','白银市','0943');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('620402','白银区','0943');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('620403','平川区','0943');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('620421','靖远县','0943');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('620422','会宁县','0943');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('620423','景泰县','0943');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('620500','天水市','0938');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('620502','秦州区','0938');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('620503','麦积区','0938');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('620521','清水县','0938');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('620522','秦安县','0938');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('620523','甘谷县','0938');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('620524','武山县','0938');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('620525','张家川回族自治县','0938');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('620600','武威市','1935');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('620602','凉州区','1935');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('620621','民勤县','1935');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('620622','古浪县','1935');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('620623','天祝藏族自治县','1935');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('620700','张掖市','0936');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('620702','甘州区','0936');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('620721','肃南裕固族自治县','0936');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('620722','民乐县','0936');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('620723','临泽县','0936');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('620724','高台县','0936');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('620725','山丹县','0936');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('620800','平凉市','0933');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('620802','崆峒区','0933');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('620821','泾川县','0933');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('620822','灵台县','0933');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('620823','崇信县','0933');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('620825','庄浪县','0933');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('620826','静宁县','0933');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('620881','华亭市','0933');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('620900','酒泉市','0937');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('620902','肃州区','0937');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('620921','金塔县','0937');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('620922','瓜州县','0937');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('620923','肃北蒙古族自治县','0937');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('620924','阿克塞哈萨克族自治县','0937');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('620981','玉门市','0937');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('620982','敦煌市','0937');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('621000','庆阳市','0934');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('621002','西峰区','0934');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('621021','庆城县','0934');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('621022','环县','0934');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('621023','华池县','0934');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('621024','合水县','0934');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('621025','正宁县','0934');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('621026','宁县','0934');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('621027','镇原县','0934');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('621100','定西市','0932');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('621102','安定区','0932');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('621121','通渭县','0932');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('621122','陇西县','0932');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('621123','渭源县','0932');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('621124','临洮县','0932');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('621125','漳县','0932');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('621126','岷县','0932');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('621200','陇南市','2935');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('621202','武都区','2935');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('621221','成县','2935');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('621222','文县','2935');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('621223','宕昌县','2935');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('621224','康县','2935');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('621225','西和县','2935');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('621226','礼县','2935');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('621227','徽县','2935');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('621228','两当县','2935');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('622900','临夏回族自治州','0930');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('622901','临夏市','0930');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('622921','临夏县','0930');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('622922','康乐县','0930');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('622923','永靖县','0930');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('622924','广河县','0930');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('622925','和政县','0930');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('622926','东乡族自治县','0930');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('622927','积石山保安族东乡族撒拉族自治县','0930');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('623000','甘南藏族自治州','0941');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('623001','合作市','0941');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('623021','临潭县','0941');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('623022','卓尼县','0941');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('623023','舟曲县','0941');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('623024','迭部县','0941');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('623025','玛曲县','0941');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('623026','碌曲县','0941');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('623027','夏河县','0941');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('630000','青海省',NULL);
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('630100','西宁市','0971');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('630102','城东区','0971');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('630103','城中区','0971');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('630104','城西区','0971');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('630105','城北区','0971');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('630106','湟中区','0971');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('630121','大通回族土族自治县','0971');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('630123','湟源县','0971');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('630200','海东市','0972');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('630202','乐都区','0972');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('630203','平安区','0972');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('630222','民和回族土族自治县','0972');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('630223','互助土族自治县','0972');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('630224','化隆回族自治县','0972');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('630225','循化撒拉族自治县','0972');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('632200','海北藏族自治州','0970');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('632221','门源回族自治县','0970');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('632222','祁连县','0970');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('632223','海晏县','0970');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('632224','刚察县','0970');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('632300','黄南藏族自治州','0973');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('632301','同仁市','0973');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('632322','尖扎县','0973');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('632323','泽库县','0973');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('632324','河南蒙古族自治县','0973');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('632500','海南藏族自治州','0974');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('632521','共和县','0974');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('632522','同德县','0974');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('632523','贵德县','0974');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('632524','兴海县','0974');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('632525','贵南县','0974');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('632600','果洛藏族自治州','0975');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('632621','玛沁县','0975');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('632622','班玛县','0975');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('632623','甘德县','0975');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('632624','达日县','0975');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('632625','久治县','0975');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('632626','玛多县','0975');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('632700','玉树藏族自治州','0976');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('632701','玉树市','0976');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('632722','杂多县','0976');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('632723','称多县','0976');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('632724','治多县','0976');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('632725','囊谦县','0976');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('632726','曲麻莱县','0976');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('632800','海西蒙古族藏族自治州','0977');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('632801','格尔木市','0977');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('632802','德令哈市','0977');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('632803','茫崖市','0977');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('632821','乌兰县','0977');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('632822','都兰县','0977');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('632823','天峻县','0977');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('632825','海西蒙古族藏族自治州直辖','0977');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('640000','宁夏回族自治区',NULL);
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('640100','银川市','0951');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('640104','兴庆区','0951');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('640105','西夏区','0951');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('640106','金凤区','0951');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('640121','永宁县','0951');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('640122','贺兰县','0951');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('640181','灵武市','0951');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('640200','石嘴山市','0952');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('640202','大武口区','0952');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('640205','惠农区','0952');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('640221','平罗县','0952');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('640300','吴忠市','0953');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('640302','利通区','0953');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('640303','红寺堡区','0953');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('640323','盐池县','0953');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('640324','同心县','0953');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('640381','青铜峡市','0953');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('640400','固原市','0954');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('640402','原州区','0954');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('640422','西吉县','0954');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('640423','隆德县','0954');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('640424','泾源县','0954');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('640425','彭阳县','0954');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('640500','中卫市','1953');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('640502','沙坡头区','1953');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('640521','中宁县','1953');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('640522','海原县','1953');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('650000','新疆维吾尔自治区',NULL);
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('650100','乌鲁木齐市','0991');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('650102','天山区','0991');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('650103','沙依巴克区','0991');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('650104','新市区','0991');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('650105','水磨沟区','0991');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('650106','头屯河区','0991');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('650107','达坂城区','0991');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('650109','米东区','0991');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('650121','乌鲁木齐县','0991');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('650200','克拉玛依市','0990');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('650202','独山子区','0990');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('650203','克拉玛依区','0990');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('650204','白碱滩区','0990');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('650205','乌尔禾区','0990');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('650400','吐鲁番市','0995');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('650402','高昌区','0995');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('650421','鄯善县','0995');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('650422','托克逊县','0995');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('650500','哈密市','0902');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('650502','伊州区','0902');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('650521','巴里坤哈萨克自治县','0902');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('650522','伊吾县','0902');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('652300','昌吉回族自治州','0994');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('652301','昌吉市','0994');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('652302','阜康市','0994');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('652323','呼图壁县','0994');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('652324','玛纳斯县','0994');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('652325','奇台县','0994');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('652327','吉木萨尔县','0994');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('652328','木垒哈萨克自治县','0994');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('652700','博尔塔拉蒙古自治州','0909');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('652701','博乐市','0909');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('652702','阿拉山口市','0909');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('652722','精河县','0909');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('652723','温泉县','0909');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('652800','巴音郭楞蒙古自治州','0996');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('652801','库尔勒市','0996');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('652822','轮台县','0996');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('652823','尉犁县','0996');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('652824','若羌县','0996');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('652825','且末县','0996');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('652826','焉耆回族自治县','0996');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('652827','和静县','0996');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('652828','和硕县','0996');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('652829','博湖县','0996');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('652900','阿克苏地区','0997');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('652901','阿克苏市','0997');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('652902','库车市','0997');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('652922','温宿县','0997');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('652924','沙雅县','0997');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('652925','新和县','0997');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('652926','拜城县','0997');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('652927','乌什县','0997');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('652928','阿瓦提县','0997');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('652929','柯坪县','0997');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('653000','克孜勒苏柯尔克孜自治州','0908');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('653001','阿图什市','0908');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('653022','阿克陶县','0908');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('653023','阿合奇县','0908');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('653024','乌恰县','0908');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('653100','喀什地区','0998');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('653101','喀什市','0998');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('653121','疏附县','0998');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('653122','疏勒县','0998');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('653123','英吉沙县','0998');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('653124','泽普县','0998');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('653125','莎车县','0998');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('653126','叶城县','0998');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('653127','麦盖提县','0998');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('653128','岳普湖县','0998');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('653129','伽师县','0998');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('653130','巴楚县','0998');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('653131','塔什库尔干塔吉克自治县','0998');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('653200','和田地区','0903');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('653201','和田市','0903');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('653221','和田县','0903');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('653222','墨玉县','0903');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('653223','皮山县','0903');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('653224','洛浦县','0903');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('653225','策勒县','0903');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('653226','于田县','0903');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('653227','民丰县','0903');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('654000','伊犁哈萨克自治州','0999');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('654002','伊宁市','0999');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('654003','奎屯市','0999');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('654004','霍尔果斯市','0999');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('654021','伊宁县','0999');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('654022','察布查尔锡伯自治县','0999');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('654023','霍城县','0999');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('654024','巩留县','0999');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('654025','新源县','0999');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('654026','昭苏县','0999');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('654027','特克斯县','0999');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('654028','尼勒克县','0999');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('654200','塔城地区','0901');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('654201','塔城市','0901');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('654202','乌苏市','0901');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('654203','沙湾市','0901');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('654221','额敏县','0901');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('654224','托里县','0901');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('654225','裕民县','0901');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('654226','和布克赛尔蒙古自治县','0901');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('654300','阿勒泰地区','0906');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('654301','阿勒泰市','0906');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('654321','布尔津县','0906');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('654322','富蕴县','0906');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('654323','福海县','0906');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('654324','哈巴河县','0906');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('654325','青河县','0906');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('654326','吉木乃县','0906');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('659001','石河子市','0993');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('659002','阿拉尔市','1997');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('659003','图木舒克市','1998');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('659004','五家渠市','1994');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('659005','北屯市','1906');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('659006','铁门关市','1996');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('659007','双河市','1909');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('659008','可克达拉市','1999');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('659009','昆玉市','1903');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('659010','胡杨河市','0992');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('659011','新星市','2940');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('710000','台湾省','1886');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('810000','香港特别行政区','1852');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('810001','中西区','1852');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('810002','湾仔区','1852');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('810003','东区','1852');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('810004','南区','1852');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('810005','油尖旺区','1852');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('810006','深水埗区','1852');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('810007','九龙城区','1852');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('810008','黄大仙区','1852');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('810009','观塘区','1852');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('810010','荃湾区','1852');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('810011','屯门区','1852');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('810012','元朗区','1852');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('810013','北区','1852');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('810014','大埔区','1852');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('810015','西贡区','1852');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('810016','沙田区','1852');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('810017','葵青区','1852');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('810018','离岛区','1852');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('820000','澳门特别行政区','1853');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('820001','花地玛堂区','1853');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('820002','花王堂区','1853');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('820003','望德堂区','1853');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('820004','大堂区','1853');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('820005','风顺堂区','1853');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('820006','嘉模堂区','1853');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('820007','路凼填海区','1853');
INSERT INTO `wb_map_adcode_citycode` (`adcode`,`city`,`citycode`)  VALUES ('820008','圣方济各堂区','1853');
-- ----------------------------
-- Table structure for table wb_system_config
-- ----------------------------
DROP TABLE IF EXISTS `wb_system_config`;
CREATE TABLE `wb_system_config` (
  `config_id` int(11) NOT NULL AUTO_INCREMENT,
  `config_key` varchar(255) NOT NULL,
  `config_value` varchar(255) NOT NULL,
  `config_desc` text,
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of wb_system_config
-- ----------------------------
INSERT INTO `wb_system_config` (`config_id`,`config_key`,`config_value`,`config_desc`)  VALUES ('1','weather_key','78182b9b39355dc0ae4ce91dae7f0bbf','高德地图天气密钥');
INSERT INTO `wb_system_config` (`config_id`,`config_key`,`config_value`,`config_desc`)  VALUES ('2','github_key','11APYO7PI021pjfuHxWKPA_JBLdpwspK6s67u1P5levoDgdRxkFHhQcG6jX5q1ONRpRNUREZTPzW2kqpI7','github个人访问密钥');
INSERT INTO `wb_system_config` (`config_id`,`config_key`,`config_value`,`config_desc`)  VALUES ('3','management_system_title','Jz博客后台','管理系统后台页面标题');
INSERT INTO `wb_system_config` (`config_id`,`config_key`,`config_value`,`config_desc`)  VALUES ('4','weboke_page_title','Jz 恰沐春风共同游，终只叹，木已舟','博客页面标题');
INSERT INTO `wb_system_config` (`config_id`,`config_key`,`config_value`,`config_desc`)  VALUES ('5','load_animation_gif','/static/img/loadGif/loading5.gif','加载图片');
-- ----------------------------
-- Table structure for table wb_user_online_time
-- ----------------------------
DROP TABLE IF EXISTS `wb_user_online_time`;
CREATE TABLE `wb_user_online_time` (
  `uot_id` int(11) NOT NULL AUTO_INCREMENT,
  `uot_date` datetime NOT NULL COMMENT '日期',
  `uid` int(11) DEFAULT NULL,
  `uot_mon` int(11) DEFAULT '0',
  `uot_tue` int(11) DEFAULT '0',
  `uot_wed` int(11) DEFAULT '0',
  `uot_thu` int(11) DEFAULT '0',
  `uot_fri` int(11) DEFAULT '0',
  `uot_sat` int(11) DEFAULT '0',
  `uot_sun` int(11) DEFAULT '0',
  PRIMARY KEY (`uot_id`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

-- ----------------------------
-- Records of wb_user_online_time
-- ----------------------------
-- ----------------------------
-- Table structure for table wb_users
-- ----------------------------
DROP TABLE IF EXISTS `wb_users`;
CREATE TABLE `wb_users` (
  `uid` int(255) NOT NULL AUTO_INCREMENT,
  `uname` varchar(255) NOT NULL,
  `username` varchar(16) NOT NULL,
  `password` varchar(255) NOT NULL,
  `power` tinyint(1) DEFAULT '1' COMMENT '权限',
  `create_date` datetime NOT NULL COMMENT '注册时间',
  `last_login_date` datetime DEFAULT NULL COMMENT '最近登录时间',
  `head_img` text NOT NULL COMMENT '头像',
  `whether_use` tinyint(1) DEFAULT '0' COMMENT '是否使用',
  `signature` text COMMENT '签名',
  `activation_key` text NOT NULL COMMENT '登录密钥：token',
  `create_ip` varchar(15) DEFAULT NULL COMMENT '注册ip',
  `last_login_ip` varchar(15) DEFAULT NULL COMMENT '最近登录ip',
  PRIMARY KEY (`uid`) USING BTREE,
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of wb_users
-- ----------------------------
INSERT INTO `wb_users` (`uid`,`uname`,`username`,`password`,`power`,`create_date`,`last_login_date`,`head_img`,`whether_use`,`signature`,`activation_key`,`create_ip`,`last_login_ip`)  VALUES ('1','黎智勇','admin','$2a$10$z0Key6vKUiqVIzJWC5sQR..GYO52Oz3UUD4yKLvRmhLLEpU1wKdO.',0,'2024-01-18 18:59:02','2024-09-04 18:05:10','/img/lzy.webp',1,'了解的越多越觉得自己菜，拼命学习不敢装逼，啥都不知道的，天天吹牛逼','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmFtZSI6ImFkbWluIiwidXNlcm5hbWUiOiJhZG1pbiIsImlhdCI6MTcwNTU3NTU0MiwiZXhwIjoxNzA1NTc5MTQyfQ.Wzrps6z-IA326_aWXbUihzabSrcDCskB0rYLqiyk9eo','192.168.3.63',NULL);
INSERT INTO `wb_users` (`uid`,`uname`,`username`,`password`,`power`,`create_date`,`last_login_date`,`head_img`,`whether_use`,`signature`,`activation_key`,`create_ip`,`last_login_ip`)  VALUES ('3','test','test','$2a$10$rh2.mMqEY.R8zG3yMvGynO2QDCDk.NnKRCLD19eWYTs5OUto2pTGy',1,'2024-01-19 22:06:01',NULL,'/img/updateImg/put4.webp',1,'什么都不留吗?','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmFtZSI6InRlc3QiLCJ1c2VybmFtZSI6InRlc3QiLCJpYXQiOjE3MDU2NzMxNjEsImV4cCI6MTcwNTY3Njc2MX0.DE7QSuL8u8oigJ5fxp39gSeZSlOaCYzHh-Mvl6p3m84','::1',NULL);
INSERT INTO `wb_users` (`uid`,`uname`,`username`,`password`,`power`,`create_date`,`last_login_date`,`head_img`,`whether_use`,`signature`,`activation_key`,`create_ip`,`last_login_ip`)  VALUES ('4','lzy','lzy','$2a$10$3bAdOnQeEVjwjSUngKz7A.pDWjfUem4sQUEigrNbm0A9ohyAD.MM.',1,'2024-01-19 22:10:39',NULL,'/img/updateImg/put5.webp',1,'什么都不留吗?','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmFtZSI6Imx6eSIsInVzZXJuYW1lIjoibHp5IiwiaWF0IjoxNzA1NjczNDM5LCJleHAiOjE3MDU2NzcwMzl9.SKLpYb3mdWcA-pUPFbKWIc8sIBaJ5qTRK4g4MpZyJCs','::1',NULL);
INSERT INTO `wb_users` (`uid`,`uname`,`username`,`password`,`power`,`create_date`,`last_login_date`,`head_img`,`whether_use`,`signature`,`activation_key`,`create_ip`,`last_login_ip`)  VALUES ('5','ljy','ljy','$2a$10$6863xvFc3H.qPGS42Pew7upb/RSDKFwo9mz7Yvm4.TmW5bSLNqkQW',1,'2024-01-19 22:12:24',NULL,'/img/updateImg/put6.webp',1,'什么都不留吗?','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmFtZSI6ImxqeSIsInVzZXJuYW1lIjoibGp5IiwiaWF0IjoxNzA1NjczNTQ0LCJleHAiOjE3MDU2NzcxNDR9.ksfBNyygqH6mRspKCTilyE4slK3a_SUfQNNDL9Bvx-4','::1',NULL);
SET FOREIGN_KEY_CHECKS=1;
