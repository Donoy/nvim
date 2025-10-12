# What this ?

1) Used to save nvim configs for myself, and will update sometimes. 
2) It dependence nvchad repo (NvChad/NvChad) on github and it let me generate nvim config easier.
3) And some plugins config copy from another repo (josean-dev/dev-environment-files) on github.
4) new copied from jonhoo(https://github.com/jonhoo/configs/blob/master/editor/.config/nvim/init.lual) at 2025/10/12-00:04
5) before use fzf(ctrl+p in nvim) need to install (on macos):
   brew install fzf
   cargo install proximity-sort
   brew install fd

## 快捷键记录
### 移动光标
- s + 模糊 + 提示键  (leap插件) --- 搜索加快速跳转
- h --- 左
- j  --- 下
- k --- 上
- l  --- 右
- ctrl + f  --- 下翻一页 (forward)
- ctrl + b --- 上翻一页 (before)
- ctrl + u --- 上翻半页 (up)
- ctrl + d --- 下翻半页 (down)
- w  --- 跳到下一个字首，按标点或单词分割
- W --- 跳到下一个字首，长跳
- e  --- 跳到下一个字尾，按标点或单词分割
- E  --- 跳到下一个字尾，长跳
- b  --- 跳到上一个字首，按标点或单词分割
- B  --- 跳到上一个字首，长跳
- 0  --- 跳到行首，不管有无缩紧
- ^  --- 跳到行首的第一个字符
- $  --- 跳到行尾
- gg --- 跳到文首
- G   --- 跳到文尾
- 5gg/5G --- 跳到第5行
- fx --- 在当前行查找x字符，找到了就跳转
- ;   --- 重复上一个f命令，不用重复输入fx
- \*  ---  查找光标所在处的单词，向下查找
- \#  --- 查找光标所在处的单词，向上查找

### 删除复制
- dd   --- 删除光标所在行
- dw  --- 删除一个字 (word)
- x     --- 删除当前字符
- X     --- 删除前一个字符
- yy   --- 复制光标所在一行
- yw  --- 复制一个字
- p    --- 粘贴到当前光标后面，一整行粘贴到光标所在行下面
- P    --- 粘贴到当前光标前面，一整行粘贴到光标所在行上面

### 插入模式
- i   --- 进入插入模式，光标位于当前之前
- I   --- 进入插入模式，光标位于行首
- a  --- 追加模式，光标位于当前之后
- A  --- 追加模式，光标位于行末
- o  --- 在当前行之下新加一行，并进入插入模式
- O  --- 在当前行之上新加一行，并进入插入模式
- Esc  --- 退出插入模式
- 设置keymap，ctrl + j, ctrl+k --- 退出插入模式

### 编辑
- J      ---  将下一行和当前行连为一行
- cc    --- 删除当前行并进入编辑模式
- cw   --- 删除当前字，并进入编辑模式
- c$    --- 删除从当前位置到行末多内容，并进入编辑模式
- ~~s      --- 删除当前字符并进入编辑模式~~（与leap插件冲突，无法使用）
- ~~ss    --- 删除光标所在行并进入编辑模式~~（与leap插件冲突，无法使用）
- xp    --- 交换当前字符和下一个字符
- u      --- 撤销
- ctrl + r   --- 重做
- ~      --- 切换大小写，当前字符
- \>\>    --- 将当前行向右移动一个tab
- \<\<    --- 将当前行向左移动一个tab
- ==    --- 自动缩进当前行

### 查找替换
-  /pattern --- 向后搜索 pattern
- ?pattern --- 向前搜索 pattern
- n             --- 下一个搜索结果
- N            ---  上一个搜索结果
- :%s/old/new/g   --- 搜索整个文件，将所有的old替换为new
- :%s/old/new/gc --- 搜索整个文件，将所有的old替换为new，每次都需要确认是否替换

### 退出编辑器
- :w       --- 将缓冲区写入文件，即保存
- 设置keymap，\<leader>w --- 将缓冲区写入文件，即保存
- :wqa   --- 保存修改并退出
- :x        --- 保存修改并退出
- :q        --- 退出，如有修改未保存会提示
- :q!       --- 强制退出，丢弃修改
- :qa!     --- 强制退出，关闭所有

### 分屏操作（keymap自定义）
- \<leader>sv  --- 水平分屏
- \<leader>sh  --- 垂直分屏
- \<leader>se  --- 分屏大小一致
- \<leader>sx  --- 关闭分屏
- \<leader>hh  --- 向左切换分屏
- \<leader>jj   ---  向下切换分屏
- \<leader>kk  --- 向上切换分屏
- \<leader>ll   ---  向右切换分屏

### 插件快捷键
- \<leader>ff     --- 当前目录下文件所搜索
- \<leader>;       --- 当前打开的buffer中进行文件名的搜索
- \<leader>fa     --- 当前项目里模糊搜索字符串 TODO
- \<leader>e     --- 查看当前光标所在行错误、警告等提示
- \<leader>q     --- 查看所有错误、警告等提示
- gD                 --- 跳转到声明
- gd                 --- 跳转到实现
- K                    --- hover变量查看类型，或函数帮助
- gi                   --- 查看光标所在类型所有 impl
- ctrl + k          --- 查看帮助
- \<leader>r     --- 变量批量重命名
- \<leader>a     --- code action
- gr                   --- 查找变量引用
- \<leader>fc    --- 格式化代码
- \<leader>ff 之后 ctrl + b --- 向上翻搜索结果
- \<leader>ff 之后 ctrl + f ---  向下翻搜索结果

### 其他绑定的keymap
- ;   ---- 模拟按 : 快捷进入命令模式
- ctrl+h --- 停止搜索，取消搜索高亮
- \<leader>\<leader> --- 打开的buffer切换
- \<leader>o --- 打开当前目录
- \<left> --- 切换打开的buffer
- \<right> --- 切换打开的buffer
