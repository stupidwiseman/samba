# samba-fs
debianベースのsambaファイルサーバイメージです

設定可能な環境変数
<dl>
 <dt>ADSJOIN</dt>
 <dd>Active Directoryドメインへの参加が必要な場合は、trueを指定してください</dd>
 <dt>REALM</dt>
 <dd>参加するActive DirectoryドメインのRealmを指定してください</dd>
 <dt>DOMAINNM</dt>
 <dd>参加するActive Directoryドメインの省略名を指定してください</dd>
 <dt>ADMIN</dt>
 <dd>参加するActive Directoryドメインの管理者アカウントを指定してください（デフォルト=administrator）</dd>
 <dt>PASSWORD</dt>
 <dd>Sambaの管理者に設定するパスワードを指定してください（デフォルト=password）</dd>
 <dt>ADUPASSWORD</dt>
 <dd>ADMINで指定した管理者のパスワードを指定してください</dd>
</dl>

* 必要に応じて、自分で作成したsmb.conf/krb5.conf/resolv.confをbindもしくはcopyしてください
* ポートフォワーディングだと、うまく共有が検索できなかったので、network_modeをhostにした方法が良いみたいです
