## Mac党提升工作效率

### Mac 开发配置手册
- [Mac 开发配置手册](https://www.gitbook.com/book/aaaaaashu/mac-dev-setup/details)

### Mac快捷工具
- **应用切换工具 Snap（免费）**
- **应用切换工具 Manico（付费）**
- **自定义手势工具 BetterTouchTool（付费）**

### Mac 快捷键
- [Mac键盘快捷键官方](https://support.apple.com/zh-cn/HT201236)

### Google 快捷键
- [Google 快捷键](https://support.google.com/chrome/answer/157179?hl=zh-Hans)

### terminal

快捷键                            |        描述
---------------------------------|-----------
**command + d**                     | **垂直分屏**
**command + shift + d**              | **水平分屏**
**command + ;**                       | **查看历史命令**
**command + option + 方向键**          | **切换屏幕**
**command + shift + h**              | **查看剪贴板历史**
**ctrl + u**                         | **清除当前行**
**command + r**                        | **清屏**
**ctrl + l**                         | **清屏**
**ctrl + r**                          | **搜索命令历史**
**ctrl + w**                        | **删除光标之前的单词**
**输入开头命令后 按 ⌘ + ;**            | **自动列出输入过的命令**


### git
#### 链接
- [Git](https://git-scm.com/)
- [Git - Book](https://git-scm.com/book/zh/v2)
- [有关 git 的学习资料](https://github.com/xirong/my-git)
- [廖雪峰git](http://www.liaoxuefeng.com/wiki/0013739516305929606dd18361248578c67b8067c8c017b000)
- [猴子都能懂的git](http://backlogtool.com/git-guide/cn/)

#### 常用git命令：
##### git stash
- git stash 储藏工作区 (暂存区有内容也将被储藏)
- git stash save "注释"
- git stash list 查看现有储藏
- git stash pop 重新应用最近的一次储藏，并移除栈上的储藏
- git stash apply stash@{2} 重新应用某次储藏。
- git stash drop 移除最近的一次储藏
- git stash drop stash@{2} 移除某次储藏
- git stash apply --index  如果你的某次储藏，在工作区有修改，在暂存区也有暂存的内容，你使用git stash apply的时候，暂存区的内容将被恢复到工作区，这不是你想要的，那么你可以使用 git stash apply --index  这样，暂存区的内容还在暂存区，工作区的内容恢复到储藏前状态，这是你这次储藏的最原始的状态。

##### 撤销
- git checkout -- 'file' 撤销文件file的修改，回到file的最近一次commit或add
- git checkout -- . 撤销全部修改，回到最近一次commit或add


##### git merge
- git merge branch_name 快速合并
- git merge --no-ff -m “提交的描述” branch_name 普通合并

##### git reset
- git reset commit_id 版本穿梭（保留此commit_id之后的修改）
- git reset --hard commit_id 版本穿梭(撤销此commit_id之后的修改)(危险)
- git reset HEAD 'file' 撤销'file'的暂存

##### git push
- git push origin branch_name -f 直接覆盖远程branch_name

##### git rebase
- git rebase branch_name
- git rebase --abort 终止rebase，回到操作前
- git rebase -i commit_id 可以看到，reabse -i的作用是用来编辑所有的commit，也就是在push到远程分支之前，我们可以“为所欲为”，可以看到有多个命令可以使用。

							p, pick = 使用此commit。(p是pick命令的缩写，两种方式均支持)
							r, reword = 使用此commit， 编辑commit messagee,
							e, edit = 使用此commit，并且把commit信息放在第一个，使用commit --amend来修改commit信息
							s, squash = 使用此commit，但是合并到前一个commit中去,
							f, fixup = 和squash类似，但是放弃此commit的message


- 接着会进入vi编辑模式，按需要在commit_id前修改命令（主要：pick或（p）的意思是要会执行这个commit；squash或（s）的意思是这个 commit 会被合并到前一个commit）
- :wq 退出vi编辑模式后会看到commit message 的编辑界面。 非注释部分就是合并的commit message, 我们要做的就是将这些commit message修改成新的 commit message。
- :wq 保存并退出后 git log 查看commit历史。
- 注意事项：如果这个过程中有操作错误，可以使用 git rebase --abort来撤销修改，回到没有开始操作合并之前的状态。

##### git log
- glog
- git log --stat 查看每次提交的统计
- git log -p 查看每次提交的差异
- git log -p -'n' 查看最近n次提交的差异
- git log --pretty=oneline 单行显示历史提交

##### git commit
- git commit --amend 重新提交(常用于修改描述)

##### git remote
- git remote show '远程仓库名(默认是origin)'  这个命令列出了当你在特定的分支上执行 git push 会自动地推送到哪一个远程分支。 它也同样地列出了哪些远程分支不在你的本地，哪些远程分支已经从服务器上移除了，还有当你执行 git pull 时哪些分支会自动合并。   

##### git tag
- git tag 'tagname' 在当前分支最新的commit上打普通标签
- git tag -a 'tagname' -m '描述'  在当前分支最新的commit上打附注标签
- git tag 'tagname' 'commitid' 指定commitid打普通标签
- git tag -a 'tagname' -m '描述' 'commitid' 指定commitid打附注标签
- git tag 查看当前所有标签
- git show 'tagname' 查看标签信息
- git push origin 'tagname' 推送单个标签到远程仓库
- git push origin --tags 推送所有不在远程仓库的标签到远程仓库
- git tag -d <tagname> 删除tag
- git push origin --delete tag <tagname> 删除远程tag

#### vim
- o 行首
- $ 行末
- H 视窗第一列
- M 视窗中间列
- L 视窗最后一列
- G 文档最后一列
- Ctrl+f 下一页
- Ctrl+b 上一页
- A 改行末尾添加资料
- o 改行之下新加一行
- { 段落之首
- } 段落之末
- ndd 删除n行
- u 恢复最后一条指令前的结果

##### other
- lipo -info libjpush-ios-2.1.9.a  (libjpush-ios-2.1.9.a 极光的静态库)查看某个静态库支持的指令集。（要进入到静态库所在的目录，再使用该命令）
- du sh *  （执行pod setup 时，想查看进度，就进入 .cocoapods 目录中，执行该命令）
- security cms -D -i embedded.mobileprovision (查看描述文件mobileprovision信息)
- eval $(ssh-agent) 运行 ssh-agent
- ssh-add ~/.ssh/xxx  添加私钥


### 其它
#### Mac下文件的隐藏和显示
- 显示：defaults write com.apple.finder AppleShowAllFiles -bool true
- 隐藏：defaults write com.apple.finder AppleShowAllFiles -bool false
- 隐藏：defaults write com.apple.finder AppleShowAllFiles false;killall Finder
- 显示：defaults write com.apple.finder AppleShowAllFiles true;killall Finder

#### 链接
- [Safari 9 (El Capitan): Safari 键盘及其他快捷键](https://support.apple.com/kb/PH21483?locale=zh_CN&viewlocale=zh_CN)
- [Safari 8 (Yosemite) 的快捷键](https://support.apple.com/kb/PH19282?locale=zh_CN&viewlocale=zh_CN)
- [Mac 启动时可以使用的快捷键](https://support.apple.com/zh-cn/HT201255)
- [Mac 键盘的辅助功能快捷键](https://support.apple.com/zh-cn/HT204434)
- [OS X El Capitan: 为应用创建键盘快捷键](https://support.apple.com/kb/PH21534?locale=zh_CN&viewlocale=zh_CN)
- [OS X El Capitan: 如果键盘快捷键不能正常工作](https://support.apple.com/kb/PH21540?locale=zh_CN&viewlocale=zh_CN)
- [如何更改 Mac 上的功能键行为](https://support.apple.com/zh-cn/HT204436)
- [如何在 Mac 上键入重音符号、表情符号和符号](https://support.apple.com/zh-cn/HT201586)
- [OS X：键入替代字符以及重复空格或已键入的符号](https://support.apple.com/zh-cn/HT202317)
- [OS X Yosemite：使用听写命令来告诉 Mac 做什么](https://support.apple.com/zh-cn/HT203085)
- [OS X Yosemite: 更改修饰键](https://support.apple.com/kb/PH18422?locale=zh_CN&viewlocale=zh_CN)
