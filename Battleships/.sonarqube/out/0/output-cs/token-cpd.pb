ã
/D:\dev\Battleships\Battleships\Adapter\Email.cs
	namespace 	
Battleships
 
. 
Adapter 
{ 
public 

class 
Email 
{ 
public 
string 
Subject 
{ 
get  #
;# $
set% (
;( )
}* +
public 
string 
Body 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
To 
{ 
get 
; 
set  #
;# $
}% &
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
public		 
string		 
Provider		 
{		  
get		! $
;		$ %
set		& )
;		) *
}		+ ,
public

 
Email

 
(

 
)

 
{ 	
} 	
public 
Email 
( 
string 
subject #
,# $
string% +
body, 0
,0 1
string2 8
to9 ;
,; <
string= C
nameD H
,H I
stringJ P
providerQ Y
)Y Z
{ 	
Subject 
= 
subject 
; 
Body 
= 
body 
; 
To 
= 
to 
; 
Name 
= 
name 
; 
Provider 
= 
provider 
;  
} 	
} 
} Á
8D:\dev\Battleships\Battleships\Adapter\IEmailProvider.cs
	namespace 	
Battleships
 
. 
Adapter 
{ 
public 

	interface 
IEmailProvider #
{ 
Task 
	SendEmail 
( 
Email 
email "
)" #
;# $
Task 
SendToAllRecipients  
(  !
)! "
;" #
}		 
}

 ˙'
?D:\dev\Battleships\Battleships\Adapter\SendGridEmailProvider.cs
	namespace 	
Battleships
 
. 
Adapter 
{ 
public 

class !
SendGridEmailProvider &
:' (
IEmailProvider) 7
{		 
private

 
readonly

 
SendGridClient

 '
client

( .
=

/ 0
new

1 4
SendGridClient

5 C
(

C D
$str	

D ã
)


ã å
;


å ç
private 
readonly 
EmailAddress %
from& *
=+ ,
new- 0
EmailAddress1 =
(= >
$str> W
,W X
$strY f
)f g
;g h
public 
async 
Task 
	SendEmail #
(# $
Email$ )
email* /
)/ 0
{ 	
var 
subject 
= 
email 
.  
Subject  '
;' (
var 
to 
= 
new 
EmailAddress %
(% &
email& +
.+ ,
To, .
,. /
email0 5
.5 6
Name6 :
): ;
;; <
var 
plainTextContent  
=! "
email# (
.( )
Body) -
;- .
var 
htmlContent 
= 
$"  
$str  (
{( )
email) .
.. /
Body/ 3
}3 4
$str4 =
"= >
;> ?
var 
msg 
= 

MailHelper  
.  !
CreateSingleEmail! 2
(2 3
from3 7
,7 8
to9 ;
,; <
subject= D
,D E
plainTextContentF V
,V W
htmlContentX c
)c d
;d e
var 
response 
= 
await  
client! '
.' (
SendEmailAsync( 6
(6 7
msg7 :
): ;
;; <
} 	
public 
async 
Task 
SendToAllRecipients -
(- .
). /
{ 	
var 
tos 
= 
new 
List 
< 
EmailAddress +
>+ ,
{ 
new 
EmailAddress  
(  !
$str! 4
,4 5
$str6 E
)E F
,F G
new 
EmailAddress  
(  !
$str! 4
,4 5
$str6 E
)E F
,F G
new 
EmailAddress  
(  !
$str! 4
,4 5
$str6 E
)E F
} 
; 
var 
subjects 
= 
new 
List #
<# $
string$ *
>* +
{, -
$str. =
,= >
$str? N
,N O
$strP _
}` a
;a b
var 
plainTextContent  
=! "
$str# 1
;1 2
var   
htmlContent   
=   
$str   .
;  . /
var!! 
substitutions!! 
=!! 
new!!  #
List!!$ (
<!!( )

Dictionary!!) 3
<!!3 4
string!!4 :
,!!: ;
string!!< B
>!!B C
>!!C D
{"" 
new## 

Dictionary## 
<## 
string## %
,##% &
string##' -
>##- .
(##. /
)##/ 0
{##1 2
{##2 3
$str##3 ;
,##; <
$str##= D
}##D E
}##E F
,##F G
new$$ 

Dictionary$$ 
<$$ 
string$$ %
,$$% &
string$$' -
>$$- .
($$. /
)$$/ 0
{$$1 2
{$$2 3
$str$$3 ;
,$$; <
$str$$= D
}$$D E
}$$E F
,$$F G
new%% 

Dictionary%% 
<%% 
string%% %
,%%% &
string%%' -
>%%- .
(%%. /
)%%/ 0
{%%1 2
{%%2 3
$str%%3 ;
,%%; <
$str%%= D
}%%D E
}%%E F
}&& 
;&& 
var(( 
msg(( 
=(( 

MailHelper((  
.((  !4
(CreateMultipleEmailsToMultipleRecipients((! I
(((I J
from((J N
,((N O
tos)) 
,)) 
subjects** 
,** 
plainTextContent++  
,++  !
htmlContent,, 
,,, 
substitutions-- 
).. 
;.. 
var// 
response// 
=// 
await//  
client//! '
.//' (
SendEmailAsync//( 6
(//6 7
msg//7 :
)//: ;
;//; <
}00 	
}11 
}22 ﬁ
;D:\dev\Battleships\Battleships\Adapter\SmtpEmailProvider.cs
	namespace 	
Battleships
 
. 
Adapter 
{ 
public 

class 
SmtpEmailProvider "
:# $
IEmailProvider% 3
{ 
readonly		 

SmtpClient		 
_smtpClient		 '
=		( )
new		* -
(		. /
)		/ 0
;		0 1
public

 
async

 
Task

 
	SendEmail

 #
(

# $
Email

$ )
email

* /
)

/ 0
{ 	
_smtpClient 
. 
Host 
= 
$str /
;/ 0
_smtpClient 
. 
Port 
= 
$num "
;" #
_smtpClient 
. !
UseDefaultCredentials -
=. /
false0 5
;5 6
_smtpClient 
. 
	EnableSsl !
=" #
true$ (
;( )
_smtpClient 
. 
Credentials #
=$ %
new& )
NetworkCredential* ;
(; <
$str< U
,U V
$strW a
)a b
;b c
_smtpClient 
. 
Send 
( 
$str 6
,6 7
email8 =
.= >
To> @
,@ A
emailB G
.G H
SubjectH O
,O P
emailQ V
.V W
BodyW [
)[ \
;\ ]
await 
Task 
. 
Yield 
( 
) 
; 
} 	
public 
async 
Task 
SendToAllRecipients -
(- .
). /
{ 	
await 
Task 
. 
Yield 
( 
) 
; 
} 	
} 
} Å
>D:\dev\Battleships\Battleships\Commands\FriendRemoveCommand.cs
	namespace 	
Battleships
 
. 
Commands 
{ 
public 

class 
FriendRemoveCommand $
:% &
IFriendCommand' 5
{ 
private		 
Friend		 
friend		 
;		 
public 
FriendRemoveCommand "
(" #
Friend# )
friend* 0
)0 1
{ 	
this 
. 
friend 
= 
friend  
;  !
} 	
public 
void 
Execute 
( 
) 
{ 	
} 	
} 
} î
@D:\dev\Battleships\Battleships\Commands\FriendsActionCommands.cs
	namespace 	
Battleships
 
. 
Commands 
{ 
public 

class !
FriendsActionCommands &
{ 
private 
IFriendCommand 
friendRemoveCommand 2
;2 3
public

 !
FriendsActionCommands

 $
(

$ %
IFriendCommand

% 3
friendRemoveCommand

4 G
)

G H
{ 	
this 
. 
friendRemoveCommand $
=% &
friendRemoveCommand' :
;: ;
} 	
public 
void 
	TryRemove 
( 
) 
{ 	
friendRemoveCommand 
.  
Execute  '
(' (
)( )
;) *
} 	
} 
} ·
9D:\dev\Battleships\Battleships\Commands\IFriendCommand.cs
	namespace 	
Battleships
 
. 
Commands 
{ 
public 

	interface 
IFriendCommand #
{ 
void 
Execute 
( 
) 
; 
} 
} È
=D:\dev\Battleships\Battleships\Commands\IShipActionCommand.cs
	namespace 	
Battleships
 
. 
Commands 
{ 
public 

	interface 
IShipActionCommand '
{ 
void 
Execute 
( 
) 
; 
} 
} ñ
:D:\dev\Battleships\Battleships\Commands\ShipMoveCommand.cs
	namespace 	
Battleships
 
. 
Commands 
{ 
public 

class 
ShipMoveUpCommand "
:# $
IShipActionCommand% 7
{ 
private 

PlayerShip 
ship 
;  
public		 
ShipMoveUpCommand		  
(		  !

PlayerShip		! +
ship		, 0
)		0 1
{

 	
this 
. 
ship 
= 
ship 
; 
} 	
public 
void 
Execute 
( 
) 
{ 	
ship 
. 
MoveUp 
( 
) 
; 
} 	
} 
public 

class 
ShipMoveDownCommand $
:% &
IShipActionCommand' 9
{ 
private 

PlayerShip 
ship 
;  
public 
ShipMoveDownCommand "
(" #

PlayerShip# -
ship. 2
)2 3
{ 	
this 
. 
ship 
= 
ship 
; 
} 	
public 
void 
Execute 
( 
) 
{ 	
ship 
. 
MoveDown 
( 
) 
; 
}   	
}!! 
public## 

class## 
ShipMoveLeftCommand## $
:##% &
IShipActionCommand##' 9
{$$ 
private%% 

PlayerShip%% 
ship%% 
;%%  
public'' 
ShipMoveLeftCommand'' "
(''" #

PlayerShip''# -
ship''. 2
)''2 3
{(( 	
this)) 
.)) 
ship)) 
=)) 
ship)) 
;)) 
}** 	
public,, 
void,, 
Execute,, 
(,, 
),, 
{-- 	
ship.. 
... 
MoveLeft.. 
(.. 
).. 
;.. 
}// 	
}00 
public22 

class22  
ShipMoveRightCommand22 %
:22& '
IShipActionCommand22( :
{33 
private44 

PlayerShip44 
ship44 
;44  
public66  
ShipMoveRightCommand66 #
(66# $

PlayerShip66$ .
ship66/ 3
)663 4
{77 	
this88 
.88 
ship88 
=88 
ship88 
;88 
}99 	
public;; 
void;; 
Execute;; 
(;; 
);; 
{<< 	
ship== 
.== 
	MoveRight== 
(== 
)== 
;== 
}>> 	
}?? 
}@@ Œ
CD:\dev\Battleships\Battleships\Controllers\AchievementController.cs
	namespace 	
Battleships
 
. 
Controllers !
{ 
[ 
Route 

(
 
$str 
) 
] 
[		 
ApiController		 
]		 
public

 

class

 !
AchievementController

 &
:

' (
ControllerBase

) 7
{ 
private 
readonly 
IAchievementService ,
_achievementService- @
;@ A
public !
AchievementController $
($ %
IAchievementService% 8
achievementService9 K
)K L
{ 	
_achievementService 
=  !
achievementService" 4
;4 5
} 	
[ 	
HttpGet	 
( 
$str #
)# $
]$ %
public 
async 
Task 
< 
IActionResult '
>' (
ListPlayers) 4
(4 5
)5 6
{ 	
var 
achievements 
= 
await $
_achievementService% 8
.8 9
ListAchievements9 I
(I J
)J K
;K L
return 
Ok 
( 
achievements "
)" #
;# $
} 	
} 
} õ
FD:\dev\Battleships\Battleships\Controllers\AuthenticationController.cs
	namespace 	
Battleships
 
. 
Controllers !
{ 
[ 
ApiController 
] 
[		 
Route		 

(		
 
$str		 
)		 
]		 
public

 

class

 $
AuthenticationController

 )
:

* +
ControllerBase

, :
{ 
private 
readonly "
IAuthenticationService /"
_authenticationService0 F
;F G
public $
AuthenticationController '
(' ("
IAuthenticationService( >!
authenticationService? T
)T U
{ 	"
_authenticationService "
=# $!
authenticationService% :
;: ;
} 	
[ 	
HttpPost	 
( 
$str 
) 
] 
public 
async 
Task 
< 
IActionResult '
>' (
Login) .
(. /
[/ 0
FromBody0 8
]8 9
UserCredentialsDto: L
userCredentialsDtoM _
)_ `
{ 	
var 
token 
= 
await "
_authenticationService 4
.4 5
Login5 :
(: ;
userCredentialsDto; M
)M N
;N O
return 
Ok 
( 
new 
{ 
token !
}" #
)# $
;$ %
} 	
[ 	
HttpPost	 
( 
$str 
) 
] 
public 
async 
Task 
< 
IActionResult '
>' (
Register) 1
(1 2
[2 3
FromBody3 ;
]; <
UserCredentialsDto= O
registrationP \
)\ ]
{ 	
await "
_authenticationService (
.( )
Register) 1
(1 2
registration2 >
)> ?
;? @
return   
Ok   
(   
)   
;   
}!! 	
}"" 
}## ¬
>D:\dev\Battleships\Battleships\Controllers\FriendController.cs
	namespace		 	
Battleships		
 
.		 
Controllers		 !
{

 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class 
FriendController !
:" #
ControllerBase$ 2
{ 
private 
readonly 
IFriendsService (
_friendsService) 8
;8 9
public 
FriendController 
(  
IFriendsService  /
friendsService0 >
)> ?
{ 	
_friendsService 
= 
friendsService ,
;, -
} 	
[ 	
HttpGet	 
( 
$str 
) 
]  
public 
async 
Task 
< 
IActionResult '
>' (
ListFriends) 4
(4 5
)5 6
{ 	
var 
friends 
= 
await 
_friendsService  /
./ 0
ListFriends0 ;
(; <
)< =
;= >
return 
Ok 
( 
friends 
) 
; 
} 	
[ 	
HttpPost	 
( 
$str 
) 
] 
public 
async 
Task 
< 
IActionResult '
>' (
	AddFriend) 2
(2 3
[3 4
FromBody4 <
]< =
FriendAddDto> J
friendAddBodyK X
)X Y
{   	
var!! 
success!! 
=!! 
await!! 
_friendsService!!  /
.!!/ 0
	AddFriend!!0 9
(!!9 :
friendAddBody!!: G
.!!G H
UserId!!H N
)!!N O
;!!O P
return## 
Ok## 
(## 
success## 
)## 
;## 
}$$ 	
[%% 	
HttpPost%%	 
(%% 
$str%%  
)%%  !
]%%! "
public&& 
async&& 
Task&& 
<&& 
IActionResult&& '
>&&' (
RemoveFriend&&) 5
(&&5 6
[&&6 7
FromBody&&7 ?
]&&? @
	FriendDto&&A J
friend&&K Q
)&&Q R
{'' 	
var(( 
success(( 
=(( 
await(( 
_friendsService((  /
.((/ 0
RemoveFriend((0 <
(((< =
friend((= C
)((C D
;((D E
return** 
Ok** 
(** 
success** 
)** 
;** 
}++ 	
}88 
}99 —=
CD:\dev\Battleships\Battleships\Controllers\GameSessionController.cs
	namespace 	
Battleships
 
. 
Controllers !
{ 
[ 
ApiController 
] 
[ 
Route 

(
 
$str 
) 
] 
public 

class !
GameSessionController &
:& '
ControllerBase( 6
{ 
private 
readonly 
IGameSessionService ,
_gameSessionService- @
;@ A
private 
readonly 
IPlayersService (
_playersService) 8
;8 9
private 
readonly 
IGameLaunchService +
_gameLaunchService, >
;> ?
private 
readonly .
"IBattleshipsSynchronizationService ;.
"_battleshipsSynchronizationService< ^
;^ _
public !
GameSessionController $
($ %
IGameSessionService 
gameSessionService  2
,2 3
IPlayersService 
playersService *
,* +
IGameLaunchService 
gameLaunchService 0
,0 1.
"IBattleshipsSynchronizationService .-
!battleshipsSynchronizationService/ P
)P Q
{ 	
_gameSessionService 
=  !
gameSessionService" 4
;4 5
_playersService 
= 
playersService ,
;, -
_gameLaunchService 
=  
gameLaunchService! 2
;2 3.
"_battleshipsSynchronizationService .
=/ 0-
!battleshipsSynchronizationService1 R
;R S
}   	
["" 	
HttpPost""	 
("" 
$str"" !
)""! "
]""" #
public## 
async## 
Task## 
<## 
IActionResult## '
>##' (
CreateSessions##) 7
(##7 8
[##8 9
FromBody##9 A
]##A B!
GameSessionRequestDto##C X
gameSessionDto##Y g
)##g h
{$$ 	
return%% 
Ok%% 
(%% 
await%% 
_gameSessionService%% /
.%%/ 0
CreateSession%%0 =
(%%= >
gameSessionDto%%> L
)%%L M
)%%M N
;%%N O
}&& 	
[(( 	
HttpGet((	 
((( 
$str(( 
)((  
]((  !
public)) 
async)) 
Task)) 
<)) 
IActionResult)) '
>))' (
ListSessions))) 5
())5 6
)))6 7
{** 	
Console++ 
.++ 
	WriteLine++ 
(++ 
$str++ )
)++) *
;++* +
var,, 
gameSessions,, 
=,, 
await,, $
_gameSessionService,,% 8
.,,8 9
ListAllSessions,,9 H
(,,H I
),,I J
;,,J K
return.. 
Ok.. 
(.. 
gameSessions.. "
).." #
;..# $
}// 	
[11 	
HttpGet11	 
(11 
$str11 
)11 
]11 
public22 
async22 
Task22 
<22 
IActionResult22 '
>22' (

GetSession22) 3
(223 4
Guid224 8
id229 ;
)22; <
{33 	
Console44 
.44 
	WriteLine44 
(44 
$str44 1
)441 2
;442 3
Console55 
.55 
	WriteLine55 
(55 
id55  
)55  !
;55! "
var77 
game77 
=77 
await77 
_gameSessionService77 0
.770 1

GetSession771 ;
(77; <
id77< >
)77> ?
;77? @
return88 
Ok88 
(88 
game88 
)88 
;88 
}99 	
[;; 	
HttpGet;;	 
(;; 
$str;; /
);;/ 0
];;0 1
public<< 
async<< 
Task<< 
<<< 
IActionResult<< '
><<' (
GetInGameSession<<) 9
(<<9 :
Guid<<: >
gameSessionId<<? L
)<<L M
{== 	
var>> 
dto>> 
=>> 
await>> 
_gameSessionService>> /
.>>/ 0
GetInGameSession>>0 @
(>>@ A
gameSessionId>>A N
)>>N O
;>>O P
return@@ 
Ok@@ 
(@@ 
dto@@ 
)@@ 
;@@ 
}AA 	
[CC 	
HttpPostCC	 
(CC 
$strCC 4
)CC4 5
]CC5 6
publicDD 
asyncDD 
TaskDD 
<DD 
IActionResultDD '
>DD' (

LaunchGameDD) 3
(DD3 4
GuidDD4 8
gameSessionIdDD9 F
,DDF G
boolDDH L
rematchDDM T
)DDT U
{EE 	
awaitFF 
_gameLaunchServiceFF $
.FF$ %

LaunchGameFF% /
(FF/ 0
gameSessionIdFF0 =
,FF= >
rematchFF? F
)FFF G
;FFG H
ResponseHH 
.HH 
OnCompletedHH  
(HH  !
asyncHH! &
(HH' (
)HH( )
=>HH* ,
awaitII .
"_battleshipsSynchronizationServiceII 8
.II8 9!
SendLaunchGameMessageII9 N
(IIN O
gameSessionIdIIO \
)II\ ]
)II] ^
;II^ _
returnKK 
OkKK 
(KK 
)KK 
;KK 
}LL 	
[NN 	
HttpPostNN	 
(NN 
$strNN /
)NN/ 0
]NN0 1
publicOO 
asyncOO 
TaskOO 
<OO 
IActionResultOO '
>OO' (
InvitePlayerOO) 5
(OO5 6
GuidOO6 :
gameSessionIdOO; H
,OOH I
[OOJ K
FromBodyOOK S
]OOS T
UserInviteDtoOOU b
inviteOOc i
)OOi j
{PP 	
awaitQQ 
_playersServiceQQ !
.QQ! "
InviteUserToGameQQ" 2
(QQ2 3
gameSessionIdQQ3 @
,QQ@ A
inviteQQB H
.QQH I
UserIdQQI O
)QQO P
;QQP Q
ResponseSS 
.SS 
OnCompletedSS  
(SS  !
asyncSS! &
(SS' (
)SS( )
=>SS* ,
awaitTT .
"_battleshipsSynchronizationServiceTT 8
.TT8 9
InviteUserToGameTT9 I
(TTI J
gameSessionIdTTJ W
,TTW X
inviteTTY _
.TT_ `
UserIdTT` f
)TTf g
)TTg h
;TTh i
returnVV 
OkVV 
(VV 
)VV 
;VV 
}WW 	
[YY 	
HttpPostYY	 
(YY 
$strYY 2
)YY2 3
]YY3 4
publicZZ 
asyncZZ 
TaskZZ 
<ZZ 
IActionResultZZ '
>ZZ' (
MoveShipZZ) 1
(ZZ1 2
GuidZZ2 6
gameSessionIdZZ7 D
,ZZD E
[ZZF G
FromBodyZZG O
]ZZO P
ShipMoveDtoZZQ \
shipMoveDtoZZ] h
)ZZh i
{[[ 	
var]] 
dto]] 
=]] 
await]] 
_gameSessionService]] /
.]]/ 0
MoveShipInSession]]0 A
(]]A B
gameSessionId]]B O
,]]O P
shipMoveDto]]Q \
.]]\ ]
ShipId]]] c
,]]c d
shipMoveDto]]e p
.]]p q
	Direction]]q z
)]]z {
;]]{ |
return__ 
Ok__ 
(__ 
dto__ 
)__ 
;__ 
}`` 	
}aa 
}bb ‰
>D:\dev\Battleships\Battleships\Controllers\PlayerController.cs
	namespace		 	
Battleships		
 
.		 
Controllers		 !
{

 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class 
PlayerController !
:" #
ControllerBase$ 2
{ 
private 
readonly 
IPlayersService (
_playersService) 8
;8 9
public 
PlayerController 
(  
IPlayersService  /
playersService0 >
)> ?
{ 	
_playersService 
= 
playersService ,
;, -
} 	
[ 	
HttpGet	 
( 
$str 
) 
] 
public 
async 
Task 
< 
IActionResult '
>' (
ListPlayers) 4
(4 5
)5 6
{ 	
var 
allUsers 
= 
await  
_playersService! 0
.0 1
GetAllUsers1 <
(< =
)= >
;> ?
return 
Ok 
( 
allUsers 
) 
;  
} 	
[ 	
HttpGet	 
( 
$str 
) 
]  
public 
async 
Task 
< 
IActionResult '
>' (
ListLobbyPlayers) 9
(9 :
[: ;
	FromQuery; D
]D E
GuidF J
gameSessionIdK X
)X Y
{   	
var!! 
players!! 
=!! 
await!! 
_playersService!!  /
.!!/ 0
GetLobbyUsers!!0 =
(!!= >
gameSessionId!!> K
)!!K L
;!!L M
return## 
Ok## 
(## 
players## 
)## 
;## 
}$$ 	
}%% 
}&& î
;D:\dev\Battleships\Battleships\Data\ApplicationDbContext.cs
	namespace 	
Battleships
 
. 
Data 
{ 
public 

class  
ApplicationDbContext %
:& '
IdentityDbContext( 9
<9 :
ApplicationUser: I
>I J
{		 
public

 
DbSet

 
<

 
Achievement

  
>

  !
Achievements

" .
{

/ 0
get

1 4
;

4 5
set

6 9
;

9 :
}

; <
public 
DbSet 
< 
Friend 
> 
Friends $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public  
ApplicationDbContext #
(# $
DbContextOptions$ 4
options5 <
)< =
:> ?
base@ D
(D E
optionsE L
)L M
{ 	
} 	
	protected 
override 
void 
OnModelCreating  /
(/ 0
ModelBuilder0 <
modelBuilder= I
)I J
{ 	
modelBuilder 
. 
Entity 
<  
Ship  $
>$ %
(% &
)& '
. 
HasDiscriminator !
(! "
ship" &
=>' )
ship* .
.. /!
ShipTypeDiscriminator/ D
)D E
. 
HasValue 
< 
BattleshipShip (
>( )
() *
nameof* 0
(0 1
BattleshipShip1 ?
)? @
)@ A
. 
HasValue 
< 
CarrierShip %
>% &
(& '
nameof' -
(- .
CarrierShip. 9
)9 :
): ;
. 
HasValue 
< 
CruiserShip %
>% &
(& '
nameof' -
(- .
CruiserShip. 9
)9 :
): ;
. 
HasValue 
< 
DestroyerShip '
>' (
(( )
nameof) /
(/ 0
DestroyerShip0 =
)= >
)> ?
. 
HasValue 
< 
SubmarineShip '
>' (
(( )
nameof) /
(/ 0
SubmarineShip0 =
)= >
)> ?
; 
base 
. 
OnModelCreating  
(  !
modelBuilder! -
)- .
;. /
} 	
} 
} ¥
AD:\dev\Battleships\Battleships\Data\Constants\BattleshipClaims.cs
	namespace 	
Battleships
 
. 
Data 
. 
	Constants $
{ 
public 

class 
BattleshipClaims !
{ 
public 
const 
string 
UserId "
=# $
$str% .
;. /
} 
} –
BD:\dev\Battleships\Battleships\Data\Constants\EndgameStrategies.cs
	namespace 	
Battleships
 
. 
Data 
. 
	Constants $
;$ %
public 
static 
class 
EndgameStrategies %
{ 
public 

const 
string 

DeathMatch "
=# $
$str% 2
;2 3
public 

const 
string 
DestroyedShipCount *
=+ ,
$str- C
;C D
public 

const 
string 
RoundCountLimit '
=( )
$str* =
;= >
public 

const 
string 
Classic 
=  !
$str" +
;+ ,
}		 ¿
:D:\dev\Battleships\Battleships\Data\Constants\ShipTypes.cs
	namespace 	
Battleships
 
. 
Data 
. 
	Constants $
{ 
public 

static 
class 
	ShipTypes !
{ 
public 
const 
string 
Carrier #
=$ %
$str& /
;/ 0
public 
const 
string 

Battleship &
=' (
$str) 5
;5 6
public 
const 
string 
Cruiser #
=$ %
$str& /
;/ 0
public 
const 
string 
	Submarine %
=& '
$str( 3
;3 4
public		 
const		 
string		 
	Destroyer		 %
=		& '
$str		( 3
;		3 4
public

 
const

 
string

 
Dummy

 !
=

" #
$str

$ +
;

+ ,
} 
} ‹
9D:\dev\Battleships\Battleships\Data\Dto\AchievementDto.cs
	namespace 	
Battleships
 
. 
Data 
. 
Dto 
{ 
public 

class 
AchievementDto 
{ 
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
Description !
{" #
get$ '
;' (
set) ,
;, -
}. /
} 
} ª
7D:\dev\Battleships\Battleships\Data\Dto\FriendAddDto.cs
	namespace 	
Battleships
 
. 
Data 
. 
Dto 
{ 
public 

class 
FriendAddDto 
{ 
public		 
string		 
UserId		 
{		 
get		 "
;		" #
set		$ '
;		' (
}		) *
}

 
} å
4D:\dev\Battleships\Battleships\Data\Dto\FriendDto.cs
	namespace 	
Battleships
 
. 
Data 
. 
Dto 
{ 
public 

class 
	FriendDto 
{ 
public		 
string		 
Name		 
{		 
get		  
;		  !
set		" %
;		% &
}		' (
public

 
int

 
GamesPlayedCount

 #
{

$ %
get

& )
;

) *
set

+ .
;

. /
}

0 1
public 
int 
GamesWonCount  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
string 
UserId 
{ 
get "
;" #
set$ '
;' (
}) *
} 
} ù
9D:\dev\Battleships\Battleships\Data\Dto\GameSessionDto.cs
	namespace 	
Battleships
 
. 
Data 
. 
Dto 
{ 
public 

class 
GameSessionDto 
{		 
public

 
Guid

 
Id

 
{

 
get

 
;

 
set

 !
;

! "
}

# $
public 
string 
Icon 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
GridSize 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
	GameTypes 
GameType !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string 
HostName 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
Guid 
HostId 
{ 
get  
;  !
set" %
;% &
}' (
public 
List 
< 
PlayerLobbyDto "
>" #
LobbyPlayers$ 0
{1 2
get3 6
;6 7
set8 ;
;; <
}= >
public 
override 
string 
ToString '
(' (
)( )
{ 	
foreach 
( 
var 
x 
in 
LobbyPlayers *
)* +
{ 
Console 
. 
	WriteLine !
(! "
x" #
.# $
Name$ (
)( )
;) *
} 
return 
$" 
{ 
nameof 
( 
Id 
)  
}  !
$str! #
{# $
Id$ &
}& '
$str' )
{) *
nameof* 0
(0 1
Icon1 5
)5 6
}6 7
$str7 9
{9 :
Icon: >
}> ?
$str? A
{A B
nameofB H
(H I
NameI M
)M N
}N O
$strO Q
{Q R
NameR V
}V W
$strW Y
{Y Z
nameofZ `
(` a
GridSizea i
)i j
}j k
$strk m
{m n
GridSizen v
}v w
$strw y
{y z
nameof	z Ä
(
Ä Å
GameType
Å â
)
â ä
}
ä ã
$str
ã ç
{
ç é
GameType
é ñ
}
ñ ó
$str
ó ô
{
ô ö
nameof
ö †
(
† °
HostName
° ©
)
© ™
}
™ ´
$str
´ ≠
{
≠ Æ
HostName
Æ ∂
}
∂ ∑
$str
∑ π
{
π ∫
nameof
∫ ¿
(
¿ ¡
HostId
¡ «
)
« »
}
» …
$str
… À
{
À Ã
HostId
Ã “
}
“ ”
$str
” ’
{
’ ÷
nameof
÷ ‹
(
‹ ›
LobbyPlayers
› È
)
È Í
}
Í Î
$str
Î Ì
{
Ì Ó
LobbyPlayers
Ó ˙
.
˙ ˚
ToString
˚ É
(
É Ñ
)
Ñ Ö
}
Ö Ü
"
Ü á
;
á à
} 	
}(( 
})) í
@D:\dev\Battleships\Battleships\Data\Dto\GameSessionRequestDto.cs
	namespace 	
Battleships
 
. 
Data 
. 
Dto 
{ 
public 

class !
GameSessionRequestDto &
{ 
public 
string 
Icon 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
public "
GameSessionSettingsDto %
SettingsDto& 1
{2 3
get4 7
;7 8
set9 <
;< =
}> ?
} 
}		 â
AD:\dev\Battleships\Battleships\Data\Dto\GameSessionSettingsDto.cs
	namespace 	
Battleships
 
. 
Data 
. 
Dto 
{ 
public 

class "
GameSessionSettingsDto '
{ 
public 
int 
RowCount 
{ 
get !
;! "
set# &
;& '
}( )
public 
int 
ColumnCount 
{  
get! $
;$ %
set& )
;) *
}+ ,
public		 
	GameTypes		 
GameType		 !
{		" #
get		$ '
;		' (
set		) ,
;		, -
}		. /
}

 
} °
AD:\dev\Battleships\Battleships\Data\Dto\InGameSession\GameTile.cs
	namespace 	
Battleships
 
. 
Data 
. 
Dto 
. 
InGameSession ,
{ 
public 

class 
GameTile 
{ 
public 
bool 
IsShip 
{ 
get  
;  !
set" %
;% &
}' (
public 
bool 
IsDestroyed 
{  !
get" %
;% &
set' *
;* +
}, -
public		 
int		 
ColumnCoordinate		 #
{		$ %
get		& )
;		) *
set		+ .
;		. /
}		0 1
public

 
int

 
RowCoordinate

  
{

! "
get

# &
;

& '
set

( +
;

+ ,
}

- .
public 
Guid 
? 
ShipId 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
SkinName 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
Label 
{ 
get !
;! "
set# &
;& '
}( )
} 
} ⁄
ID:\dev\Battleships\Battleships\Data\Dto\InGameSession\InGameSessionDto.cs
	namespace 	
Battleships
 
. 
Data 
. 
Dto 
. 
InGameSession ,
{ 
public 

class 
InGameSessionDto !
{ 
public 
Guid 
GameSessionId !
{" #
get$ '
;' (
set) ,
;, -
}. /
public		 
int		 
ColumnCount		 
{		  
get		! $
;		$ %
set		& )
;		) *
}		+ ,
public

 
int

 
RowCount

 
{

 
get

 !
;

! "
set

# &
;

& '
}

( )
public 
int 
CurrentRound 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 
OwnName 
{ 
get  #
;# $
set% (
;( )
}* +
public 
string 
OpponentName "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
string $
CurrentRoundPlayerUserId .
{/ 0
get1 4
;4 5
set6 9
;9 :
}; <
public 
List 
< 
GameTile 
> 
OwnTiles &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public 
List 
< 
GameTile 
> 
OpponentTiles +
{, -
get. 1
;1 2
set3 6
;6 7
}8 9
} 
} å
DD:\dev\Battleships\Battleships\Data\Dto\InGameSession\ShipMoveDto.cs
	namespace 	
Battleships
 
. 
Data 
. 
Dto 
. 
InGameSession ,
{ 
public 

class 
ShipMoveDto 
{ 
public 
Guid 
ShipId 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
	Direction 
{  !
get" %
;% &
set' *
;* +
}, -
}

 
} †
4D:\dev\Battleships\Battleships\Data\Dto\PlayerDto.cs
	namespace 	
Battleships
 
. 
Data 
. 
Dto 
{ 
public 

class 
	PlayerDto 
{ 
public		 
Guid		 
Id		 
{		 
get		 
;		 
set		 !
;		! "
}		# $
public

 
string

 
Name

 
{

 
get

  
;

  !
set

" %
;

% &
}

' (
public 
int 
GamesPlayedCount #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
int 
GamesWonCount  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
string 
UserId 
{ 
get "
;" #
set$ '
;' (
}) *
} 
} Ì
9D:\dev\Battleships\Battleships\Data\Dto\PlayerLobbyDto.cs
	namespace 	
Battleships
 
. 
Data 
. 
Dto 
{ 
public 

class 
PlayerLobbyDto 
{ 
public 
string 
Id 
{ 
get 
; 
set  #
;# $
}% &
public 
string 
UserId 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
} 
}		 
FD:\dev\Battleships\Battleships\Data\Dto\PlayerLobbyDtoWithSessionId.cs
	namespace 	
Battleships
 
. 
Data 
. 
Dto 
{ 
public 

class '
PlayerLobbyDtoWithSessionId ,
{ 
public 
string 
Id 
{ 
get 
; 
set  #
;# $
}% &
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
public		 
Guid		 
	SessionId		 
{		 
get		  #
;		# $
set		% (
;		( )
}		* +
public 
override 
string 
ToString '
(' (
)( )
{ 	
return 
$" 
{ 
nameof 
( 
Id 
)  
}  !
$str! #
{# $
Id$ &
}& '
$str' )
{) *
nameof* 0
(0 1
Name1 5
)5 6
}6 7
$str7 9
{9 :
Name: >
}> ?
$str? A
{A B
nameofB H
(H I
	SessionIdI R
)R S
}S T
$strT V
{V W
	SessionIdW `
}` a
"a b
;b c
} 	
} 
} ‚
=D:\dev\Battleships\Battleships\Data\Dto\UserCredentialsDto.cs
	namespace 	
Battleships
 
. 
Data 
. 
Dto 
{ 
public 

class 
UserCredentialsDto #
{ 
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
Password 
{  
get! $
;$ %
set& )
;) *
}+ ,
} 
} Ñ
2D:\dev\Battleships\Battleships\Data\Dto\UserDto.cs
	namespace 	
Battleships
 
. 
Data 
. 
Dto 
{ 
public 

class 
UserDto 
{ 
public 
string 
Id 
{ 
get 
; 
set  #
;# $
}% &
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
public 
int 
GamesPlayedCount #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
int 
GamesWonCount  
{! "
get# &
;& '
set( +
;+ ,
}- .
}		 
}

 Ω
8D:\dev\Battleships\Battleships\Data\Dto\UserInviteDto.cs
	namespace 	
Battleships
 
. 
Data 
. 
Dto 
{ 
public 

class 
UserInviteDto 
{ 
public 
string 
UserId 
{ 
get "
;" #
set$ '
;' (
}) *
} 
} ·
6D:\dev\Battleships\Battleships\Data\NumberGenerator.cs
	namespace 	
Battleships
 
. 
Data 
{ 
public 

class 
NumberGenerator  
{ 
private 
readonly 
int 
	_maxValue &
;& '
public		 
NumberGenerator		 
(		 
int		 "
maxValue		# +
)		+ ,
{

 	
	_maxValue 
= 
maxValue  
;  !
} 	
public 
int 
GenerateNumber !
(! "
)" #
{ 	
return !
RandomNumberGenerator (
.( )
GetInt32) 1
(1 2
	_maxValue2 ;
); <
;< =
} 	
} 
} ÓY
7D:\dev\Battleships\Battleships\Data\SeedAchievements.cs
	namespace 	
Battleships
 
. 
Data 
{ 
public 

static 
class 
SeedAchievements (
{ 
public 
static 
void 
SeedAchs #
(# $
IServiceProvider$ 4
serviceProvider5 D
)D E
{ 	
using 
var 
serviceScope "
=# $
serviceProvider% 4
.4 5
CreateScope5 @
(@ A
)A B
;B C
var 
battleshipsDatabase #
=$ %
serviceScope& 2
.2 3
ServiceProvider3 B
.B C
GetRequiredServiceC U
<U V 
IBattleshipsDatabaseV j
>j k
(k l
)l m
;m n
var 
isEmpty 
= 
battleshipsDatabase -
.- ."
AchievementsRepository. D
.D E
IsEmptyE L
(L M
)M N
;N O
if 
( 
isEmpty 
) 
{ 
var 
achievementManager &
=' (
new) ,
AchievementManager- ?
(? @
)@ A
;A B
CloneAchievements !
(! "
achievementManager" 4
)4 5
;5 6
var 
achievements  
=! "
new# &
List' +
<+ ,
Achievement, 7
>7 8
(8 9
)9 :
{ 
achievementManager &
[& '
$str' +
]+ ,
as- /
Achievement0 ;
,; <
achievementManager &
[& '
$str' +
]+ ,
as- /
Achievement0 ;
,; <
achievementManager &
[& '
$str' +
]+ ,
as- /
Achievement0 ;
,; <
achievementManager   &
[  & '
$str  ' *
]  * +
as  , .
Achievement  / :
,  : ;
achievementManager!! &
[!!& '
$str!!' ,
]!!, -
as!!. 0
Achievement!!1 <
,!!< =
achievementManager"" &
[""& '
$str""' *
]""* +
as"", .
Achievement""/ :
,"": ;
achievementManager## &
[##& '
$str##' +
]##+ ,
as##- /
Achievement##0 ;
,##; <
achievementManager$$ &
[$$& '
$str$$' +
]$$+ ,
as$$- /
Achievement$$0 ;
,$$; <
achievementManager%% &
[%%& '
$str%%' *
]%%* +
as%%, .
Achievement%%/ :
,%%: ;
achievementManager&& &
[&&& '
$str&&' +
]&&+ ,
as&&- /
Achievement&&0 ;
}'' 
;'' 
battleshipsDatabase)) #
.))# $"
AchievementsRepository))$ :
.)): ;

CreateMany)); E
())E F
achievements))F R
)))R S
.))S T
Wait))T X
())X Y
)))Y Z
;))Z [
}** 
}++ 	
private-- 
static-- 
void-- 
CloneAchievements-- -
(--- .
AchievementManager--. @
achievementManager--A S
)--S T
{.. 	
achievementManager// 
[// 
$str// #
]//# $
=//% &
new//' *
Achievement//+ 6
{00 
Id11 
=11 
Guid11 
.11 
Parse11 
(11  
$str11  F
)11F G
,11G H
Name22 
=22 
$str22 $
,22$ %
Description33 
=33 
$str33 >
,33> ?
RequiredAction44 
=44  
$str44! /
,44/ 0 
ActionPerformedCount55 $
=55% &
$num55' (
,55( )(
RequiredActionPerformedCount66 ,
=66- .
$num66/ 0
}77 
;77 
achievementManager99 
[99 
$str99 #
]99# $
=99% &
new99' *
Achievement99+ 6
{:: 
Id;; 
=;; 
Guid;; 
.;; 
Parse;; 
(;;  
$str;;  F
);;F G
,;;G H
Name<< 
=<< 
$str<< "
,<<" #
Description== 
=== 
$str== 4
,==4 5
RequiredAction>> 
=>>  
$str>>! ,
,>>, - 
ActionPerformedCount?? $
=??% &
$num??' (
,??( )(
RequiredActionPerformedCount@@ ,
=@@- .
$num@@/ 0
}AA 
;AA 
achievementManagerCC 
[CC 
$strCC #
]CC# $
=CC% &
newCC' *
AchievementCC+ 6
{DD 
IdEE 
=EE 
GuidEE 
.EE 
ParseEE 
(EE  
$strEE  F
)EEF G
,EEG H
NameFF 
=FF 
$strFF  
,FF  !
DescriptionGG 
=GG 
$strGG M
,GGM N
RequiredActionHH 
=HH  
$strHH! @
,HH@ A 
ActionPerformedCountII $
=II% &
$numII' (
,II( )(
RequiredActionPerformedCountJJ ,
=JJ- .
$numJJ/ 0
}KK 
;KK 
achievementManagerMM 
[MM 
$strMM "
]MM" #
=MM$ %
newMM& )
AchievementMM* 5
{NN 
IdOO 
=OO 
GuidOO 
.OO 
ParseOO 
(OO  
$strOO  F
)OOF G
,OOG H
NamePP 
=PP 
$strPP 
,PP 
DescriptionQQ 
=QQ 
$strQQ B
,QQB C
RequiredActionRR 
=RR  
$strRR! 6
,RR6 7 
ActionPerformedCountSS $
=SS% &
$numSS' (
,SS( )(
RequiredActionPerformedCountTT ,
=TT- .
$numTT/ 0
}UU 
;UU 
achievementManagerWW 
[WW 
$strWW $
]WW$ %
=WW& '
newWW( +
AchievementWW, 7
{XX 
IdYY 
=YY 
GuidYY 
.YY 
ParseYY 
(YY  
$strYY  F
)YYF G
,YYG H
NameZZ 
=ZZ 
$strZZ "
,ZZ" #
Description[[ 
=[[ 
$str[[ F
,[[F G
RequiredAction\\ 
=\\  
$str\\! .
,\\. / 
ActionPerformedCount]] $
=]]% &
$num]]' (
,]]( )(
RequiredActionPerformedCount^^ ,
=^^- .
$num^^/ 0
}__ 
;__ 
achievementManageraa 
[aa 
$straa "
]aa" #
=aa$ %
newaa& )
Achievementaa* 5
{bb 
Idcc 
=cc 
Guidcc 
.cc 
Parsecc 
(cc  
$strcc  F
)ccF G
,ccG H
Namedd 
=dd 
$strdd 
,dd 
Descriptionee 
=ee 
$stree G
,eeG H
RequiredActionff 
=ff  
$strff! /
,ff/ 0 
ActionPerformedCountgg $
=gg% &
$numgg' (
,gg( )(
RequiredActionPerformedCounthh ,
=hh- .
$numhh/ 0
}ii 
;ii 
achievementManagerkk 
[kk 
$strkk #
]kk# $
=kk% &
newkk' *
Achievementkk+ 6
{ll 
Idmm 
=mm 
Guidmm 
.mm 
Parsemm 
(mm  
$strmm  F
)mmF G
,mmG H
Namenn 
=nn 
$strnn !
,nn! "
Descriptionoo 
=oo 
$stroo <
,oo< =
RequiredActionpp 
=pp  
$strpp! -
,pp- . 
ActionPerformedCountqq $
=qq% &
$numqq' (
,qq( )(
RequiredActionPerformedCountrr ,
=rr- .
$numrr/ 0
}ss 
;ss 
achievementManageruu 
[uu 
$struu #
]uu# $
=uu% &
newuu' *
Achievementuu+ 6
{vv 
Idww 
=ww 
Guidww 
.ww 
Parseww 
(ww  
$strww  F
)wwF G
,wwG H
Namexx 
=xx 
$strxx  
,xx  !
Descriptionyy 
=yy 
$stryy 6
,yy6 7
RequiredActionzz 
=zz  
$strzz! .
,zz. / 
ActionPerformedCount{{ $
={{% &
$num{{' (
,{{( )(
RequiredActionPerformedCount|| ,
=||- .
$num||/ 0
}}} 
;}} 
achievementManager 
[ 
$str "
]" #
=$ %
new& )
Achievement* 5
{
ÄÄ 
Id
ÅÅ 
=
ÅÅ 
Guid
ÅÅ 
.
ÅÅ 
Parse
ÅÅ 
(
ÅÅ  
$str
ÅÅ  F
)
ÅÅF G
,
ÅÅG H
Name
ÇÇ 
=
ÇÇ 
$str
ÇÇ  
,
ÇÇ  !
Description
ÉÉ 
=
ÉÉ 
$str
ÉÉ :
,
ÉÉ: ;
RequiredAction
ÑÑ 
=
ÑÑ  
$str
ÑÑ! /
,
ÑÑ/ 0"
ActionPerformedCount
ÖÖ $
=
ÖÖ% &
$num
ÖÖ' (
,
ÖÖ( )*
RequiredActionPerformedCount
ÜÜ ,
=
ÜÜ- .
$num
ÜÜ/ 0
}
áá 
;
áá  
achievementManager
ââ 
[
ââ 
$str
ââ #
]
ââ# $
=
ââ% &
new
ââ' *
Achievement
ââ+ 6
{
ää 
Id
ãã 
=
ãã 
Guid
ãã 
.
ãã 
Parse
ãã 
(
ãã  
$str
ãã  F
)
ããF G
,
ããG H
Name
åå 
=
åå 
$str
åå $
,
åå$ %
Description
çç 
=
çç 
$str
çç .
,
çç. /
RequiredAction
éé 
=
éé  
$str
éé! 1
,
éé1 2"
ActionPerformedCount
èè $
=
èè% &
$num
èè' (
,
èè( )*
RequiredActionPerformedCount
êê ,
=
êê- .
$num
êê/ 1
}
ëë 
;
ëë  
achievementManager
ìì 
[
ìì 
$str
ìì %
]
ìì% &
=
ìì' (
new
ìì) ,
Achievement
ìì- 8
{
îî 
Id
ïï 
=
ïï 
Guid
ïï 
.
ïï 
Parse
ïï 
(
ïï  
$str
ïï  F
)
ïïF G
,
ïïG H
Name
ññ 
=
ññ 
$str
ññ 
,
ññ 
Description
óó 
=
óó 
$str
óó )
,
óó) *
RequiredAction
òò 
=
òò  
$str
òò! .
,
òò. /"
ActionPerformedCount
ôô $
=
ôô% &
$num
ôô' +
,
ôô+ ,*
RequiredActionPerformedCount
öö ,
=
öö- .
$num
öö/ 0
}
õõ 
;
õõ 
}
úú 	
}
ùù 
}ûû æ
1D:\dev\Battleships\Battleships\Data\ShipSeeder.cs
	namespace		 	
Battleships		
 
.		 
Data		 
{

 
public 

class 

ShipSeeder 
{ 
public 
static 
void 
	SeedShips $
($ %
IServiceProvider% 5
serviceProvider6 E
)E F
{ 	
using 
var 
serviceScope "
=# $
serviceProvider% 4
.4 5
CreateScope5 @
(@ A
)A B
;B C
var 
battleshipsDatabase #
=$ %
serviceScope& 2
.2 3
ServiceProvider3 B
.B C
GetRequiredServiceC U
<U V 
IBattleshipsDatabaseV j
>j k
(k l
)l m
;m n
var 
isEmpty 
= 
battleshipsDatabase -
.- .
ShipsRepository. =
.= >
IsEmpty> E
(E F
)F G
;G H
if 
( 
isEmpty 
) 
{ 
var 
factoryProducer #
=$ %
new& )
ShipFactoryProducer* =
(= >
)> ?
;? @
var 
neutralShipFactory &
=' (
factoryProducer) 8
.8 9
ProduceFactory9 G
(G H
nullH L
)L M
;M N
var !
defensiveShipsFactory )
=* +
factoryProducer, ;
.; <
ProduceFactory< J
(J K
trueK O
)O P
;P Q
var !
offensiveShipsFactory )
=* +
factoryProducer, ;
.; <
ProduceFactory< J
(J K
falseK P
)P Q
;Q R
var 
ships 
= 
new 
List  $
<$ %
Ship% )
>) *
(* +
)+ ,
{ !
defensiveShipsFactory )
.) *
GenerateShip* 6
(6 7
	ShipTypes7 @
.@ A
CarrierA H
)H I
,I J!
defensiveShipsFactory )
.) *
GenerateShip* 6
(6 7
	ShipTypes7 @
.@ A
CruiserA H
)H I
,I J!
offensiveShipsFactory )
.) *
GenerateShip* 6
(6 7
	ShipTypes7 @
.@ A

BattleshipA K
)K L
,L M!
offensiveShipsFactory )
.) *
GenerateShip* 6
(6 7
	ShipTypes7 @
.@ A
	DestroyerA J
)J K
,K L!
offensiveShipsFactory   )
.  ) *
GenerateShip  * 6
(  6 7
	ShipTypes  7 @
.  @ A
	Submarine  A J
)  J K
,  K L
neutralShipFactory!! &
.!!& '
GenerateShip!!' 3
(!!3 4
	ShipTypes!!4 =
.!!= >
Dummy!!> C
)!!C D
}"" 
;"" 
battleshipsDatabase$$ #
.$$# $
ShipsRepository$$$ 3
.$$3 4

CreateMany$$4 >
($$> ?
ships$$? D
)$$D E
.$$E F
Wait$$F J
($$J K
)$$K L
;$$L M
}%% 
}&& 	
}'' 
}(( ≈
:D:\dev\Battleships\Battleships\Decorators\InfoDecorator.cs
	namespace 	
Battleships
 
. 

Decorators  
{ 
public 

class 
InfoDecorator 
:  
ShipDecorator! .
{ 
public 
InfoDecorator 
( 
IShipAppearance ,
shipDecorator- :
): ;
:< =
base> B
(B C
shipDecoratorC P
)P Q
{R S
}T U
public		 
override		 
ShipAppearance		 &
Draw		' +
(		+ ,
)		, -
{

 	
ShipAppearance 
shipAppearance )
=* +
base, 0
.0 1
Draw1 5
(5 6
)6 7
;7 8
var 
InfoList 
= 
new 
List #
<# $
string$ *
>* +
(+ ,
), -
{ 
shipAppearance 
. 
Ship #
.# $
Name$ (
,( )
shipAppearance 
. 
Ship #
.# $
Description$ /
} 
; 
shipAppearance 
. 
Info 
=  !
InfoList" *
;* +
return 
shipAppearance !
;! "
} 	
} 
} ª
<D:\dev\Battleships\Battleships\Decorators\IShipAppearance.cs
	namespace 	
Battleships
 
. 

Decorators  
{ 
public 

	interface 
IShipAppearance $
{ 
ShipAppearance 
Draw 
( 
) 
; 
string		 
SkinName		 
{		 
get		 
;		 
}		  
string

 
Label

 
{

 
get

 
;

 
}

 
} 
} ù
;D:\dev\Battleships\Battleships\Decorators\LabelDecorator.cs
	namespace 	
Battleships
 
. 

Decorators  
{ 
public 

class 
LabelDecorator 
:  !
ShipDecorator" /
{ 
public 
LabelDecorator 
( 
IShipAppearance -
shipDecorator. ;
); <
:= >
base? C
(C D
shipDecoratorD Q
)Q R
{S T
}U V
public 
override 
ShipAppearance &
Draw' +
(+ ,
), -
{ 	
ShipAppearance		 
shipAppearance		 )
=		* +
base		, 0
.		0 1
Draw		1 5
(		5 6
)		6 7
;		7 8
shipAppearance

 
.

 
Label

  
=

! "
$str

# .
;

. /
return 
shipAppearance !
;! "
} 	
} 
} …
;D:\dev\Battleships\Battleships\Decorators\ShipAppearance.cs
	namespace 	
Battleships
 
. 

Decorators  
{ 
public 

class 
ShipAppearance 
:  !

PlayerShip" ,
,, -
IShipAppearance. =
{		 
public

 
string

 
Label

 
{

 
get

 !
;

! "
set

# &
;

& '
}

( )
public 
string 
SkinName 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
List 
< 
string 
> 
Info  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
ShipAppearance 
Draw "
(" #
)# $
{ 	
return 
new 
ShipAppearance %
(% &
)& '
;' (
} 	
} 
} ”	
:D:\dev\Battleships\Battleships\Decorators\ShipDecorator.cs
	namespace 	
Battleships
 
. 

Decorators  
{ 
public 

class 
ShipDecorator 
:  
IShipAppearance! 0
{ 
private 
IShipAppearance 
_shipDecorator  .
;. /
public		 
string		 
SkinName		 
=>		 !
_shipDecorator		" 0
.		0 1
SkinName		1 9
;		9 :
public

 
string

 
Label

 
=>

 
_shipDecorator

 -
.

- .
Label

. 3
;

3 4
public 
ShipDecorator 
( 
IShipAppearance ,
shipDecorator- :
): ;
{ 	
_shipDecorator 
= 
shipDecorator *
;* +
} 	
public 
virtual 
ShipAppearance %
Draw& *
(* +
)+ ,
{ 	
return 
_shipDecorator !
.! "
Draw" &
(& '
)' (
;( )
} 	
} 
} ù
:D:\dev\Battleships\Battleships\Decorators\SkinDecorator.cs
	namespace 	
Battleships
 
. 

Decorators  
{ 
public 

class 
SkinDecorator 
:  
ShipDecorator! .
{ 
public 
SkinDecorator 
( 
IShipAppearance ,
shipDecorator- :
): ;
:< =
base> B
(B C
shipDecoratorC P
)P Q
{R S
}T U
public 
override 
ShipAppearance &
Draw' +
(+ ,
), -
{ 	
ShipAppearance		 
shipAppearance		 )
=		* +
base		, 0
.		0 1
Draw		1 5
(		5 6
)		6 7
;		7 8
shipAppearance

 
.

 
SkinName

 #
=

$ %
$str

& ,
;

, -
return 
shipAppearance !
;! "
} 	
} 
} ⁄
;D:\dev\Battleships\Battleships\Facades\GameSessionFacade.cs
	namespace 	
Battleships
 
. 
Facades 
{ 
public 

class 
GameSessionFacade "
:# $
IGameSessionFacade% 7
{ 
private 
readonly  
IBattleshipsDatabase -
	_database. 7
;7 8
private 
readonly 
ICurrentUserService ,
_currentUserService- @
;@ A
private 
readonly !
GameSessionRequestDto .
dto/ 2
;2 3
public 
GameSessionFacade  
(  ! 
IBattleshipsDatabase! 5
database6 >
,> ?
ICurrentUserService@ S
currentUserServiceT f
,f g!
GameSessionRequestDtoh }
dto	~ Å
)
Å Ç
{ 	
this 
. 
	_database 
= 
database %
;% &
this 
. 
_currentUserService $
=% &
currentUserService' 9
;9 :
this 
. 
dto 
= 
dto 
; 
} 	
public 
async 
Task 
< 
Guid 
> 
CreateGameSession  1
(1 2
)2 3
{ 	
var 
userId 
= 
_currentUserService ,
., -
GetCurrentUserId- =
(= >
)> ?
;? @
var 
gameSettings 
= 
new "
GameSessionSettings# 6
{ 
ColumnCount   
=   
dto   !
.  ! "
SettingsDto  " -
.  - .
ColumnCount  . 9
,  9 :
RowCount!! 
=!! 
dto!! 
.!! 
SettingsDto!! *
.!!* +
RowCount!!+ 3
,!!3 4
GameType"" 
="" 
dto"" 
."" 
SettingsDto"" *
.""* +
GameType""+ 3
}## 
;## 
var$$ 
players$$ 
=$$ 
new$$ 
List$$ "
<$$" #
Player$$# )
>$$) *
{%% 
new&& 
Player&& 
{'' 
IsHost(( 
=(( 
true(( !
,((! "
UserId)) 
=)) 
userId)) #
,))# $
IsCurrentPlayerTurn** '
=**( )
true*** .
}++ 
},, 
;,, 
var.. 
gameSession.. 
=.. 
new.. !
GameSessionBuilder.." 4
(..4 5
)..5 6
.// 
WithIcon// 
(// 
dto// 
.// 
Icon// "
)//" #
.00 
WithName00 
(00 
dto00 
.00 
Name00 "
)00" #
.11 
WithDateCreated11  
(11  !
DateTime11! )
.11) *
UtcNow11* 0
)110 1
.22 
WithSessionSettings22 $
(22$ %
gameSettings22% 1
)221 2
.33 
WithPlayers33 
(33 
players33 $
)33$ %
.44 

WithStatus44 
(44 
GameSessionStatus44 -
.44- .
Created44. 5
)445 6
.55 
Build55 
(55 
)55 
;55 
var77 
id77 
=77 
await77 
	_database77 $
.77$ %"
GameSessionsRepository77% ;
.77; <
Create77< B
(77B C
gameSession77C N
)77N O
;77O P
return99 
id99 
;99 
}:: 	
};; 
}<< §
<D:\dev\Battleships\Battleships\Facades\IGameSessionFacade.cs
	namespace 	
Battleships
 
. 
Facades 
; 
public 
	interface 
IGameSessionFacade #
{ 
public 

Task 
< 
Guid 
> 
CreateGameSession '
(' (
)( )
;) *
}		 ÿ
?D:\dev\Battleships\Battleships\Factories\AbstractShipFactory.cs
	namespace 	
Battleships
 
. 
	Factories 
{ 
public 

abstract 
class 
AbstractShipFactory -
{ 
public 
abstract 
Ship 
GenerateShip )
() *
string* 0
shipType1 9
)9 :
;: ;
} 
}		 ®

@D:\dev\Battleships\Battleships\Factories\DefensiveShipFactory.cs
	namespace 	
Battleships
 
. 
	Factories 
{ 
public 

class  
DefensiveShipFactory %
:& '
AbstractShipFactory( ;
{ 
public 
override 
Ship 
GenerateShip )
() *
string* 0
shipType1 9
)9 :
{		 	
if

 
(

 
shipType

 
==

 
	ShipTypes

 %
.

% &
Carrier

& -
)

- .
{ 
return 
new 
CarrierShip &
{ 
ShipType 
= 
	ShipTypes (
.( )
Carrier) 0
} 
; 
} 
if 
( 
shipType 
== 
	ShipTypes %
.% &
Cruiser& -
)- .
{ 
return 
new 
CruiserShip &
{ 
ShipType 
= 
	ShipTypes (
.( )
Cruiser) 0
} 
; 
} 
return 
null 
; 
} 	
} 
} ƒ
>D:\dev\Battleships\Battleships\Factories\NeutralShipFactory.cs
	namespace 	
Battleships
 
. 
	Factories 
{ 
public 

class 
NeutralShipFactory #
:$ %
AbstractShipFactory& 9
{ 
public 
override 
Ship 
GenerateShip )
() *
string* 0
shipType1 9
)9 :
{		 	
if

 
(

 
shipType

 
==

 
	ShipTypes

 %
.

% &
Dummy

& +
)

+ ,
{ 
return 
new 
	DummyShip $
($ %
)% &
{ 
ShipType 
= 
	ShipTypes (
.( )
Dummy) .
} 
; 
} 
return 
null 
; 
} 	
} 
} ±
BD:\dev\Battleships\Battleships\Factories\NumberGeneratorFactory.cs
	namespace 	
Battleships
 
. 
	Factories 
{ 
public 

class "
NumberGeneratorFactory '
{ 
public 
NumberGenerator 
GetNumberGenerator 1
(1 2
int2 5
maxValue6 >
)> ?
{ 	
var		 
	generator		 
=		 
new		 
NumberGenerator		  /
(		/ 0
maxValue		0 8
)		8 9
;		9 :
return 
	generator 
; 
} 	
} 
} µ
@D:\dev\Battleships\Battleships\Factories\OffensiveShipFactory.cs
	namespace 	
Battleships
 
. 
	Factories 
{ 
public 

class  
OffensiveShipFactory %
:& '
AbstractShipFactory( ;
{ 
public 
override 
Ship 
GenerateShip )
() *
string* 0
shipType1 9
)9 :
{		 	
if

 
(

 
shipType

 
==

 
	ShipTypes

 %
.

% &

Battleship

& 0
)

0 1
{ 
return 
new 
BattleshipShip )
{ 
ShipType 
= 
	ShipTypes (
.( )

Battleship) 3
} 
; 
} 
if 
( 
shipType 
== 
	ShipTypes %
.% &
	Submarine& /
)/ 0
{ 
return 
new 
SubmarineShip (
{ 
ShipType 
= 
	ShipTypes (
.( )
	Submarine) 2
} 
; 
} 
if 
( 
shipType 
== 
	ShipTypes %
.% &
	Destroyer& /
)/ 0
{ 
return 
new 
DestroyerShip (
{ 
ShipType 
= 
	ShipTypes (
.( )
	Destroyer) 2
} 
; 
}   
return"" 
null"" 
;"" 
}## 	
}$$ 
}%% ¥
?D:\dev\Battleships\Battleships\Factories\ShipFactoryProducer.cs
	namespace 	
Battleships
 
. 
	Factories 
{ 
public 

class 
ShipFactoryProducer $
{ 
public 
AbstractShipFactory "
ProduceFactory# 1
(1 2
bool2 6
?6 7
isDefensive8 C
)C D
{ 	
if		 
(		 
isDefensive		 
==		 
null		 #
)		# $
return		% +
new		, /
NeutralShipFactory		0 B
(		B C
)		C D
;		D E
if 
( 
( 
bool 
) 
isDefensive !
)! "
{ 
return 
new  
DefensiveShipFactory /
(/ 0
)0 1
;1 2
} 
return 
new  
OffensiveShipFactory +
(+ ,
), -
;- .
} 	
} 
} „
GD:\dev\Battleships\Battleships\Migrations\20221022102651_friendsInit.cs
	namespace 	
Battleships
 
. 

Migrations  
{ 
public		 

partial		 
class		 
friendsInit		 $
:		% &
	Migration		' 0
{

 
	protected 
override 
void 
Up  "
(" #
MigrationBuilder# 3
migrationBuilder4 D
)D E
{ 	
migrationBuilder 
. 
CreateTable (
(( )
name 
: 
$str $
,$ %
columns 
: 
table 
=> !
new" %
{ 
Id 
= 
table 
. 
Column %
<% &
Guid& *
>* +
(+ ,
type, 0
:0 1
$str2 8
,8 9
nullable: B
:B C
falseD I
)I J
,J K
Name 
= 
table  
.  !
Column! '
<' (
string( .
>. /
(/ 0
type0 4
:4 5
$str6 <
,< =
nullable> F
:F G
trueH L
)L M
,M N
Description 
=  !
table" '
.' (
Column( .
<. /
string/ 5
>5 6
(6 7
type7 ;
:; <
$str= C
,C D
nullableE M
:M N
trueO S
)S T
,T U
RequiredAction "
=# $
table% *
.* +
Column+ 1
<1 2
string2 8
>8 9
(9 :
type: >
:> ?
$str@ F
,F G
nullableH P
:P Q
trueR V
)V W
,W X 
ActionPerformedCount (
=) *
table+ 0
.0 1
Column1 7
<7 8
int8 ;
>; <
(< =
type= A
:A B
$strC L
,L M
nullableN V
:V W
falseX ]
)] ^
,^ _(
RequiredActionPerformedCount 0
=1 2
table3 8
.8 9
Column9 ?
<? @
int@ C
>C D
(D E
typeE I
:I J
$strK T
,T U
nullableV ^
:^ _
false` e
)e f
} 
, 
constraints 
: 
table "
=># %
{ 
table 
. 

PrimaryKey $
($ %
$str% 6
,6 7
x8 9
=>: <
x= >
.> ?
Id? A
)A B
;B C
} 
) 
; 
migrationBuilder 
. 
CreateTable (
(( )
name 
: 
$str #
,# $
columns 
: 
table 
=> !
new" %
{   
Id!! 
=!! 
table!! 
.!! 
Column!! %
<!!% &
string!!& ,
>!!, -
(!!- .
type!!. 2
:!!2 3
$str!!4 :
,!!: ;
nullable!!< D
:!!D E
false!!F K
)!!K L
,!!L M
Name"" 
="" 
table""  
.""  !
Column""! '
<""' (
string""( .
>"". /
(""/ 0
type""0 4
:""4 5
$str""6 N
,""N O
	maxLength""P Y
:""Y Z
$num""[ ^
,""^ _
nullable""` h
:""h i
true""j n
)""n o
,""o p
NormalizedName## "
=### $
table##% *
.##* +
Column##+ 1
<##1 2
string##2 8
>##8 9
(##9 :
type##: >
:##> ?
$str##@ X
,##X Y
	maxLength##Z c
:##c d
$num##e h
,##h i
nullable##j r
:##r s
true##t x
)##x y
,##y z
ConcurrencyStamp$$ $
=$$% &
table$$' ,
.$$, -
Column$$- 3
<$$3 4
string$$4 :
>$$: ;
($$; <
type$$< @
:$$@ A
$str$$B H
,$$H I
nullable$$J R
:$$R S
true$$T X
)$$X Y
}%% 
,%% 
constraints&& 
:&& 
table&& "
=>&&# %
{'' 
table(( 
.(( 

PrimaryKey(( $
((($ %
$str((% 5
,((5 6
x((7 8
=>((9 ;
x((< =
.((= >
Id((> @
)((@ A
;((A B
})) 
))) 
;)) 
migrationBuilder++ 
.++ 
CreateTable++ (
(++( )
name,, 
:,, 
$str,, 
,,,  
columns-- 
:-- 
table-- 
=>-- !
new--" %
{.. 
Id// 
=// 
table// 
.// 
Column// %
<//% &
Guid//& *
>//* +
(//+ ,
type//, 0
://0 1
$str//2 8
,//8 9
nullable//: B
://B C
false//D I
)//I J
,//J K
User100 
=00 
table00 !
.00! "
Column00" (
<00( )
Guid00) -
>00- .
(00. /
type00/ 3
:003 4
$str005 ;
,00; <
nullable00= E
:00E F
false00G L
)00L M
,00M N
User211 
=11 
table11 !
.11! "
Column11" (
<11( )
Guid11) -
>11- .
(11. /
type11/ 3
:113 4
$str115 ;
,11; <
nullable11= E
:11E F
false11G L
)11L M
}22 
,22 
constraints33 
:33 
table33 "
=>33# %
{44 
table55 
.55 

PrimaryKey55 $
(55$ %
$str55% 1
,551 2
x553 4
=>555 7
x558 9
.559 :
Id55: <
)55< =
;55= >
}66 
)66 
;66 
migrationBuilder88 
.88 
CreateTable88 (
(88( )
name99 
:99 
$str99 #
,99# $
columns:: 
::: 
table:: 
=>:: !
new::" %
{;; 
Id<< 
=<< 
table<< 
.<< 
Column<< %
<<<% &
Guid<<& *
><<* +
(<<+ ,
type<<, 0
:<<0 1
$str<<2 8
,<<8 9
nullable<<: B
:<<B C
false<<D I
)<<I J
,<<J K
Icon== 
=== 
table==  
.==  !
Column==! '
<==' (
string==( .
>==. /
(==/ 0
type==0 4
:==4 5
$str==6 <
,==< =
nullable==> F
:==F G
true==H L
)==L M
,==M N
Name>> 
=>> 
table>>  
.>>  !
Column>>! '
<>>' (
string>>( .
>>>. /
(>>/ 0
type>>0 4
:>>4 5
$str>>6 <
,>>< =
nullable>>> F
:>>F G
true>>H L
)>>L M
}?? 
,?? 
constraints@@ 
:@@ 
table@@ "
=>@@# %
{AA 
tableBB 
.BB 

PrimaryKeyBB $
(BB$ %
$strBB% 5
,BB5 6
xBB7 8
=>BB9 ;
xBB< =
.BB= >
IdBB> @
)BB@ A
;BBA B
}CC 
)CC 
;CC 
migrationBuilderEE 
.EE 
CreateTableEE (
(EE( )
nameFF 
:FF 
$strFF 
,FF 
columnsGG 
:GG 
tableGG 
=>GG !
newGG" %
{HH 
IdII 
=II 
tableII 
.II 
ColumnII %
<II% &
GuidII& *
>II* +
(II+ ,
typeII, 0
:II0 1
$strII2 8
,II8 9
nullableII: B
:IIB C
falseIID I
)III J
,IIJ K!
ShipTypeDiscriminatorJJ )
=JJ* +
tableJJ, 1
.JJ1 2
ColumnJJ2 8
<JJ8 9
stringJJ9 ?
>JJ? @
(JJ@ A
typeJJA E
:JJE F
$strJJG M
,JJM N
nullableJJO W
:JJW X
falseJJY ^
)JJ^ _
,JJ_ `
NameKK 
=KK 
tableKK  
.KK  !
ColumnKK! '
<KK' (
stringKK( .
>KK. /
(KK/ 0
typeKK0 4
:KK4 5
$strKK6 <
,KK< =
nullableKK> F
:KKF G
trueKKH L
)KKL M
,KKM N
DescriptionLL 
=LL  !
tableLL" '
.LL' (
ColumnLL( .
<LL. /
stringLL/ 5
>LL5 6
(LL6 7
typeLL7 ;
:LL; <
$strLL= C
,LLC D
nullableLLE M
:LLM N
trueLLO S
)LLS T
}MM 
,MM 
constraintsNN 
:NN 
tableNN "
=>NN# %
{OO 
tablePP 
.PP 

PrimaryKeyPP $
(PP$ %
$strPP% .
,PP. /
xPP0 1
=>PP2 4
xPP5 6
.PP6 7
IdPP7 9
)PP9 :
;PP: ;
}QQ 
)QQ 
;QQ 
migrationBuilderSS 
.SS 
CreateTableSS (
(SS( )
nameTT 
:TT 
$strTT #
,TT# $
columnsUU 
:UU 
tableUU 
=>UU !
newUU" %
{VV 
IdWW 
=WW 
tableWW 
.WW 
ColumnWW %
<WW% &
stringWW& ,
>WW, -
(WW- .
typeWW. 2
:WW2 3
$strWW4 :
,WW: ;
nullableWW< D
:WWD E
falseWWF K
)WWK L
,WWL M
NameXX 
=XX 
tableXX  
.XX  !
ColumnXX! '
<XX' (
stringXX( .
>XX. /
(XX/ 0
typeXX0 4
:XX4 5
$strXX6 <
,XX< =
nullableXX> F
:XXF G
trueXXH L
)XXL M
,XXM N
SurnameYY 
=YY 
tableYY #
.YY# $
ColumnYY$ *
<YY* +
stringYY+ 1
>YY1 2
(YY2 3
typeYY3 7
:YY7 8
$strYY9 ?
,YY? @
nullableYYA I
:YYI J
trueYYK O
)YYO P
,YYP Q
AchievementIdZZ !
=ZZ" #
tableZZ$ )
.ZZ) *
ColumnZZ* 0
<ZZ0 1
GuidZZ1 5
>ZZ5 6
(ZZ6 7
typeZZ7 ;
:ZZ; <
$strZZ= C
,ZZC D
nullableZZE M
:ZZM N
trueZZO S
)ZZS T
,ZZT U
UserName[[ 
=[[ 
table[[ $
.[[$ %
Column[[% +
<[[+ ,
string[[, 2
>[[2 3
([[3 4
type[[4 8
:[[8 9
$str[[: R
,[[R S
	maxLength[[T ]
:[[] ^
$num[[_ b
,[[b c
nullable[[d l
:[[l m
true[[n r
)[[r s
,[[s t
NormalizedUserName\\ &
=\\' (
table\\) .
.\\. /
Column\\/ 5
<\\5 6
string\\6 <
>\\< =
(\\= >
type\\> B
:\\B C
$str\\D \
,\\\ ]
	maxLength\\^ g
:\\g h
$num\\i l
,\\l m
nullable\\n v
:\\v w
true\\x |
)\\| }
,\\} ~
Email]] 
=]] 
table]] !
.]]! "
Column]]" (
<]]( )
string]]) /
>]]/ 0
(]]0 1
type]]1 5
:]]5 6
$str]]7 O
,]]O P
	maxLength]]Q Z
:]]Z [
$num]]\ _
,]]_ `
nullable]]a i
:]]i j
true]]k o
)]]o p
,]]p q
NormalizedEmail^^ #
=^^$ %
table^^& +
.^^+ ,
Column^^, 2
<^^2 3
string^^3 9
>^^9 :
(^^: ;
type^^; ?
:^^? @
$str^^A Y
,^^Y Z
	maxLength^^[ d
:^^d e
$num^^f i
,^^i j
nullable^^k s
:^^s t
true^^u y
)^^y z
,^^z {
EmailConfirmed__ "
=__# $
table__% *
.__* +
Column__+ 1
<__1 2
bool__2 6
>__6 7
(__7 8
type__8 <
:__< =
$str__> G
,__G H
nullable__I Q
:__Q R
false__S X
)__X Y
,__Y Z
PasswordHash``  
=``! "
table``# (
.``( )
Column``) /
<``/ 0
string``0 6
>``6 7
(``7 8
type``8 <
:``< =
$str``> D
,``D E
nullable``F N
:``N O
true``P T
)``T U
,``U V
SecurityStampaa !
=aa" #
tableaa$ )
.aa) *
Columnaa* 0
<aa0 1
stringaa1 7
>aa7 8
(aa8 9
typeaa9 =
:aa= >
$straa? E
,aaE F
nullableaaG O
:aaO P
trueaaQ U
)aaU V
,aaV W
ConcurrencyStampbb $
=bb% &
tablebb' ,
.bb, -
Columnbb- 3
<bb3 4
stringbb4 :
>bb: ;
(bb; <
typebb< @
:bb@ A
$strbbB H
,bbH I
nullablebbJ R
:bbR S
truebbT X
)bbX Y
,bbY Z
PhoneNumbercc 
=cc  !
tablecc" '
.cc' (
Columncc( .
<cc. /
stringcc/ 5
>cc5 6
(cc6 7
typecc7 ;
:cc; <
$strcc= C
,ccC D
nullableccE M
:ccM N
trueccO S
)ccS T
,ccT U 
PhoneNumberConfirmeddd (
=dd) *
tabledd+ 0
.dd0 1
Columndd1 7
<dd7 8
booldd8 <
>dd< =
(dd= >
typedd> B
:ddB C
$strddD M
,ddM N
nullableddO W
:ddW X
falseddY ^
)dd^ _
,dd_ `
TwoFactorEnabledee $
=ee% &
tableee' ,
.ee, -
Columnee- 3
<ee3 4
boolee4 8
>ee8 9
(ee9 :
typeee: >
:ee> ?
$stree@ I
,eeI J
nullableeeK S
:eeS T
falseeeU Z
)eeZ [
,ee[ \

LockoutEndff 
=ff  
tableff! &
.ff& '
Columnff' -
<ff- .
DateTimeOffsetff. <
>ff< =
(ff= >
typeff> B
:ffB C
$strffD ^
,ff^ _
nullableff` h
:ffh i
trueffj n
)ffn o
,ffo p
LockoutEnabledgg "
=gg# $
tablegg% *
.gg* +
Columngg+ 1
<gg1 2
boolgg2 6
>gg6 7
(gg7 8
typegg8 <
:gg< =
$strgg> G
,ggG H
nullableggI Q
:ggQ R
falseggS X
)ggX Y
,ggY Z
AccessFailedCounthh %
=hh& '
tablehh( -
.hh- .
Columnhh. 4
<hh4 5
inthh5 8
>hh8 9
(hh9 :
typehh: >
:hh> ?
$strhh@ I
,hhI J
nullablehhK S
:hhS T
falsehhU Z
)hhZ [
}ii 
,ii 
constraintsjj 
:jj 
tablejj "
=>jj# %
{kk 
tablell 
.ll 

PrimaryKeyll $
(ll$ %
$strll% 5
,ll5 6
xll7 8
=>ll9 ;
xll< =
.ll= >
Idll> @
)ll@ A
;llA B
tablemm 
.mm 

ForeignKeymm $
(mm$ %
namenn 
:nn 
$strnn I
,nnI J
columnoo 
:oo 
xoo  !
=>oo" $
xoo% &
.oo& '
AchievementIdoo' 4
,oo4 5
principalTablepp &
:pp& '
$strpp( 6
,pp6 7
principalColumnqq '
:qq' (
$strqq) -
)qq- .
;qq. /
}rr 
)rr 
;rr 
migrationBuildertt 
.tt 
CreateTablett (
(tt( )
nameuu 
:uu 
$struu (
,uu( )
columnsvv 
:vv 
tablevv 
=>vv !
newvv" %
{ww 
Idxx 
=xx 
tablexx 
.xx 
Columnxx %
<xx% &
intxx& )
>xx) *
(xx* +
typexx+ /
:xx/ 0
$strxx1 :
,xx: ;
nullablexx< D
:xxD E
falsexxF K
)xxK L
.yy 

Annotationyy #
(yy# $
$stryy$ D
,yyD E)
NpgsqlValueGenerationStrategyyyF c
.yyc d#
IdentityByDefaultColumnyyd {
)yy{ |
,yy| }
RoleIdzz 
=zz 
tablezz "
.zz" #
Columnzz# )
<zz) *
stringzz* 0
>zz0 1
(zz1 2
typezz2 6
:zz6 7
$strzz8 >
,zz> ?
nullablezz@ H
:zzH I
falsezzJ O
)zzO P
,zzP Q
	ClaimType{{ 
={{ 
table{{  %
.{{% &
Column{{& ,
<{{, -
string{{- 3
>{{3 4
({{4 5
type{{5 9
:{{9 :
$str{{; A
,{{A B
nullable{{C K
:{{K L
true{{M Q
){{Q R
,{{R S

ClaimValue|| 
=||  
table||! &
.||& '
Column||' -
<||- .
string||. 4
>||4 5
(||5 6
type||6 :
:||: ;
$str||< B
,||B C
nullable||D L
:||L M
true||N R
)||R S
}}} 
,}} 
constraints~~ 
:~~ 
table~~ "
=>~~# %
{ 
table
ÄÄ 
.
ÄÄ 

PrimaryKey
ÄÄ $
(
ÄÄ$ %
$str
ÄÄ% :
,
ÄÄ: ;
x
ÄÄ< =
=>
ÄÄ> @
x
ÄÄA B
.
ÄÄB C
Id
ÄÄC E
)
ÄÄE F
;
ÄÄF G
table
ÅÅ 
.
ÅÅ 

ForeignKey
ÅÅ $
(
ÅÅ$ %
name
ÇÇ 
:
ÇÇ 
$str
ÇÇ F
,
ÇÇF G
column
ÉÉ 
:
ÉÉ 
x
ÉÉ  !
=>
ÉÉ" $
x
ÉÉ% &
.
ÉÉ& '
RoleId
ÉÉ' -
,
ÉÉ- .
principalTable
ÑÑ &
:
ÑÑ& '
$str
ÑÑ( 5
,
ÑÑ5 6
principalColumn
ÖÖ '
:
ÖÖ' (
$str
ÖÖ) -
,
ÖÖ- .
onDelete
ÜÜ  
:
ÜÜ  !
ReferentialAction
ÜÜ" 3
.
ÜÜ3 4
Cascade
ÜÜ4 ;
)
ÜÜ; <
;
ÜÜ< =
}
áá 
)
áá 
;
áá 
migrationBuilder
ââ 
.
ââ 
CreateTable
ââ (
(
ââ( )
name
ää 
:
ää 
$str
ää +
,
ää+ ,
columns
ãã 
:
ãã 
table
ãã 
=>
ãã !
new
ãã" %
{
åå 
Id
çç 
=
çç 
table
çç 
.
çç 
Column
çç %
<
çç% &
Guid
çç& *
>
çç* +
(
çç+ ,
type
çç, 0
:
çç0 1
$str
çç2 8
,
çç8 9
nullable
çç: B
:
ççB C
false
ççD I
)
ççI J
,
ççJ K
GameSessionId
éé !
=
éé" #
table
éé$ )
.
éé) *
Column
éé* 0
<
éé0 1
Guid
éé1 5
>
éé5 6
(
éé6 7
type
éé7 ;
:
éé; <
$str
éé= C
,
ééC D
nullable
ééE M
:
ééM N
false
ééO T
)
ééT U
,
ééU V
GridSize
èè 
=
èè 
table
èè $
.
èè$ %
Column
èè% +
<
èè+ ,
string
èè, 2
>
èè2 3
(
èè3 4
type
èè4 8
:
èè8 9
$str
èè: @
,
èè@ A
nullable
èèB J
:
èèJ K
true
èèL P
)
èèP Q
,
èèQ R
GameType
êê 
=
êê 
table
êê $
.
êê$ %
Column
êê% +
<
êê+ ,
int
êê, /
>
êê/ 0
(
êê0 1
type
êê1 5
:
êê5 6
$str
êê7 @
,
êê@ A
nullable
êêB J
:
êêJ K
false
êêL Q
)
êêQ R
,
êêR S

RoundCount
ëë 
=
ëë  
table
ëë! &
.
ëë& '
Column
ëë' -
<
ëë- .
int
ëë. 1
>
ëë1 2
(
ëë2 3
type
ëë3 7
:
ëë7 8
$str
ëë9 B
,
ëëB C
nullable
ëëD L
:
ëëL M
false
ëëN S
)
ëëS T
,
ëëT U%
DestroyedShipPercentage
íí +
=
íí, -
table
íí. 3
.
íí3 4
Column
íí4 :
<
íí: ;
int
íí; >
>
íí> ?
(
íí? @
type
íí@ D
:
ííD E
$str
ííF O
,
ííO P
nullable
ííQ Y
:
ííY Z
false
íí[ `
)
íí` a
}
ìì 
,
ìì 
constraints
îî 
:
îî 
table
îî "
=>
îî# %
{
ïï 
table
ññ 
.
ññ 

PrimaryKey
ññ $
(
ññ$ %
$str
ññ% =
,
ññ= >
x
ññ? @
=>
ññA C
x
ññD E
.
ññE F
Id
ññF H
)
ññH I
;
ññI J
table
óó 
.
óó 

ForeignKey
óó $
(
óó$ %
name
òò 
:
òò 
$str
òò P
,
òòP Q
column
ôô 
:
ôô 
x
ôô  !
=>
ôô" $
x
ôô% &
.
ôô& '
GameSessionId
ôô' 4
,
ôô4 5
principalTable
öö &
:
öö& '
$str
öö( 5
,
öö5 6
principalColumn
õõ '
:
õõ' (
$str
õõ) -
,
õõ- .
onDelete
úú  
:
úú  !
ReferentialAction
úú" 3
.
úú3 4
Cascade
úú4 ;
)
úú; <
;
úú< =
}
ùù 
)
ùù 
;
ùù 
migrationBuilder
üü 
.
üü 
CreateTable
üü (
(
üü( )
name
†† 
:
†† 
$str
†† (
,
††( )
columns
°° 
:
°° 
table
°° 
=>
°° !
new
°°" %
{
¢¢ 
Id
££ 
=
££ 
table
££ 
.
££ 
Column
££ %
<
££% &
int
££& )
>
££) *
(
££* +
type
££+ /
:
££/ 0
$str
££1 :
,
££: ;
nullable
££< D
:
££D E
false
££F K
)
££K L
.
§§ 

Annotation
§§ #
(
§§# $
$str
§§$ D
,
§§D E+
NpgsqlValueGenerationStrategy
§§F c
.
§§c d%
IdentityByDefaultColumn
§§d {
)
§§{ |
,
§§| }
UserId
•• 
=
•• 
table
•• "
.
••" #
Column
••# )
<
••) *
string
••* 0
>
••0 1
(
••1 2
type
••2 6
:
••6 7
$str
••8 >
,
••> ?
nullable
••@ H
:
••H I
false
••J O
)
••O P
,
••P Q
	ClaimType
¶¶ 
=
¶¶ 
table
¶¶  %
.
¶¶% &
Column
¶¶& ,
<
¶¶, -
string
¶¶- 3
>
¶¶3 4
(
¶¶4 5
type
¶¶5 9
:
¶¶9 :
$str
¶¶; A
,
¶¶A B
nullable
¶¶C K
:
¶¶K L
true
¶¶M Q
)
¶¶Q R
,
¶¶R S

ClaimValue
ßß 
=
ßß  
table
ßß! &
.
ßß& '
Column
ßß' -
<
ßß- .
string
ßß. 4
>
ßß4 5
(
ßß5 6
type
ßß6 :
:
ßß: ;
$str
ßß< B
,
ßßB C
nullable
ßßD L
:
ßßL M
true
ßßN R
)
ßßR S
}
®® 
,
®® 
constraints
©© 
:
©© 
table
©© "
=>
©©# %
{
™™ 
table
´´ 
.
´´ 

PrimaryKey
´´ $
(
´´$ %
$str
´´% :
,
´´: ;
x
´´< =
=>
´´> @
x
´´A B
.
´´B C
Id
´´C E
)
´´E F
;
´´F G
table
¨¨ 
.
¨¨ 

ForeignKey
¨¨ $
(
¨¨$ %
name
≠≠ 
:
≠≠ 
$str
≠≠ F
,
≠≠F G
column
ÆÆ 
:
ÆÆ 
x
ÆÆ  !
=>
ÆÆ" $
x
ÆÆ% &
.
ÆÆ& '
UserId
ÆÆ' -
,
ÆÆ- .
principalTable
ØØ &
:
ØØ& '
$str
ØØ( 5
,
ØØ5 6
principalColumn
∞∞ '
:
∞∞' (
$str
∞∞) -
,
∞∞- .
onDelete
±±  
:
±±  !
ReferentialAction
±±" 3
.
±±3 4
Cascade
±±4 ;
)
±±; <
;
±±< =
}
≤≤ 
)
≤≤ 
;
≤≤ 
migrationBuilder
¥¥ 
.
¥¥ 
CreateTable
¥¥ (
(
¥¥( )
name
µµ 
:
µµ 
$str
µµ (
,
µµ( )
columns
∂∂ 
:
∂∂ 
table
∂∂ 
=>
∂∂ !
new
∂∂" %
{
∑∑ 
LoginProvider
∏∏ !
=
∏∏" #
table
∏∏$ )
.
∏∏) *
Column
∏∏* 0
<
∏∏0 1
string
∏∏1 7
>
∏∏7 8
(
∏∏8 9
type
∏∏9 =
:
∏∏= >
$str
∏∏? W
,
∏∏W X
	maxLength
∏∏Y b
:
∏∏b c
$num
∏∏d g
,
∏∏g h
nullable
∏∏i q
:
∏∏q r
false
∏∏s x
)
∏∏x y
,
∏∏y z
ProviderKey
ππ 
=
ππ  !
table
ππ" '
.
ππ' (
Column
ππ( .
<
ππ. /
string
ππ/ 5
>
ππ5 6
(
ππ6 7
type
ππ7 ;
:
ππ; <
$str
ππ= U
,
ππU V
	maxLength
ππW `
:
ππ` a
$num
ππb e
,
ππe f
nullable
ππg o
:
ππo p
false
ππq v
)
ππv w
,
ππw x!
ProviderDisplayName
∫∫ '
=
∫∫( )
table
∫∫* /
.
∫∫/ 0
Column
∫∫0 6
<
∫∫6 7
string
∫∫7 =
>
∫∫= >
(
∫∫> ?
type
∫∫? C
:
∫∫C D
$str
∫∫E K
,
∫∫K L
nullable
∫∫M U
:
∫∫U V
true
∫∫W [
)
∫∫[ \
,
∫∫\ ]
UserId
ªª 
=
ªª 
table
ªª "
.
ªª" #
Column
ªª# )
<
ªª) *
string
ªª* 0
>
ªª0 1
(
ªª1 2
type
ªª2 6
:
ªª6 7
$str
ªª8 >
,
ªª> ?
nullable
ªª@ H
:
ªªH I
false
ªªJ O
)
ªªO P
}
ºº 
,
ºº 
constraints
ΩΩ 
:
ΩΩ 
table
ΩΩ "
=>
ΩΩ# %
{
ææ 
table
øø 
.
øø 

PrimaryKey
øø $
(
øø$ %
$str
øø% :
,
øø: ;
x
øø< =
=>
øø> @
new
øøA D
{
øøE F
x
øøG H
.
øøH I
LoginProvider
øøI V
,
øøV W
x
øøX Y
.
øøY Z
ProviderKey
øøZ e
}
øøf g
)
øøg h
;
øøh i
table
¿¿ 
.
¿¿ 

ForeignKey
¿¿ $
(
¿¿$ %
name
¡¡ 
:
¡¡ 
$str
¡¡ F
,
¡¡F G
column
¬¬ 
:
¬¬ 
x
¬¬  !
=>
¬¬" $
x
¬¬% &
.
¬¬& '
UserId
¬¬' -
,
¬¬- .
principalTable
√√ &
:
√√& '
$str
√√( 5
,
√√5 6
principalColumn
ƒƒ '
:
ƒƒ' (
$str
ƒƒ) -
,
ƒƒ- .
onDelete
≈≈  
:
≈≈  !
ReferentialAction
≈≈" 3
.
≈≈3 4
Cascade
≈≈4 ;
)
≈≈; <
;
≈≈< =
}
∆∆ 
)
∆∆ 
;
∆∆ 
migrationBuilder
»» 
.
»» 
CreateTable
»» (
(
»»( )
name
…… 
:
…… 
$str
…… '
,
……' (
columns
   
:
   
table
   
=>
   !
new
  " %
{
ÀÀ 
UserId
ÃÃ 
=
ÃÃ 
table
ÃÃ "
.
ÃÃ" #
Column
ÃÃ# )
<
ÃÃ) *
string
ÃÃ* 0
>
ÃÃ0 1
(
ÃÃ1 2
type
ÃÃ2 6
:
ÃÃ6 7
$str
ÃÃ8 >
,
ÃÃ> ?
nullable
ÃÃ@ H
:
ÃÃH I
false
ÃÃJ O
)
ÃÃO P
,
ÃÃP Q
RoleId
ÕÕ 
=
ÕÕ 
table
ÕÕ "
.
ÕÕ" #
Column
ÕÕ# )
<
ÕÕ) *
string
ÕÕ* 0
>
ÕÕ0 1
(
ÕÕ1 2
type
ÕÕ2 6
:
ÕÕ6 7
$str
ÕÕ8 >
,
ÕÕ> ?
nullable
ÕÕ@ H
:
ÕÕH I
false
ÕÕJ O
)
ÕÕO P
}
ŒŒ 
,
ŒŒ 
constraints
œœ 
:
œœ 
table
œœ "
=>
œœ# %
{
–– 
table
—— 
.
—— 

PrimaryKey
—— $
(
——$ %
$str
——% 9
,
——9 :
x
——; <
=>
——= ?
new
——@ C
{
——D E
x
——F G
.
——G H
UserId
——H N
,
——N O
x
——P Q
.
——Q R
RoleId
——R X
}
——Y Z
)
——Z [
;
——[ \
table
““ 
.
““ 

ForeignKey
““ $
(
““$ %
name
”” 
:
”” 
$str
”” E
,
””E F
column
‘‘ 
:
‘‘ 
x
‘‘  !
=>
‘‘" $
x
‘‘% &
.
‘‘& '
RoleId
‘‘' -
,
‘‘- .
principalTable
’’ &
:
’’& '
$str
’’( 5
,
’’5 6
principalColumn
÷÷ '
:
÷÷' (
$str
÷÷) -
,
÷÷- .
onDelete
◊◊  
:
◊◊  !
ReferentialAction
◊◊" 3
.
◊◊3 4
Cascade
◊◊4 ;
)
◊◊; <
;
◊◊< =
table
ÿÿ 
.
ÿÿ 

ForeignKey
ÿÿ $
(
ÿÿ$ %
name
ŸŸ 
:
ŸŸ 
$str
ŸŸ E
,
ŸŸE F
column
⁄⁄ 
:
⁄⁄ 
x
⁄⁄  !
=>
⁄⁄" $
x
⁄⁄% &
.
⁄⁄& '
UserId
⁄⁄' -
,
⁄⁄- .
principalTable
€€ &
:
€€& '
$str
€€( 5
,
€€5 6
principalColumn
‹‹ '
:
‹‹' (
$str
‹‹) -
,
‹‹- .
onDelete
››  
:
››  !
ReferentialAction
››" 3
.
››3 4
Cascade
››4 ;
)
››; <
;
››< =
}
ﬁﬁ 
)
ﬁﬁ 
;
ﬁﬁ 
migrationBuilder
‡‡ 
.
‡‡ 
CreateTable
‡‡ (
(
‡‡( )
name
·· 
:
·· 
$str
·· (
,
··( )
columns
‚‚ 
:
‚‚ 
table
‚‚ 
=>
‚‚ !
new
‚‚" %
{
„„ 
UserId
‰‰ 
=
‰‰ 
table
‰‰ "
.
‰‰" #
Column
‰‰# )
<
‰‰) *
string
‰‰* 0
>
‰‰0 1
(
‰‰1 2
type
‰‰2 6
:
‰‰6 7
$str
‰‰8 >
,
‰‰> ?
nullable
‰‰@ H
:
‰‰H I
false
‰‰J O
)
‰‰O P
,
‰‰P Q
LoginProvider
ÂÂ !
=
ÂÂ" #
table
ÂÂ$ )
.
ÂÂ) *
Column
ÂÂ* 0
<
ÂÂ0 1
string
ÂÂ1 7
>
ÂÂ7 8
(
ÂÂ8 9
type
ÂÂ9 =
:
ÂÂ= >
$str
ÂÂ? W
,
ÂÂW X
	maxLength
ÂÂY b
:
ÂÂb c
$num
ÂÂd g
,
ÂÂg h
nullable
ÂÂi q
:
ÂÂq r
false
ÂÂs x
)
ÂÂx y
,
ÂÂy z
Name
ÊÊ 
=
ÊÊ 
table
ÊÊ  
.
ÊÊ  !
Column
ÊÊ! '
<
ÊÊ' (
string
ÊÊ( .
>
ÊÊ. /
(
ÊÊ/ 0
type
ÊÊ0 4
:
ÊÊ4 5
$str
ÊÊ6 N
,
ÊÊN O
	maxLength
ÊÊP Y
:
ÊÊY Z
$num
ÊÊ[ ^
,
ÊÊ^ _
nullable
ÊÊ` h
:
ÊÊh i
false
ÊÊj o
)
ÊÊo p
,
ÊÊp q
Value
ÁÁ 
=
ÁÁ 
table
ÁÁ !
.
ÁÁ! "
Column
ÁÁ" (
<
ÁÁ( )
string
ÁÁ) /
>
ÁÁ/ 0
(
ÁÁ0 1
type
ÁÁ1 5
:
ÁÁ5 6
$str
ÁÁ7 =
,
ÁÁ= >
nullable
ÁÁ? G
:
ÁÁG H
true
ÁÁI M
)
ÁÁM N
}
ËË 
,
ËË 
constraints
ÈÈ 
:
ÈÈ 
table
ÈÈ "
=>
ÈÈ# %
{
ÍÍ 
table
ÎÎ 
.
ÎÎ 

PrimaryKey
ÎÎ $
(
ÎÎ$ %
$str
ÎÎ% :
,
ÎÎ: ;
x
ÎÎ< =
=>
ÎÎ> @
new
ÎÎA D
{
ÎÎE F
x
ÎÎG H
.
ÎÎH I
UserId
ÎÎI O
,
ÎÎO P
x
ÎÎQ R
.
ÎÎR S
LoginProvider
ÎÎS `
,
ÎÎ` a
x
ÎÎb c
.
ÎÎc d
Name
ÎÎd h
}
ÎÎi j
)
ÎÎj k
;
ÎÎk l
table
ÏÏ 
.
ÏÏ 

ForeignKey
ÏÏ $
(
ÏÏ$ %
name
ÌÌ 
:
ÌÌ 
$str
ÌÌ F
,
ÌÌF G
column
ÓÓ 
:
ÓÓ 
x
ÓÓ  !
=>
ÓÓ" $
x
ÓÓ% &
.
ÓÓ& '
UserId
ÓÓ' -
,
ÓÓ- .
principalTable
ÔÔ &
:
ÔÔ& '
$str
ÔÔ( 5
,
ÔÔ5 6
principalColumn
 '
:
' (
$str
) -
,
- .
onDelete
ÒÒ  
:
ÒÒ  !
ReferentialAction
ÒÒ" 3
.
ÒÒ3 4
Cascade
ÒÒ4 ;
)
ÒÒ; <
;
ÒÒ< =
}
ÚÚ 
)
ÚÚ 
;
ÚÚ 
migrationBuilder
ÙÙ 
.
ÙÙ 
CreateTable
ÙÙ (
(
ÙÙ( )
name
ıı 
:
ıı 
$str
ıı 
,
ıı 
columns
ˆˆ 
:
ˆˆ 
table
ˆˆ 
=>
ˆˆ !
new
ˆˆ" %
{
˜˜ 
Id
¯¯ 
=
¯¯ 
table
¯¯ 
.
¯¯ 
Column
¯¯ %
<
¯¯% &
Guid
¯¯& *
>
¯¯* +
(
¯¯+ ,
type
¯¯, 0
:
¯¯0 1
$str
¯¯2 8
,
¯¯8 9
nullable
¯¯: B
:
¯¯B C
false
¯¯D I
)
¯¯I J
,
¯¯J K
GameSessionId
˘˘ !
=
˘˘" #
table
˘˘$ )
.
˘˘) *
Column
˘˘* 0
<
˘˘0 1
Guid
˘˘1 5
>
˘˘5 6
(
˘˘6 7
type
˘˘7 ;
:
˘˘; <
$str
˘˘= C
,
˘˘C D
nullable
˘˘E M
:
˘˘M N
false
˘˘O T
)
˘˘T U
,
˘˘U V
IsHost
˙˙ 
=
˙˙ 
table
˙˙ "
.
˙˙" #
Column
˙˙# )
<
˙˙) *
bool
˙˙* .
>
˙˙. /
(
˙˙/ 0
type
˙˙0 4
:
˙˙4 5
$str
˙˙6 ?
,
˙˙? @
nullable
˙˙A I
:
˙˙I J
false
˙˙K P
)
˙˙P Q
,
˙˙Q R
UserId
˚˚ 
=
˚˚ 
table
˚˚ "
.
˚˚" #
Column
˚˚# )
<
˚˚) *
string
˚˚* 0
>
˚˚0 1
(
˚˚1 2
type
˚˚2 6
:
˚˚6 7
$str
˚˚8 >
,
˚˚> ?
nullable
˚˚@ H
:
˚˚H I
true
˚˚J N
)
˚˚N O
}
¸¸ 
,
¸¸ 
constraints
˝˝ 
:
˝˝ 
table
˝˝ "
=>
˝˝# %
{
˛˛ 
table
ˇˇ 
.
ˇˇ 

PrimaryKey
ˇˇ $
(
ˇˇ$ %
$str
ˇˇ% 0
,
ˇˇ0 1
x
ˇˇ2 3
=>
ˇˇ4 6
x
ˇˇ7 8
.
ˇˇ8 9
Id
ˇˇ9 ;
)
ˇˇ; <
;
ˇˇ< =
table
ÄÄ 
.
ÄÄ 

ForeignKey
ÄÄ $
(
ÄÄ$ %
name
ÅÅ 
:
ÅÅ 
$str
ÅÅ <
,
ÅÅ< =
column
ÇÇ 
:
ÇÇ 
x
ÇÇ  !
=>
ÇÇ" $
x
ÇÇ% &
.
ÇÇ& '
UserId
ÇÇ' -
,
ÇÇ- .
principalTable
ÉÉ &
:
ÉÉ& '
$str
ÉÉ( 5
,
ÉÉ5 6
principalColumn
ÑÑ '
:
ÑÑ' (
$str
ÑÑ) -
)
ÑÑ- .
;
ÑÑ. /
table
ÖÖ 
.
ÖÖ 

ForeignKey
ÖÖ $
(
ÖÖ$ %
name
ÜÜ 
:
ÜÜ 
$str
ÜÜ C
,
ÜÜC D
column
áá 
:
áá 
x
áá  !
=>
áá" $
x
áá% &
.
áá& '
GameSessionId
áá' 4
,
áá4 5
principalTable
àà &
:
àà& '
$str
àà( 5
,
àà5 6
principalColumn
ââ '
:
ââ' (
$str
ââ) -
,
ââ- .
onDelete
ää  
:
ää  !
ReferentialAction
ää" 3
.
ää3 4
Cascade
ää4 ;
)
ää; <
;
ää< =
}
ãã 
)
ãã 
;
ãã 
migrationBuilder
çç 
.
çç 
CreateTable
çç (
(
çç( )
name
éé 
:
éé 
$str
éé '
,
éé' (
columns
èè 
:
èè 
table
èè 
=>
èè !
new
èè" %
{
êê 
Id
ëë 
=
ëë 
table
ëë 
.
ëë 
Column
ëë %
<
ëë% &
Guid
ëë& *
>
ëë* +
(
ëë+ ,
type
ëë, 0
:
ëë0 1
$str
ëë2 8
,
ëë8 9
nullable
ëë: B
:
ëëB C
false
ëëD I
)
ëëI J
,
ëëJ K
AchievementId
íí !
=
íí" #
table
íí$ )
.
íí) *
Column
íí* 0
<
íí0 1
Guid
íí1 5
>
íí5 6
(
íí6 7
type
íí7 ;
:
íí; <
$str
íí= C
,
ííC D
nullable
ííE M
:
ííM N
false
ííO T
)
ííT U
,
ííU V
UserId
ìì 
=
ìì 
table
ìì "
.
ìì" #
Column
ìì# )
<
ìì) *
string
ìì* 0
>
ìì0 1
(
ìì1 2
type
ìì2 6
:
ìì6 7
$str
ìì8 >
,
ìì> ?
nullable
ìì@ H
:
ììH I
true
ììJ N
)
ììN O
}
îî 
,
îî 
constraints
ïï 
:
ïï 
table
ïï "
=>
ïï# %
{
ññ 
table
óó 
.
óó 

PrimaryKey
óó $
(
óó$ %
$str
óó% 9
,
óó9 :
x
óó; <
=>
óó= ?
x
óó@ A
.
óóA B
Id
óóB D
)
óóD E
;
óóE F
table
òò 
.
òò 

ForeignKey
òò $
(
òò$ %
name
ôô 
:
ôô 
$str
ôô M
,
ôôM N
column
öö 
:
öö 
x
öö  !
=>
öö" $
x
öö% &
.
öö& '
AchievementId
öö' 4
,
öö4 5
principalTable
õõ &
:
õõ& '
$str
õõ( 6
,
õõ6 7
principalColumn
úú '
:
úú' (
$str
úú) -
,
úú- .
onDelete
ùù  
:
ùù  !
ReferentialAction
ùù" 3
.
ùù3 4
Cascade
ùù4 ;
)
ùù; <
;
ùù< =
table
ûû 
.
ûû 

ForeignKey
ûû $
(
ûû$ %
name
üü 
:
üü 
$str
üü E
,
üüE F
column
†† 
:
†† 
x
††  !
=>
††" $
x
††% &
.
††& '
UserId
††' -
,
††- .
principalTable
°° &
:
°°& '
$str
°°( 5
,
°°5 6
principalColumn
¢¢ '
:
¢¢' (
$str
¢¢) -
)
¢¢- .
;
¢¢. /
}
££ 
)
££ 
;
££ 
migrationBuilder
•• 
.
•• 
CreateTable
•• (
(
••( )
name
¶¶ 
:
¶¶ 
$str
¶¶ $
,
¶¶$ %
columns
ßß 
:
ßß 
table
ßß 
=>
ßß !
new
ßß" %
{
®® 
Id
©© 
=
©© 
table
©© 
.
©© 
Column
©© %
<
©©% &
Guid
©©& *
>
©©* +
(
©©+ ,
type
©©, 0
:
©©0 1
$str
©©2 8
,
©©8 9
nullable
©©: B
:
©©B C
false
©©D I
)
©©I J
,
©©J K
Name
™™ 
=
™™ 
table
™™  
.
™™  !
Column
™™! '
<
™™' (
string
™™( .
>
™™. /
(
™™/ 0
type
™™0 4
:
™™4 5
$str
™™6 <
,
™™< =
nullable
™™> F
:
™™F G
true
™™H L
)
™™L M
,
™™M N
Description
´´ 
=
´´  !
table
´´" '
.
´´' (
Column
´´( .
<
´´. /
string
´´/ 5
>
´´5 6
(
´´6 7
type
´´7 ;
:
´´; <
$str
´´= C
,
´´C D
nullable
´´E M
:
´´M N
true
´´O S
)
´´S T
,
´´T U
UserId
¨¨ 
=
¨¨ 
table
¨¨ "
.
¨¨" #
Column
¨¨# )
<
¨¨) *
string
¨¨* 0
>
¨¨0 1
(
¨¨1 2
type
¨¨2 6
:
¨¨6 7
$str
¨¨8 >
,
¨¨> ?
nullable
¨¨@ H
:
¨¨H I
true
¨¨J N
)
¨¨N O
,
¨¨O P
ShipId
≠≠ 
=
≠≠ 
table
≠≠ "
.
≠≠" #
Column
≠≠# )
<
≠≠) *
Guid
≠≠* .
>
≠≠. /
(
≠≠/ 0
type
≠≠0 4
:
≠≠4 5
$str
≠≠6 <
,
≠≠< =
nullable
≠≠> F
:
≠≠F G
true
≠≠H L
)
≠≠L M
}
ÆÆ 
,
ÆÆ 
constraints
ØØ 
:
ØØ 
table
ØØ "
=>
ØØ# %
{
∞∞ 
table
±± 
.
±± 

PrimaryKey
±± $
(
±±$ %
$str
±±% 6
,
±±6 7
x
±±8 9
=>
±±: <
x
±±= >
.
±±> ?
Id
±±? A
)
±±A B
;
±±B C
table
≤≤ 
.
≤≤ 

ForeignKey
≤≤ $
(
≤≤$ %
name
≥≥ 
:
≥≥ 
$str
≥≥ B
,
≥≥B C
column
¥¥ 
:
¥¥ 
x
¥¥  !
=>
¥¥" $
x
¥¥% &
.
¥¥& '
UserId
¥¥' -
,
¥¥- .
principalTable
µµ &
:
µµ& '
$str
µµ( 5
,
µµ5 6
principalColumn
∂∂ '
:
∂∂' (
$str
∂∂) -
)
∂∂- .
;
∂∂. /
table
∑∑ 
.
∑∑ 

ForeignKey
∑∑ $
(
∑∑$ %
name
∏∏ 
:
∏∏ 
$str
∏∏ ;
,
∏∏; <
column
ππ 
:
ππ 
x
ππ  !
=>
ππ" $
x
ππ% &
.
ππ& '
ShipId
ππ' -
,
ππ- .
principalTable
∫∫ &
:
∫∫& '
$str
∫∫( .
,
∫∫. /
principalColumn
ªª '
:
ªª' (
$str
ªª) -
)
ªª- .
;
ªª. /
}
ºº 
)
ºº 
;
ºº 
migrationBuilder
ææ 
.
ææ 
CreateTable
ææ (
(
ææ( )
name
øø 
:
øø 
$str
øø "
,
øø" #
columns
¿¿ 
:
¿¿ 
table
¿¿ 
=>
¿¿ !
new
¿¿" %
{
¡¡ 
Id
¬¬ 
=
¬¬ 
table
¬¬ 
.
¬¬ 
Column
¬¬ %
<
¬¬% &
Guid
¬¬& *
>
¬¬* +
(
¬¬+ ,
type
¬¬, 0
:
¬¬0 1
$str
¬¬2 8
,
¬¬8 9
nullable
¬¬: B
:
¬¬B C
false
¬¬D I
)
¬¬I J
,
¬¬J K
PlayerId
√√ 
=
√√ 
table
√√ $
.
√√$ %
Column
√√% +
<
√√+ ,
Guid
√√, 0
>
√√0 1
(
√√1 2
type
√√2 6
:
√√6 7
$str
√√8 >
,
√√> ?
nullable
√√@ H
:
√√H I
false
√√J O
)
√√O P
,
√√P Q
ShipId
ƒƒ 
=
ƒƒ 
table
ƒƒ "
.
ƒƒ" #
Column
ƒƒ# )
<
ƒƒ) *
Guid
ƒƒ* .
>
ƒƒ. /
(
ƒƒ/ 0
type
ƒƒ0 4
:
ƒƒ4 5
$str
ƒƒ6 <
,
ƒƒ< =
nullable
ƒƒ> F
:
ƒƒF G
false
ƒƒH M
)
ƒƒM N
}
≈≈ 
,
≈≈ 
constraints
∆∆ 
:
∆∆ 
table
∆∆ "
=>
∆∆# %
{
«« 
table
»» 
.
»» 

PrimaryKey
»» $
(
»»$ %
$str
»»% 4
,
»»4 5
x
»»6 7
=>
»»8 :
x
»»; <
.
»»< =
Id
»»= ?
)
»»? @
;
»»@ A
table
…… 
.
…… 

ForeignKey
…… $
(
……$ %
name
   
:
   
$str
   =
,
  = >
column
ÀÀ 
:
ÀÀ 
x
ÀÀ  !
=>
ÀÀ" $
x
ÀÀ% &
.
ÀÀ& '
PlayerId
ÀÀ' /
,
ÀÀ/ 0
principalTable
ÃÃ &
:
ÃÃ& '
$str
ÃÃ( 0
,
ÃÃ0 1
principalColumn
ÕÕ '
:
ÕÕ' (
$str
ÕÕ) -
,
ÕÕ- .
onDelete
ŒŒ  
:
ŒŒ  !
ReferentialAction
ŒŒ" 3
.
ŒŒ3 4
Cascade
ŒŒ4 ;
)
ŒŒ; <
;
ŒŒ< =
table
œœ 
.
œœ 

ForeignKey
œœ $
(
œœ$ %
name
–– 
:
–– 
$str
–– 9
,
––9 :
column
—— 
:
—— 
x
——  !
=>
——" $
x
——% &
.
——& '
ShipId
——' -
,
——- .
principalTable
““ &
:
““& '
$str
““( .
,
““. /
principalColumn
”” '
:
””' (
$str
””) -
,
””- .
onDelete
‘‘  
:
‘‘  !
ReferentialAction
‘‘" 3
.
‘‘3 4
Cascade
‘‘4 ;
)
‘‘; <
;
‘‘< =
}
’’ 
)
’’ 
;
’’ 
migrationBuilder
◊◊ 
.
◊◊ 
CreateTable
◊◊ (
(
◊◊( )
name
ÿÿ 
:
ÿÿ 
$str
ÿÿ  
,
ÿÿ  !
columns
ŸŸ 
:
ŸŸ 
table
ŸŸ 
=>
ŸŸ !
new
ŸŸ" %
{
⁄⁄ 
Id
€€ 
=
€€ 
table
€€ 
.
€€ 
Column
€€ %
<
€€% &
Guid
€€& *
>
€€* +
(
€€+ ,
type
€€, 0
:
€€0 1
$str
€€2 8
,
€€8 9
nullable
€€: B
:
€€B C
false
€€D I
)
€€I J
,
€€J K
XCoordinate
‹‹ 
=
‹‹  !
table
‹‹" '
.
‹‹' (
Column
‹‹( .
<
‹‹. /
int
‹‹/ 2
>
‹‹2 3
(
‹‹3 4
type
‹‹4 8
:
‹‹8 9
$str
‹‹: C
,
‹‹C D
nullable
‹‹E M
:
‹‹M N
false
‹‹O T
)
‹‹T U
,
‹‹U V
YCoordinate
›› 
=
››  !
table
››" '
.
››' (
Column
››( .
<
››. /
int
››/ 2
>
››2 3
(
››3 4
type
››4 8
:
››8 9
$str
››: C
,
››C D
nullable
››E M
:
››M N
false
››O T
)
››T U
,
››U V
IsDestroyed
ﬁﬁ 
=
ﬁﬁ  !
table
ﬁﬁ" '
.
ﬁﬁ' (
Column
ﬁﬁ( .
<
ﬁﬁ. /
bool
ﬁﬁ/ 3
>
ﬁﬁ3 4
(
ﬁﬁ4 5
type
ﬁﬁ5 9
:
ﬁﬁ9 :
$str
ﬁﬁ; D
,
ﬁﬁD E
nullable
ﬁﬁF N
:
ﬁﬁN O
false
ﬁﬁP U
)
ﬁﬁU V
,
ﬁﬁV W
PlayerShipId
ﬂﬂ  
=
ﬂﬂ! "
table
ﬂﬂ# (
.
ﬂﬂ( )
Column
ﬂﬂ) /
<
ﬂﬂ/ 0
Guid
ﬂﬂ0 4
>
ﬂﬂ4 5
(
ﬂﬂ5 6
type
ﬂﬂ6 :
:
ﬂﬂ: ;
$str
ﬂﬂ< B
,
ﬂﬂB C
nullable
ﬂﬂD L
:
ﬂﬂL M
false
ﬂﬂN S
)
ﬂﬂS T
}
‡‡ 
,
‡‡ 
constraints
·· 
:
·· 
table
·· "
=>
··# %
{
‚‚ 
table
„„ 
.
„„ 

PrimaryKey
„„ $
(
„„$ %
$str
„„% 2
,
„„2 3
x
„„4 5
=>
„„6 8
x
„„9 :
.
„„: ;
Id
„„; =
)
„„= >
;
„„> ?
table
‰‰ 
.
‰‰ 

ForeignKey
‰‰ $
(
‰‰$ %
name
ÂÂ 
:
ÂÂ 
$str
ÂÂ C
,
ÂÂC D
column
ÊÊ 
:
ÊÊ 
x
ÊÊ  !
=>
ÊÊ" $
x
ÊÊ% &
.
ÊÊ& '
PlayerShipId
ÊÊ' 3
,
ÊÊ3 4
principalTable
ÁÁ &
:
ÁÁ& '
$str
ÁÁ( 4
,
ÁÁ4 5
principalColumn
ËË '
:
ËË' (
$str
ËË) -
,
ËË- .
onDelete
ÈÈ  
:
ÈÈ  !
ReferentialAction
ÈÈ" 3
.
ÈÈ3 4
Cascade
ÈÈ4 ;
)
ÈÈ; <
;
ÈÈ< =
}
ÍÍ 
)
ÍÍ 
;
ÍÍ 
migrationBuilder
ÏÏ 
.
ÏÏ 

InsertData
ÏÏ '
(
ÏÏ' (
table
ÌÌ 
:
ÌÌ 
$str
ÌÌ %
,
ÌÌ% &
columns
ÓÓ 
:
ÓÓ 
new
ÓÓ 
[
ÓÓ 
]
ÓÓ 
{
ÓÓ  
$str
ÓÓ! %
,
ÓÓ% &
$str
ÓÓ' =
,
ÓÓ= >
$str
ÓÓ? L
,
ÓÓL M
$str
ÓÓN T
,
ÓÓT U
$str
ÓÓV f
,
ÓÓf g
$strÓÓh Ü
}ÓÓá à
,ÓÓà â
values
ÔÔ 
:
ÔÔ 
new
ÔÔ 
object
ÔÔ "
[
ÔÔ" #
,
ÔÔ# $
]
ÔÔ$ %
{
 
{
ÒÒ 
new
ÒÒ 
Guid
ÒÒ 
(
ÒÒ 
$str
ÒÒ E
)
ÒÒE F
,
ÒÒF G
$num
ÒÒH I
,
ÒÒI J
$str
ÒÒK z
,
ÒÒz {
$strÒÒ| Ö
,ÒÒÖ Ü
$strÒÒá ¶
,ÒÒ¶ ß
$numÒÒ® ©
}ÒÒ™ ´
,ÒÒ´ ¨
{
ÚÚ 
new
ÚÚ 
Guid
ÚÚ 
(
ÚÚ 
$str
ÚÚ E
)
ÚÚE F
,
ÚÚF G
$num
ÚÚH I
,
ÚÚI J
$str
ÚÚK c
,
ÚÚc d
$str
ÚÚe n
,
ÚÚn o
$str
ÚÚp }
,
ÚÚ} ~
$numÚÚ Ä
}ÚÚÅ Ç
,ÚÚÇ É
{
ÛÛ 
new
ÛÛ 
Guid
ÛÛ 
(
ÛÛ 
$str
ÛÛ E
)
ÛÛE F
,
ÛÛF G
$num
ÛÛH I
,
ÛÛI J
$str
ÛÛK t
,
ÛÛt u
$str
ÛÛv }
,
ÛÛ} ~
$strÛÛ ç
,ÛÛç é
$numÛÛè ê
}ÛÛë í
,ÛÛí ì
{
ÙÙ 
new
ÙÙ 
Guid
ÙÙ 
(
ÙÙ 
$str
ÙÙ E
)
ÙÙE F
,
ÙÙF G
$num
ÙÙH I
,
ÙÙI J
$str
ÙÙK [
,
ÙÙ[ \
$str
ÙÙ] j
,
ÙÙj k
$str
ÙÙl |
,
ÙÙ| }
$numÙÙ~ Ä
}ÙÙÅ Ç
,ÙÙÇ É
{
ıı 
new
ıı 
Guid
ıı 
(
ıı 
$str
ıı E
)
ııE F
,
ııF G
$num
ııH I
,
ııI J
$str
ııK i
,
ııi j
$str
ıık u
,
ııu v
$strııw É
,ııÉ Ñ
$numııÖ Ü
}ııá à
,ııà â
{
ˆˆ 
new
ˆˆ 
Guid
ˆˆ 
(
ˆˆ 
$str
ˆˆ E
)
ˆˆE F
,
ˆˆF G
$num
ˆˆH I
,
ˆˆI J
$str
ˆˆK k
,
ˆˆk l
$str
ˆˆm z
,
ˆˆz {
$strˆˆ| ä
,ˆˆä ã
$numˆˆå ç
}ˆˆé è
,ˆˆè ê
{
˜˜ 
new
˜˜ 
Guid
˜˜ 
(
˜˜ 
$str
˜˜ E
)
˜˜E F
,
˜˜F G
$num
˜˜H I
,
˜˜I J
$str
˜˜K s
,
˜˜s t
$str˜˜u Ä
,˜˜Ä Å
$str˜˜Ç è
,˜˜è ê
$num˜˜ë í
}˜˜ì î
,˜˜î ï
{
¯¯ 
new
¯¯ 
Guid
¯¯ 
(
¯¯ 
$str
¯¯ E
)
¯¯E F
,
¯¯F G
$num
¯¯H I
,
¯¯I J
$str
¯¯K a
,
¯¯a b
$str
¯¯c n
,
¯¯n o
$str
¯¯p {
,
¯¯{ |
$num
¯¯} ~
}¯¯ Ä
,¯¯Ä Å
{
˘˘ 
new
˘˘ 
Guid
˘˘ 
(
˘˘ 
$str
˘˘ E
)
˘˘E F
,
˘˘F G
$num
˘˘H I
,
˘˘I J
$str
˘˘K o
,
˘˘o p
$str
˘˘q w
,
˘˘w x
$str˘˘y é
,˘˘é è
$num˘˘ê ë
}˘˘í ì
,˘˘ì î
{
˙˙ 
new
˙˙ 
Guid
˙˙ 
(
˙˙ 
$str
˙˙ E
)
˙˙E F
,
˙˙F G
$num
˙˙H I
,
˙˙I J
$str
˙˙K g
,
˙˙g h
$str
˙˙i r
,
˙˙r s
$str˙˙t Ç
,˙˙Ç É
$num˙˙Ñ Ö
}˙˙Ü á
}
˚˚ 
)
˚˚ 
;
˚˚ 
migrationBuilder
˝˝ 
.
˝˝ 
CreateIndex
˝˝ (
(
˝˝( )
name
˛˛ 
:
˛˛ 
$str
˛˛ 2
,
˛˛2 3
table
ˇˇ 
:
ˇˇ 
$str
ˇˇ )
,
ˇˇ) *
column
ÄÄ 
:
ÄÄ 
$str
ÄÄ  
)
ÄÄ  !
;
ÄÄ! "
migrationBuilder
ÇÇ 
.
ÇÇ 
CreateIndex
ÇÇ (
(
ÇÇ( )
name
ÉÉ 
:
ÉÉ 
$str
ÉÉ %
,
ÉÉ% &
table
ÑÑ 
:
ÑÑ 
$str
ÑÑ $
,
ÑÑ$ %
column
ÖÖ 
:
ÖÖ 
$str
ÖÖ (
,
ÖÖ( )
unique
ÜÜ 
:
ÜÜ 
true
ÜÜ 
)
ÜÜ 
;
ÜÜ 
migrationBuilder
àà 
.
àà 
CreateIndex
àà (
(
àà( )
name
ââ 
:
ââ 
$str
ââ 2
,
ââ2 3
table
ää 
:
ää 
$str
ää )
,
ää) *
column
ãã 
:
ãã 
$str
ãã  
)
ãã  !
;
ãã! "
migrationBuilder
çç 
.
çç 
CreateIndex
çç (
(
çç( )
name
éé 
:
éé 
$str
éé 2
,
éé2 3
table
èè 
:
èè 
$str
èè )
,
èè) *
column
êê 
:
êê 
$str
êê  
)
êê  !
;
êê! "
migrationBuilder
íí 
.
íí 
CreateIndex
íí (
(
íí( )
name
ìì 
:
ìì 
$str
ìì 1
,
ìì1 2
table
îî 
:
îî 
$str
îî (
,
îî( )
column
ïï 
:
ïï 
$str
ïï  
)
ïï  !
;
ïï! "
migrationBuilder
óó 
.
óó 
CreateIndex
óó (
(
óó( )
name
òò 
:
òò 
$str
òò "
,
òò" #
table
ôô 
:
ôô 
$str
ôô $
,
ôô$ %
column
öö 
:
öö 
$str
öö )
)
öö) *
;
öö* +
migrationBuilder
úú 
.
úú 
CreateIndex
úú (
(
úú( )
name
ùù 
:
ùù 
$str
ùù 4
,
ùù4 5
table
ûû 
:
ûû 
$str
ûû $
,
ûû$ %
column
üü 
:
üü 
$str
üü '
)
üü' (
;
üü( )
migrationBuilder
°° 
.
°° 
CreateIndex
°° (
(
°°( )
name
¢¢ 
:
¢¢ 
$str
¢¢ %
,
¢¢% &
table
££ 
:
££ 
$str
££ $
,
££$ %
column
§§ 
:
§§ 
$str
§§ ,
,
§§, -
unique
•• 
:
•• 
true
•• 
)
•• 
;
•• 
migrationBuilder
ßß 
.
ßß 
CreateIndex
ßß (
(
ßß( )
name
®® 
:
®® 
$str
®® <
,
®®< =
table
©© 
:
©© 
$str
©© ,
,
©©, -
column
™™ 
:
™™ 
$str
™™ '
,
™™' (
unique
´´ 
:
´´ 
true
´´ 
)
´´ 
;
´´ 
migrationBuilder
≠≠ 
.
≠≠ 
CreateIndex
≠≠ (
(
≠≠( )
name
ÆÆ 
:
ÆÆ 
$str
ÆÆ /
,
ÆÆ/ 0
table
ØØ 
:
ØØ 
$str
ØØ 
,
ØØ  
column
∞∞ 
:
∞∞ 
$str
∞∞ '
)
∞∞' (
;
∞∞( )
migrationBuilder
≤≤ 
.
≤≤ 
CreateIndex
≤≤ (
(
≤≤( )
name
≥≥ 
:
≥≥ 
$str
≥≥ (
,
≥≥( )
table
¥¥ 
:
¥¥ 
$str
¥¥ 
,
¥¥  
column
µµ 
:
µµ 
$str
µµ  
)
µµ  !
;
µµ! "
migrationBuilder
∑∑ 
.
∑∑ 
CreateIndex
∑∑ (
(
∑∑( )
name
∏∏ 
:
∏∏ 
$str
∏∏ .
,
∏∏. /
table
ππ 
:
ππ 
$str
ππ #
,
ππ# $
column
∫∫ 
:
∫∫ 
$str
∫∫ "
)
∫∫" #
;
∫∫# $
migrationBuilder
ºº 
.
ºº 
CreateIndex
ºº (
(
ºº( )
name
ΩΩ 
:
ΩΩ 
$str
ΩΩ ,
,
ΩΩ, -
table
ææ 
:
ææ 
$str
ææ #
,
ææ# $
column
øø 
:
øø 
$str
øø  
)
øø  !
;
øø! "
migrationBuilder
¡¡ 
.
¡¡ 
CreateIndex
¡¡ (
(
¡¡( )
name
¬¬ 
:
¬¬ 
$str
¬¬ 0
,
¬¬0 1
table
√√ 
:
√√ 
$str
√√ !
,
√√! "
column
ƒƒ 
:
ƒƒ 
$str
ƒƒ &
)
ƒƒ& '
;
ƒƒ' (
migrationBuilder
∆∆ 
.
∆∆ 
CreateIndex
∆∆ (
(
∆∆( )
name
«« 
:
«« 
$str
«« 8
,
««8 9
table
»» 
:
»» 
$str
»» (
,
»»( )
column
…… 
:
…… 
$str
…… '
)
……' (
;
……( )
migrationBuilder
ÀÀ 
.
ÀÀ 
CreateIndex
ÀÀ (
(
ÀÀ( )
name
ÃÃ 
:
ÃÃ 
$str
ÃÃ 1
,
ÃÃ1 2
table
ÕÕ 
:
ÕÕ 
$str
ÕÕ (
,
ÕÕ( )
column
ŒŒ 
:
ŒŒ 
$str
ŒŒ  
)
ŒŒ  !
;
ŒŒ! "
migrationBuilder
–– 
.
–– 
CreateIndex
–– (
(
––( )
name
—— 
:
—— 
$str
—— .
,
——. /
table
““ 
:
““ 
$str
““ %
,
““% &
column
”” 
:
”” 
$str
””  
)
””  !
;
””! "
migrationBuilder
’’ 
.
’’ 
CreateIndex
’’ (
(
’’( )
name
÷÷ 
:
÷÷ 
$str
÷÷ .
,
÷÷. /
table
◊◊ 
:
◊◊ 
$str
◊◊ %
,
◊◊% &
column
ÿÿ 
:
ÿÿ 
$str
ÿÿ  
)
ÿÿ  !
;
ÿÿ! "
}
ŸŸ 	
	protected
€€ 
override
€€ 
void
€€ 
Down
€€  $
(
€€$ %
MigrationBuilder
€€% 5
migrationBuilder
€€6 F
)
€€F G
{
‹‹ 	
migrationBuilder
›› 
.
›› 
	DropTable
›› &
(
››& '
name
ﬁﬁ 
:
ﬁﬁ 
$str
ﬁﬁ (
)
ﬁﬁ( )
;
ﬁﬁ) *
migrationBuilder
‡‡ 
.
‡‡ 
	DropTable
‡‡ &
(
‡‡& '
name
·· 
:
·· 
$str
·· (
)
··( )
;
··) *
migrationBuilder
„„ 
.
„„ 
	DropTable
„„ &
(
„„& '
name
‰‰ 
:
‰‰ 
$str
‰‰ (
)
‰‰( )
;
‰‰) *
migrationBuilder
ÊÊ 
.
ÊÊ 
	DropTable
ÊÊ &
(
ÊÊ& '
name
ÁÁ 
:
ÁÁ 
$str
ÁÁ '
)
ÁÁ' (
;
ÁÁ( )
migrationBuilder
ÈÈ 
.
ÈÈ 
	DropTable
ÈÈ &
(
ÈÈ& '
name
ÍÍ 
:
ÍÍ 
$str
ÍÍ (
)
ÍÍ( )
;
ÍÍ) *
migrationBuilder
ÏÏ 
.
ÏÏ 
	DropTable
ÏÏ &
(
ÏÏ& '
name
ÌÌ 
:
ÌÌ 
$str
ÌÌ 
)
ÌÌ  
;
ÌÌ  !
migrationBuilder
ÔÔ 
.
ÔÔ 
	DropTable
ÔÔ &
(
ÔÔ& '
name
 
:
 
$str
 +
)
+ ,
;
, -
migrationBuilder
ÚÚ 
.
ÚÚ 
	DropTable
ÚÚ &
(
ÚÚ& '
name
ÛÛ 
:
ÛÛ 
$str
ÛÛ  
)
ÛÛ  !
;
ÛÛ! "
migrationBuilder
ıı 
.
ıı 
	DropTable
ıı &
(
ıı& '
name
ˆˆ 
:
ˆˆ 
$str
ˆˆ '
)
ˆˆ' (
;
ˆˆ( )
migrationBuilder
¯¯ 
.
¯¯ 
	DropTable
¯¯ &
(
¯¯& '
name
˘˘ 
:
˘˘ 
$str
˘˘ $
)
˘˘$ %
;
˘˘% &
migrationBuilder
˚˚ 
.
˚˚ 
	DropTable
˚˚ &
(
˚˚& '
name
¸¸ 
:
¸¸ 
$str
¸¸ #
)
¸¸# $
;
¸¸$ %
migrationBuilder
˛˛ 
.
˛˛ 
	DropTable
˛˛ &
(
˛˛& '
name
ˇˇ 
:
ˇˇ 
$str
ˇˇ "
)
ˇˇ" #
;
ˇˇ# $
migrationBuilder
ÅÅ 
.
ÅÅ 
	DropTable
ÅÅ &
(
ÅÅ& '
name
ÇÇ 
:
ÇÇ 
$str
ÇÇ 
)
ÇÇ 
;
ÇÇ  
migrationBuilder
ÑÑ 
.
ÑÑ 
	DropTable
ÑÑ &
(
ÑÑ& '
name
ÖÖ 
:
ÖÖ 
$str
ÖÖ 
)
ÖÖ 
;
ÖÖ 
migrationBuilder
áá 
.
áá 
	DropTable
áá &
(
áá& '
name
àà 
:
àà 
$str
àà #
)
àà# $
;
àà$ %
migrationBuilder
ää 
.
ää 
	DropTable
ää &
(
ää& '
name
ãã 
:
ãã 
$str
ãã #
)
ãã# $
;
ãã$ %
migrationBuilder
çç 
.
çç 
	DropTable
çç &
(
çç& '
name
éé 
:
éé 
$str
éé $
)
éé$ %
;
éé% &
}
èè 	
}
êê 
}ëë Ñ
MD:\dev\Battleships\Battleships\Migrations\20221028005645_playerFriendsInit.cs
	namespace 	
Battleships
 
. 

Migrations  
{ 
public 

partial 
class 
playerFriendsInit *
:+ ,
	Migration- 6
{		 
	protected

 
override

 
void

 
Up

  "
(

" #
MigrationBuilder

# 3
migrationBuilder

4 D
)

D E
{ 	
migrationBuilder 
. 
CreateTable (
(( )
name 
: 
$str 
,  
columns 
: 
table 
=> !
new" %
{ 
Id 
= 
table 
. 
Column %
<% &
Guid& *
>* +
(+ ,
type, 0
:0 1
$str2 8
,8 9
nullable: B
:B C
falseD I
)I J
,J K
User1 
= 
table !
.! "
Column" (
<( )
Guid) -
>- .
(. /
type/ 3
:3 4
$str5 ;
,; <
nullable= E
:E F
falseG L
)L M
,M N
User2 
= 
table !
.! "
Column" (
<( )
Guid) -
>- .
(. /
type/ 3
:3 4
$str5 ;
,; <
nullable= E
:E F
falseG L
)L M
} 
, 
constraints 
: 
table "
=># %
{ 
table 
. 

PrimaryKey $
($ %
$str% 1
,1 2
x3 4
=>5 7
x8 9
.9 :
Id: <
)< =
;= >
} 
) 
; 
} 	
	protected 
override 
void 
Down  $
($ %
MigrationBuilder% 5
migrationBuilder6 F
)F G
{ 	
migrationBuilder 
. 
	DropTable &
(& '
name 
: 
$str 
)  
;  !
} 	
} 
}   œ„
CD:\dev\Battleships\Battleships\Migrations\20221031183134_NewInit.cs
	namespace 	
Battleships
 
. 

Migrations  
{ 
public		 

partial		 
class		 
NewInit		  
:		! "
	Migration		# ,
{

 
	protected 
override 
void 
Up  "
(" #
MigrationBuilder# 3
migrationBuilder4 D
)D E
{ 	
migrationBuilder 
. 
CreateTable (
(( )
name 
: 
$str $
,$ %
columns 
: 
table 
=> !
new" %
{ 
Id 
= 
table 
. 
Column %
<% &
Guid& *
>* +
(+ ,
type, 0
:0 1
$str2 8
,8 9
nullable: B
:B C
falseD I
)I J
,J K
Name 
= 
table  
.  !
Column! '
<' (
string( .
>. /
(/ 0
type0 4
:4 5
$str6 <
,< =
nullable> F
:F G
trueH L
)L M
,M N
Description 
=  !
table" '
.' (
Column( .
<. /
string/ 5
>5 6
(6 7
type7 ;
:; <
$str= C
,C D
nullableE M
:M N
trueO S
)S T
,T U
RequiredAction "
=# $
table% *
.* +
Column+ 1
<1 2
string2 8
>8 9
(9 :
type: >
:> ?
$str@ F
,F G
nullableH P
:P Q
trueR V
)V W
,W X 
ActionPerformedCount (
=) *
table+ 0
.0 1
Column1 7
<7 8
int8 ;
>; <
(< =
type= A
:A B
$strC L
,L M
nullableN V
:V W
falseX ]
)] ^
,^ _(
RequiredActionPerformedCount 0
=1 2
table3 8
.8 9
Column9 ?
<? @
int@ C
>C D
(D E
typeE I
:I J
$strK T
,T U
nullableV ^
:^ _
false` e
)e f
} 
, 
constraints 
: 
table "
=># %
{ 
table 
. 

PrimaryKey $
($ %
$str% 6
,6 7
x8 9
=>: <
x= >
.> ?
Id? A
)A B
;B C
} 
) 
; 
migrationBuilder 
. 
CreateTable (
(( )
name 
: 
$str #
,# $
columns 
: 
table 
=> !
new" %
{   
Id!! 
=!! 
table!! 
.!! 
Column!! %
<!!% &
string!!& ,
>!!, -
(!!- .
type!!. 2
:!!2 3
$str!!4 :
,!!: ;
nullable!!< D
:!!D E
false!!F K
)!!K L
,!!L M
Name"" 
="" 
table""  
.""  !
Column""! '
<""' (
string""( .
>"". /
(""/ 0
type""0 4
:""4 5
$str""6 N
,""N O
	maxLength""P Y
:""Y Z
$num""[ ^
,""^ _
nullable""` h
:""h i
true""j n
)""n o
,""o p
NormalizedName## "
=### $
table##% *
.##* +
Column##+ 1
<##1 2
string##2 8
>##8 9
(##9 :
type##: >
:##> ?
$str##@ X
,##X Y
	maxLength##Z c
:##c d
$num##e h
,##h i
nullable##j r
:##r s
true##t x
)##x y
,##y z
ConcurrencyStamp$$ $
=$$% &
table$$' ,
.$$, -
Column$$- 3
<$$3 4
string$$4 :
>$$: ;
($$; <
type$$< @
:$$@ A
$str$$B H
,$$H I
nullable$$J R
:$$R S
true$$T X
)$$X Y
}%% 
,%% 
constraints&& 
:&& 
table&& "
=>&&# %
{'' 
table(( 
.(( 

PrimaryKey(( $
((($ %
$str((% 5
,((5 6
x((7 8
=>((9 ;
x((< =
.((= >
Id((> @
)((@ A
;((A B
})) 
))) 
;)) 
migrationBuilder++ 
.++ 
CreateTable++ (
(++( )
name,, 
:,, 
$str,, 
,,, 
columns-- 
:-- 
table-- 
=>-- !
new--" %
{.. 
Id// 
=// 
table// 
.// 
Column// %
<//% &
Guid//& *
>//* +
(//+ ,
type//, 0
://0 1
$str//2 8
,//8 9
nullable//: B
://B C
false//D I
)//I J
,//J K!
ShipTypeDiscriminator00 )
=00* +
table00, 1
.001 2
Column002 8
<008 9
string009 ?
>00? @
(00@ A
type00A E
:00E F
$str00G M
,00M N
nullable00O W
:00W X
false00Y ^
)00^ _
,00_ `
Name11 
=11 
table11  
.11  !
Column11! '
<11' (
string11( .
>11. /
(11/ 0
type110 4
:114 5
$str116 <
,11< =
nullable11> F
:11F G
true11H L
)11L M
,11M N
Description22 
=22  !
table22" '
.22' (
Column22( .
<22. /
string22/ 5
>225 6
(226 7
type227 ;
:22; <
$str22= C
,22C D
nullable22E M
:22M N
true22O S
)22S T
,22T U
ShipType33 
=33 
table33 $
.33$ %
Column33% +
<33+ ,
string33, 2
>332 3
(333 4
type334 8
:338 9
$str33: @
,33@ A
nullable33B J
:33J K
true33L P
)33P Q
}44 
,44 
constraints55 
:55 
table55 "
=>55# %
{66 
table77 
.77 

PrimaryKey77 $
(77$ %
$str77% .
,77. /
x770 1
=>772 4
x775 6
.776 7
Id777 9
)779 :
;77: ;
}88 
)88 
;88 
migrationBuilder:: 
.:: 
CreateTable:: (
(::( )
name;; 
:;; 
$str;; #
,;;# $
columns<< 
:<< 
table<< 
=><< !
new<<" %
{== 
Id>> 
=>> 
table>> 
.>> 
Column>> %
<>>% &
string>>& ,
>>>, -
(>>- .
type>>. 2
:>>2 3
$str>>4 :
,>>: ;
nullable>>< D
:>>D E
false>>F K
)>>K L
,>>L M
Name?? 
=?? 
table??  
.??  !
Column??! '
<??' (
string??( .
>??. /
(??/ 0
type??0 4
:??4 5
$str??6 <
,??< =
nullable??> F
:??F G
true??H L
)??L M
,??M N
Surname@@ 
=@@ 
table@@ #
.@@# $
Column@@$ *
<@@* +
string@@+ 1
>@@1 2
(@@2 3
type@@3 7
:@@7 8
$str@@9 ?
,@@? @
nullable@@A I
:@@I J
true@@K O
)@@O P
,@@P Q
AchievementIdAA !
=AA" #
tableAA$ )
.AA) *
ColumnAA* 0
<AA0 1
GuidAA1 5
>AA5 6
(AA6 7
typeAA7 ;
:AA; <
$strAA= C
,AAC D
nullableAAE M
:AAM N
trueAAO S
)AAS T
,AAT U
UserNameBB 
=BB 
tableBB $
.BB$ %
ColumnBB% +
<BB+ ,
stringBB, 2
>BB2 3
(BB3 4
typeBB4 8
:BB8 9
$strBB: R
,BBR S
	maxLengthBBT ]
:BB] ^
$numBB_ b
,BBb c
nullableBBd l
:BBl m
trueBBn r
)BBr s
,BBs t
NormalizedUserNameCC &
=CC' (
tableCC) .
.CC. /
ColumnCC/ 5
<CC5 6
stringCC6 <
>CC< =
(CC= >
typeCC> B
:CCB C
$strCCD \
,CC\ ]
	maxLengthCC^ g
:CCg h
$numCCi l
,CCl m
nullableCCn v
:CCv w
trueCCx |
)CC| }
,CC} ~
EmailDD 
=DD 
tableDD !
.DD! "
ColumnDD" (
<DD( )
stringDD) /
>DD/ 0
(DD0 1
typeDD1 5
:DD5 6
$strDD7 O
,DDO P
	maxLengthDDQ Z
:DDZ [
$numDD\ _
,DD_ `
nullableDDa i
:DDi j
trueDDk o
)DDo p
,DDp q
NormalizedEmailEE #
=EE$ %
tableEE& +
.EE+ ,
ColumnEE, 2
<EE2 3
stringEE3 9
>EE9 :
(EE: ;
typeEE; ?
:EE? @
$strEEA Y
,EEY Z
	maxLengthEE[ d
:EEd e
$numEEf i
,EEi j
nullableEEk s
:EEs t
trueEEu y
)EEy z
,EEz {
EmailConfirmedFF "
=FF# $
tableFF% *
.FF* +
ColumnFF+ 1
<FF1 2
boolFF2 6
>FF6 7
(FF7 8
typeFF8 <
:FF< =
$strFF> G
,FFG H
nullableFFI Q
:FFQ R
falseFFS X
)FFX Y
,FFY Z
PasswordHashGG  
=GG! "
tableGG# (
.GG( )
ColumnGG) /
<GG/ 0
stringGG0 6
>GG6 7
(GG7 8
typeGG8 <
:GG< =
$strGG> D
,GGD E
nullableGGF N
:GGN O
trueGGP T
)GGT U
,GGU V
SecurityStampHH !
=HH" #
tableHH$ )
.HH) *
ColumnHH* 0
<HH0 1
stringHH1 7
>HH7 8
(HH8 9
typeHH9 =
:HH= >
$strHH? E
,HHE F
nullableHHG O
:HHO P
trueHHQ U
)HHU V
,HHV W
ConcurrencyStampII $
=II% &
tableII' ,
.II, -
ColumnII- 3
<II3 4
stringII4 :
>II: ;
(II; <
typeII< @
:II@ A
$strIIB H
,IIH I
nullableIIJ R
:IIR S
trueIIT X
)IIX Y
,IIY Z
PhoneNumberJJ 
=JJ  !
tableJJ" '
.JJ' (
ColumnJJ( .
<JJ. /
stringJJ/ 5
>JJ5 6
(JJ6 7
typeJJ7 ;
:JJ; <
$strJJ= C
,JJC D
nullableJJE M
:JJM N
trueJJO S
)JJS T
,JJT U 
PhoneNumberConfirmedKK (
=KK) *
tableKK+ 0
.KK0 1
ColumnKK1 7
<KK7 8
boolKK8 <
>KK< =
(KK= >
typeKK> B
:KKB C
$strKKD M
,KKM N
nullableKKO W
:KKW X
falseKKY ^
)KK^ _
,KK_ `
TwoFactorEnabledLL $
=LL% &
tableLL' ,
.LL, -
ColumnLL- 3
<LL3 4
boolLL4 8
>LL8 9
(LL9 :
typeLL: >
:LL> ?
$strLL@ I
,LLI J
nullableLLK S
:LLS T
falseLLU Z
)LLZ [
,LL[ \

LockoutEndMM 
=MM  
tableMM! &
.MM& '
ColumnMM' -
<MM- .
DateTimeOffsetMM. <
>MM< =
(MM= >
typeMM> B
:MMB C
$strMMD ^
,MM^ _
nullableMM` h
:MMh i
trueMMj n
)MMn o
,MMo p
LockoutEnabledNN "
=NN# $
tableNN% *
.NN* +
ColumnNN+ 1
<NN1 2
boolNN2 6
>NN6 7
(NN7 8
typeNN8 <
:NN< =
$strNN> G
,NNG H
nullableNNI Q
:NNQ R
falseNNS X
)NNX Y
,NNY Z
AccessFailedCountOO %
=OO& '
tableOO( -
.OO- .
ColumnOO. 4
<OO4 5
intOO5 8
>OO8 9
(OO9 :
typeOO: >
:OO> ?
$strOO@ I
,OOI J
nullableOOK S
:OOS T
falseOOU Z
)OOZ [
}PP 
,PP 
constraintsQQ 
:QQ 
tableQQ "
=>QQ# %
{RR 
tableSS 
.SS 

PrimaryKeySS $
(SS$ %
$strSS% 5
,SS5 6
xSS7 8
=>SS9 ;
xSS< =
.SS= >
IdSS> @
)SS@ A
;SSA B
tableTT 
.TT 

ForeignKeyTT $
(TT$ %
nameUU 
:UU 
$strUU I
,UUI J
columnVV 
:VV 
xVV  !
=>VV" $
xVV% &
.VV& '
AchievementIdVV' 4
,VV4 5
principalTableWW &
:WW& '
$strWW( 6
,WW6 7
principalColumnXX '
:XX' (
$strXX) -
)XX- .
;XX. /
}YY 
)YY 
;YY 
migrationBuilder[[ 
.[[ 
CreateTable[[ (
([[( )
name\\ 
:\\ 
$str\\ (
,\\( )
columns]] 
:]] 
table]] 
=>]] !
new]]" %
{^^ 
Id__ 
=__ 
table__ 
.__ 
Column__ %
<__% &
int__& )
>__) *
(__* +
type__+ /
:__/ 0
$str__1 :
,__: ;
nullable__< D
:__D E
false__F K
)__K L
.`` 

Annotation`` #
(``# $
$str``$ D
,``D E)
NpgsqlValueGenerationStrategy``F c
.``c d#
IdentityByDefaultColumn``d {
)``{ |
,``| }
RoleIdaa 
=aa 
tableaa "
.aa" #
Columnaa# )
<aa) *
stringaa* 0
>aa0 1
(aa1 2
typeaa2 6
:aa6 7
$straa8 >
,aa> ?
nullableaa@ H
:aaH I
falseaaJ O
)aaO P
,aaP Q
	ClaimTypebb 
=bb 
tablebb  %
.bb% &
Columnbb& ,
<bb, -
stringbb- 3
>bb3 4
(bb4 5
typebb5 9
:bb9 :
$strbb; A
,bbA B
nullablebbC K
:bbK L
truebbM Q
)bbQ R
,bbR S

ClaimValuecc 
=cc  
tablecc! &
.cc& '
Columncc' -
<cc- .
stringcc. 4
>cc4 5
(cc5 6
typecc6 :
:cc: ;
$strcc< B
,ccB C
nullableccD L
:ccL M
trueccN R
)ccR S
}dd 
,dd 
constraintsee 
:ee 
tableee "
=>ee# %
{ff 
tablegg 
.gg 

PrimaryKeygg $
(gg$ %
$strgg% :
,gg: ;
xgg< =
=>gg> @
xggA B
.ggB C
IdggC E
)ggE F
;ggF G
tablehh 
.hh 

ForeignKeyhh $
(hh$ %
nameii 
:ii 
$strii F
,iiF G
columnjj 
:jj 
xjj  !
=>jj" $
xjj% &
.jj& '
RoleIdjj' -
,jj- .
principalTablekk &
:kk& '
$strkk( 5
,kk5 6
principalColumnll '
:ll' (
$strll) -
,ll- .
onDeletemm  
:mm  !
ReferentialActionmm" 3
.mm3 4
Cascademm4 ;
)mm; <
;mm< =
}nn 
)nn 
;nn 
migrationBuilderpp 
.pp 
CreateTablepp (
(pp( )
nameqq 
:qq 
$strqq (
,qq( )
columnsrr 
:rr 
tablerr 
=>rr !
newrr" %
{ss 
Idtt 
=tt 
tablett 
.tt 
Columntt %
<tt% &
inttt& )
>tt) *
(tt* +
typett+ /
:tt/ 0
$strtt1 :
,tt: ;
nullablett< D
:ttD E
falsettF K
)ttK L
.uu 

Annotationuu #
(uu# $
$struu$ D
,uuD E)
NpgsqlValueGenerationStrategyuuF c
.uuc d#
IdentityByDefaultColumnuud {
)uu{ |
,uu| }
UserIdvv 
=vv 
tablevv "
.vv" #
Columnvv# )
<vv) *
stringvv* 0
>vv0 1
(vv1 2
typevv2 6
:vv6 7
$strvv8 >
,vv> ?
nullablevv@ H
:vvH I
falsevvJ O
)vvO P
,vvP Q
	ClaimTypeww 
=ww 
tableww  %
.ww% &
Columnww& ,
<ww, -
stringww- 3
>ww3 4
(ww4 5
typeww5 9
:ww9 :
$strww; A
,wwA B
nullablewwC K
:wwK L
truewwM Q
)wwQ R
,wwR S

ClaimValuexx 
=xx  
tablexx! &
.xx& '
Columnxx' -
<xx- .
stringxx. 4
>xx4 5
(xx5 6
typexx6 :
:xx: ;
$strxx< B
,xxB C
nullablexxD L
:xxL M
truexxN R
)xxR S
}yy 
,yy 
constraintszz 
:zz 
tablezz "
=>zz# %
{{{ 
table|| 
.|| 

PrimaryKey|| $
(||$ %
$str||% :
,||: ;
x||< =
=>||> @
x||A B
.||B C
Id||C E
)||E F
;||F G
table}} 
.}} 

ForeignKey}} $
(}}$ %
name~~ 
:~~ 
$str~~ F
,~~F G
column 
: 
x  !
=>" $
x% &
.& '
UserId' -
,- .
principalTable
ÄÄ &
:
ÄÄ& '
$str
ÄÄ( 5
,
ÄÄ5 6
principalColumn
ÅÅ '
:
ÅÅ' (
$str
ÅÅ) -
,
ÅÅ- .
onDelete
ÇÇ  
:
ÇÇ  !
ReferentialAction
ÇÇ" 3
.
ÇÇ3 4
Cascade
ÇÇ4 ;
)
ÇÇ; <
;
ÇÇ< =
}
ÉÉ 
)
ÉÉ 
;
ÉÉ 
migrationBuilder
ÖÖ 
.
ÖÖ 
CreateTable
ÖÖ (
(
ÖÖ( )
name
ÜÜ 
:
ÜÜ 
$str
ÜÜ (
,
ÜÜ( )
columns
áá 
:
áá 
table
áá 
=>
áá !
new
áá" %
{
àà 
LoginProvider
ââ !
=
ââ" #
table
ââ$ )
.
ââ) *
Column
ââ* 0
<
ââ0 1
string
ââ1 7
>
ââ7 8
(
ââ8 9
type
ââ9 =
:
ââ= >
$str
ââ? W
,
ââW X
	maxLength
ââY b
:
ââb c
$num
ââd g
,
ââg h
nullable
ââi q
:
ââq r
false
ââs x
)
ââx y
,
âây z
ProviderKey
ää 
=
ää  !
table
ää" '
.
ää' (
Column
ää( .
<
ää. /
string
ää/ 5
>
ää5 6
(
ää6 7
type
ää7 ;
:
ää; <
$str
ää= U
,
ääU V
	maxLength
ääW `
:
ää` a
$num
ääb e
,
ääe f
nullable
ääg o
:
ääo p
false
ääq v
)
ääv w
,
ääw x!
ProviderDisplayName
ãã '
=
ãã( )
table
ãã* /
.
ãã/ 0
Column
ãã0 6
<
ãã6 7
string
ãã7 =
>
ãã= >
(
ãã> ?
type
ãã? C
:
ããC D
$str
ããE K
,
ããK L
nullable
ããM U
:
ããU V
true
ããW [
)
ãã[ \
,
ãã\ ]
UserId
åå 
=
åå 
table
åå "
.
åå" #
Column
åå# )
<
åå) *
string
åå* 0
>
åå0 1
(
åå1 2
type
åå2 6
:
åå6 7
$str
åå8 >
,
åå> ?
nullable
åå@ H
:
ååH I
false
ååJ O
)
ååO P
}
çç 
,
çç 
constraints
éé 
:
éé 
table
éé "
=>
éé# %
{
èè 
table
êê 
.
êê 

PrimaryKey
êê $
(
êê$ %
$str
êê% :
,
êê: ;
x
êê< =
=>
êê> @
new
êêA D
{
êêE F
x
êêG H
.
êêH I
LoginProvider
êêI V
,
êêV W
x
êêX Y
.
êêY Z
ProviderKey
êêZ e
}
êêf g
)
êêg h
;
êêh i
table
ëë 
.
ëë 

ForeignKey
ëë $
(
ëë$ %
name
íí 
:
íí 
$str
íí F
,
ííF G
column
ìì 
:
ìì 
x
ìì  !
=>
ìì" $
x
ìì% &
.
ìì& '
UserId
ìì' -
,
ìì- .
principalTable
îî &
:
îî& '
$str
îî( 5
,
îî5 6
principalColumn
ïï '
:
ïï' (
$str
ïï) -
,
ïï- .
onDelete
ññ  
:
ññ  !
ReferentialAction
ññ" 3
.
ññ3 4
Cascade
ññ4 ;
)
ññ; <
;
ññ< =
}
óó 
)
óó 
;
óó 
migrationBuilder
ôô 
.
ôô 
CreateTable
ôô (
(
ôô( )
name
öö 
:
öö 
$str
öö '
,
öö' (
columns
õõ 
:
õõ 
table
õõ 
=>
õõ !
new
õõ" %
{
úú 
UserId
ùù 
=
ùù 
table
ùù "
.
ùù" #
Column
ùù# )
<
ùù) *
string
ùù* 0
>
ùù0 1
(
ùù1 2
type
ùù2 6
:
ùù6 7
$str
ùù8 >
,
ùù> ?
nullable
ùù@ H
:
ùùH I
false
ùùJ O
)
ùùO P
,
ùùP Q
RoleId
ûû 
=
ûû 
table
ûû "
.
ûû" #
Column
ûû# )
<
ûû) *
string
ûû* 0
>
ûû0 1
(
ûû1 2
type
ûû2 6
:
ûû6 7
$str
ûû8 >
,
ûû> ?
nullable
ûû@ H
:
ûûH I
false
ûûJ O
)
ûûO P
}
üü 
,
üü 
constraints
†† 
:
†† 
table
†† "
=>
††# %
{
°° 
table
¢¢ 
.
¢¢ 

PrimaryKey
¢¢ $
(
¢¢$ %
$str
¢¢% 9
,
¢¢9 :
x
¢¢; <
=>
¢¢= ?
new
¢¢@ C
{
¢¢D E
x
¢¢F G
.
¢¢G H
UserId
¢¢H N
,
¢¢N O
x
¢¢P Q
.
¢¢Q R
RoleId
¢¢R X
}
¢¢Y Z
)
¢¢Z [
;
¢¢[ \
table
££ 
.
££ 

ForeignKey
££ $
(
££$ %
name
§§ 
:
§§ 
$str
§§ E
,
§§E F
column
•• 
:
•• 
x
••  !
=>
••" $
x
••% &
.
••& '
RoleId
••' -
,
••- .
principalTable
¶¶ &
:
¶¶& '
$str
¶¶( 5
,
¶¶5 6
principalColumn
ßß '
:
ßß' (
$str
ßß) -
,
ßß- .
onDelete
®®  
:
®®  !
ReferentialAction
®®" 3
.
®®3 4
Cascade
®®4 ;
)
®®; <
;
®®< =
table
©© 
.
©© 

ForeignKey
©© $
(
©©$ %
name
™™ 
:
™™ 
$str
™™ E
,
™™E F
column
´´ 
:
´´ 
x
´´  !
=>
´´" $
x
´´% &
.
´´& '
UserId
´´' -
,
´´- .
principalTable
¨¨ &
:
¨¨& '
$str
¨¨( 5
,
¨¨5 6
principalColumn
≠≠ '
:
≠≠' (
$str
≠≠) -
,
≠≠- .
onDelete
ÆÆ  
:
ÆÆ  !
ReferentialAction
ÆÆ" 3
.
ÆÆ3 4
Cascade
ÆÆ4 ;
)
ÆÆ; <
;
ÆÆ< =
}
ØØ 
)
ØØ 
;
ØØ 
migrationBuilder
±± 
.
±± 
CreateTable
±± (
(
±±( )
name
≤≤ 
:
≤≤ 
$str
≤≤ (
,
≤≤( )
columns
≥≥ 
:
≥≥ 
table
≥≥ 
=>
≥≥ !
new
≥≥" %
{
¥¥ 
UserId
µµ 
=
µµ 
table
µµ "
.
µµ" #
Column
µµ# )
<
µµ) *
string
µµ* 0
>
µµ0 1
(
µµ1 2
type
µµ2 6
:
µµ6 7
$str
µµ8 >
,
µµ> ?
nullable
µµ@ H
:
µµH I
false
µµJ O
)
µµO P
,
µµP Q
LoginProvider
∂∂ !
=
∂∂" #
table
∂∂$ )
.
∂∂) *
Column
∂∂* 0
<
∂∂0 1
string
∂∂1 7
>
∂∂7 8
(
∂∂8 9
type
∂∂9 =
:
∂∂= >
$str
∂∂? W
,
∂∂W X
	maxLength
∂∂Y b
:
∂∂b c
$num
∂∂d g
,
∂∂g h
nullable
∂∂i q
:
∂∂q r
false
∂∂s x
)
∂∂x y
,
∂∂y z
Name
∑∑ 
=
∑∑ 
table
∑∑  
.
∑∑  !
Column
∑∑! '
<
∑∑' (
string
∑∑( .
>
∑∑. /
(
∑∑/ 0
type
∑∑0 4
:
∑∑4 5
$str
∑∑6 N
,
∑∑N O
	maxLength
∑∑P Y
:
∑∑Y Z
$num
∑∑[ ^
,
∑∑^ _
nullable
∑∑` h
:
∑∑h i
false
∑∑j o
)
∑∑o p
,
∑∑p q
Value
∏∏ 
=
∏∏ 
table
∏∏ !
.
∏∏! "
Column
∏∏" (
<
∏∏( )
string
∏∏) /
>
∏∏/ 0
(
∏∏0 1
type
∏∏1 5
:
∏∏5 6
$str
∏∏7 =
,
∏∏= >
nullable
∏∏? G
:
∏∏G H
true
∏∏I M
)
∏∏M N
}
ππ 
,
ππ 
constraints
∫∫ 
:
∫∫ 
table
∫∫ "
=>
∫∫# %
{
ªª 
table
ºº 
.
ºº 

PrimaryKey
ºº $
(
ºº$ %
$str
ºº% :
,
ºº: ;
x
ºº< =
=>
ºº> @
new
ººA D
{
ººE F
x
ººG H
.
ººH I
UserId
ººI O
,
ººO P
x
ººQ R
.
ººR S
LoginProvider
ººS `
,
ºº` a
x
ººb c
.
ººc d
Name
ººd h
}
ººi j
)
ººj k
;
ººk l
table
ΩΩ 
.
ΩΩ 

ForeignKey
ΩΩ $
(
ΩΩ$ %
name
ææ 
:
ææ 
$str
ææ F
,
ææF G
column
øø 
:
øø 
x
øø  !
=>
øø" $
x
øø% &
.
øø& '
UserId
øø' -
,
øø- .
principalTable
¿¿ &
:
¿¿& '
$str
¿¿( 5
,
¿¿5 6
principalColumn
¡¡ '
:
¡¡' (
$str
¡¡) -
,
¡¡- .
onDelete
¬¬  
:
¬¬  !
ReferentialAction
¬¬" 3
.
¬¬3 4
Cascade
¬¬4 ;
)
¬¬; <
;
¬¬< =
}
√√ 
)
√√ 
;
√√ 
migrationBuilder
≈≈ 
.
≈≈ 
CreateTable
≈≈ (
(
≈≈( )
name
∆∆ 
:
∆∆ 
$str
∆∆ #
,
∆∆# $
columns
«« 
:
«« 
table
«« 
=>
«« !
new
««" %
{
»» 
Id
…… 
=
…… 
table
…… 
.
…… 
Column
…… %
<
……% &
Guid
……& *
>
……* +
(
……+ ,
type
……, 0
:
……0 1
$str
……2 8
,
……8 9
nullable
……: B
:
……B C
false
……D I
)
……I J
,
……J K
Icon
   
=
   
table
    
.
    !
Column
  ! '
<
  ' (
string
  ( .
>
  . /
(
  / 0
type
  0 4
:
  4 5
$str
  6 <
,
  < =
nullable
  > F
:
  F G
true
  H L
)
  L M
,
  M N
Name
ÀÀ 
=
ÀÀ 
table
ÀÀ  
.
ÀÀ  !
Column
ÀÀ! '
<
ÀÀ' (
string
ÀÀ( .
>
ÀÀ. /
(
ÀÀ/ 0
type
ÀÀ0 4
:
ÀÀ4 5
$str
ÀÀ6 <
,
ÀÀ< =
nullable
ÀÀ> F
:
ÀÀF G
true
ÀÀH L
)
ÀÀL M
,
ÀÀM N
DateCreated
ÃÃ 
=
ÃÃ  !
table
ÃÃ" '
.
ÃÃ' (
Column
ÃÃ( .
<
ÃÃ. /
DateTime
ÃÃ/ 7
>
ÃÃ7 8
(
ÃÃ8 9
type
ÃÃ9 =
:
ÃÃ= >
$str
ÃÃ? Y
,
ÃÃY Z
nullable
ÃÃ[ c
:
ÃÃc d
false
ÃÃe j
)
ÃÃj k
,
ÃÃk l

GameLength
ÕÕ 
=
ÕÕ  
table
ÕÕ! &
.
ÕÕ& '
Column
ÕÕ' -
<
ÕÕ- .
TimeSpan
ÕÕ. 6
>
ÕÕ6 7
(
ÕÕ7 8
type
ÕÕ8 <
:
ÕÕ< =
$str
ÕÕ> H
,
ÕÕH I
nullable
ÕÕJ R
:
ÕÕR S
false
ÕÕT Y
)
ÕÕY Z
,
ÕÕZ [
Status
ŒŒ 
=
ŒŒ 
table
ŒŒ "
.
ŒŒ" #
Column
ŒŒ# )
<
ŒŒ) *
int
ŒŒ* -
>
ŒŒ- .
(
ŒŒ. /
type
ŒŒ/ 3
:
ŒŒ3 4
$str
ŒŒ5 >
,
ŒŒ> ?
nullable
ŒŒ@ H
:
ŒŒH I
false
ŒŒJ O
)
ŒŒO P
,
ŒŒP Q
CurrentRound
œœ  
=
œœ! "
table
œœ# (
.
œœ( )
Column
œœ) /
<
œœ/ 0
int
œœ0 3
>
œœ3 4
(
œœ4 5
type
œœ5 9
:
œœ9 :
$str
œœ; D
,
œœD E
nullable
œœF N
:
œœN O
false
œœP U
)
œœU V
,
œœV W
EndgameStrategy
–– #
=
––$ %
table
––& +
.
––+ ,
Column
––, 2
<
––2 3
string
––3 9
>
––9 :
(
––: ;
type
––; ?
:
––? @
$str
––A G
,
––G H
nullable
––I Q
:
––Q R
true
––S W
)
––W X
,
––X Y
WinnerId
—— 
=
—— 
table
—— $
.
——$ %
Column
——% +
<
——+ ,
string
——, 2
>
——2 3
(
——3 4
type
——4 8
:
——8 9
$str
——: @
,
——@ A
nullable
——B J
:
——J K
true
——L P
)
——P Q
}
““ 
,
““ 
constraints
”” 
:
”” 
table
”” "
=>
””# %
{
‘‘ 
table
’’ 
.
’’ 

PrimaryKey
’’ $
(
’’$ %
$str
’’% 5
,
’’5 6
x
’’7 8
=>
’’9 ;
x
’’< =
.
’’= >
Id
’’> @
)
’’@ A
;
’’A B
table
÷÷ 
.
÷÷ 

ForeignKey
÷÷ $
(
÷÷$ %
name
◊◊ 
:
◊◊ 
$str
◊◊ C
,
◊◊C D
column
ÿÿ 
:
ÿÿ 
x
ÿÿ  !
=>
ÿÿ" $
x
ÿÿ% &
.
ÿÿ& '
WinnerId
ÿÿ' /
,
ÿÿ/ 0
principalTable
ŸŸ &
:
ŸŸ& '
$str
ŸŸ( 5
,
ŸŸ5 6
principalColumn
⁄⁄ '
:
⁄⁄' (
$str
⁄⁄) -
)
⁄⁄- .
;
⁄⁄. /
}
€€ 
)
€€ 
;
€€ 
migrationBuilder
›› 
.
›› 
CreateTable
›› (
(
››( )
name
ﬁﬁ 
:
ﬁﬁ 
$str
ﬁﬁ '
,
ﬁﬁ' (
columns
ﬂﬂ 
:
ﬂﬂ 
table
ﬂﬂ 
=>
ﬂﬂ !
new
ﬂﬂ" %
{
‡‡ 
Id
·· 
=
·· 
table
·· 
.
·· 
Column
·· %
<
··% &
Guid
··& *
>
··* +
(
··+ ,
type
··, 0
:
··0 1
$str
··2 8
,
··8 9
nullable
··: B
:
··B C
false
··D I
)
··I J
,
··J K
AchievementId
‚‚ !
=
‚‚" #
table
‚‚$ )
.
‚‚) *
Column
‚‚* 0
<
‚‚0 1
Guid
‚‚1 5
>
‚‚5 6
(
‚‚6 7
type
‚‚7 ;
:
‚‚; <
$str
‚‚= C
,
‚‚C D
nullable
‚‚E M
:
‚‚M N
false
‚‚O T
)
‚‚T U
,
‚‚U V
UserId
„„ 
=
„„ 
table
„„ "
.
„„" #
Column
„„# )
<
„„) *
string
„„* 0
>
„„0 1
(
„„1 2
type
„„2 6
:
„„6 7
$str
„„8 >
,
„„> ?
nullable
„„@ H
:
„„H I
true
„„J N
)
„„N O
}
‰‰ 
,
‰‰ 
constraints
ÂÂ 
:
ÂÂ 
table
ÂÂ "
=>
ÂÂ# %
{
ÊÊ 
table
ÁÁ 
.
ÁÁ 

PrimaryKey
ÁÁ $
(
ÁÁ$ %
$str
ÁÁ% 9
,
ÁÁ9 :
x
ÁÁ; <
=>
ÁÁ= ?
x
ÁÁ@ A
.
ÁÁA B
Id
ÁÁB D
)
ÁÁD E
;
ÁÁE F
table
ËË 
.
ËË 

ForeignKey
ËË $
(
ËË$ %
name
ÈÈ 
:
ÈÈ 
$str
ÈÈ M
,
ÈÈM N
column
ÍÍ 
:
ÍÍ 
x
ÍÍ  !
=>
ÍÍ" $
x
ÍÍ% &
.
ÍÍ& '
AchievementId
ÍÍ' 4
,
ÍÍ4 5
principalTable
ÎÎ &
:
ÎÎ& '
$str
ÎÎ( 6
,
ÎÎ6 7
principalColumn
ÏÏ '
:
ÏÏ' (
$str
ÏÏ) -
,
ÏÏ- .
onDelete
ÌÌ  
:
ÌÌ  !
ReferentialAction
ÌÌ" 3
.
ÌÌ3 4
Cascade
ÌÌ4 ;
)
ÌÌ; <
;
ÌÌ< =
table
ÓÓ 
.
ÓÓ 

ForeignKey
ÓÓ $
(
ÓÓ$ %
name
ÔÔ 
:
ÔÔ 
$str
ÔÔ E
,
ÔÔE F
column
 
:
 
x
  !
=>
" $
x
% &
.
& '
UserId
' -
,
- .
principalTable
ÒÒ &
:
ÒÒ& '
$str
ÒÒ( 5
,
ÒÒ5 6
principalColumn
ÚÚ '
:
ÚÚ' (
$str
ÚÚ) -
)
ÚÚ- .
;
ÚÚ. /
}
ÛÛ 
)
ÛÛ 
;
ÛÛ 
migrationBuilder
ıı 
.
ıı 
CreateTable
ıı (
(
ıı( )
name
ˆˆ 
:
ˆˆ 
$str
ˆˆ $
,
ˆˆ$ %
columns
˜˜ 
:
˜˜ 
table
˜˜ 
=>
˜˜ !
new
˜˜" %
{
¯¯ 
Id
˘˘ 
=
˘˘ 
table
˘˘ 
.
˘˘ 
Column
˘˘ %
<
˘˘% &
Guid
˘˘& *
>
˘˘* +
(
˘˘+ ,
type
˘˘, 0
:
˘˘0 1
$str
˘˘2 8
,
˘˘8 9
nullable
˘˘: B
:
˘˘B C
false
˘˘D I
)
˘˘I J
,
˘˘J K
Name
˙˙ 
=
˙˙ 
table
˙˙  
.
˙˙  !
Column
˙˙! '
<
˙˙' (
string
˙˙( .
>
˙˙. /
(
˙˙/ 0
type
˙˙0 4
:
˙˙4 5
$str
˙˙6 <
,
˙˙< =
nullable
˙˙> F
:
˙˙F G
true
˙˙H L
)
˙˙L M
,
˙˙M N
Description
˚˚ 
=
˚˚  !
table
˚˚" '
.
˚˚' (
Column
˚˚( .
<
˚˚. /
string
˚˚/ 5
>
˚˚5 6
(
˚˚6 7
type
˚˚7 ;
:
˚˚; <
$str
˚˚= C
,
˚˚C D
nullable
˚˚E M
:
˚˚M N
true
˚˚O S
)
˚˚S T
,
˚˚T U
UserId
¸¸ 
=
¸¸ 
table
¸¸ "
.
¸¸" #
Column
¸¸# )
<
¸¸) *
string
¸¸* 0
>
¸¸0 1
(
¸¸1 2
type
¸¸2 6
:
¸¸6 7
$str
¸¸8 >
,
¸¸> ?
nullable
¸¸@ H
:
¸¸H I
true
¸¸J N
)
¸¸N O
,
¸¸O P
ShipId
˝˝ 
=
˝˝ 
table
˝˝ "
.
˝˝" #
Column
˝˝# )
<
˝˝) *
Guid
˝˝* .
>
˝˝. /
(
˝˝/ 0
type
˝˝0 4
:
˝˝4 5
$str
˝˝6 <
,
˝˝< =
nullable
˝˝> F
:
˝˝F G
true
˝˝H L
)
˝˝L M
}
˛˛ 
,
˛˛ 
constraints
ˇˇ 
:
ˇˇ 
table
ˇˇ "
=>
ˇˇ# %
{
ÄÄ 
table
ÅÅ 
.
ÅÅ 

PrimaryKey
ÅÅ $
(
ÅÅ$ %
$str
ÅÅ% 6
,
ÅÅ6 7
x
ÅÅ8 9
=>
ÅÅ: <
x
ÅÅ= >
.
ÅÅ> ?
Id
ÅÅ? A
)
ÅÅA B
;
ÅÅB C
table
ÇÇ 
.
ÇÇ 

ForeignKey
ÇÇ $
(
ÇÇ$ %
name
ÉÉ 
:
ÉÉ 
$str
ÉÉ B
,
ÉÉB C
column
ÑÑ 
:
ÑÑ 
x
ÑÑ  !
=>
ÑÑ" $
x
ÑÑ% &
.
ÑÑ& '
UserId
ÑÑ' -
,
ÑÑ- .
principalTable
ÖÖ &
:
ÖÖ& '
$str
ÖÖ( 5
,
ÖÖ5 6
principalColumn
ÜÜ '
:
ÜÜ' (
$str
ÜÜ) -
)
ÜÜ- .
;
ÜÜ. /
table
áá 
.
áá 

ForeignKey
áá $
(
áá$ %
name
àà 
:
àà 
$str
àà ;
,
àà; <
column
ââ 
:
ââ 
x
ââ  !
=>
ââ" $
x
ââ% &
.
ââ& '
ShipId
ââ' -
,
ââ- .
principalTable
ää &
:
ää& '
$str
ää( .
,
ää. /
principalColumn
ãã '
:
ãã' (
$str
ãã) -
)
ãã- .
;
ãã. /
}
åå 
)
åå 
;
åå 
migrationBuilder
éé 
.
éé 
CreateTable
éé (
(
éé( )
name
èè 
:
èè 
$str
èè +
,
èè+ ,
columns
êê 
:
êê 
table
êê 
=>
êê !
new
êê" %
{
ëë 
Id
íí 
=
íí 
table
íí 
.
íí 
Column
íí %
<
íí% &
Guid
íí& *
>
íí* +
(
íí+ ,
type
íí, 0
:
íí0 1
$str
íí2 8
,
íí8 9
nullable
íí: B
:
ííB C
false
ííD I
)
ííI J
,
ííJ K
GameSessionId
ìì !
=
ìì" #
table
ìì$ )
.
ìì) *
Column
ìì* 0
<
ìì0 1
Guid
ìì1 5
>
ìì5 6
(
ìì6 7
type
ìì7 ;
:
ìì; <
$str
ìì= C
,
ììC D
nullable
ììE M
:
ììM N
false
ììO T
)
ììT U
,
ììU V
GridSize
îî 
=
îî 
table
îî $
.
îî$ %
Column
îî% +
<
îî+ ,
string
îî, 2
>
îî2 3
(
îî3 4
type
îî4 8
:
îî8 9
$str
îî: @
,
îî@ A
nullable
îîB J
:
îîJ K
true
îîL P
)
îîP Q
,
îîQ R
ColumnCount
ïï 
=
ïï  !
table
ïï" '
.
ïï' (
Column
ïï( .
<
ïï. /
int
ïï/ 2
>
ïï2 3
(
ïï3 4
type
ïï4 8
:
ïï8 9
$str
ïï: C
,
ïïC D
nullable
ïïE M
:
ïïM N
false
ïïO T
)
ïïT U
,
ïïU V
RowCount
ññ 
=
ññ 
table
ññ $
.
ññ$ %
Column
ññ% +
<
ññ+ ,
int
ññ, /
>
ññ/ 0
(
ññ0 1
type
ññ1 5
:
ññ5 6
$str
ññ7 @
,
ññ@ A
nullable
ññB J
:
ññJ K
false
ññL Q
)
ññQ R
,
ññR S
GameType
óó 
=
óó 
table
óó $
.
óó$ %
Column
óó% +
<
óó+ ,
int
óó, /
>
óó/ 0
(
óó0 1
type
óó1 5
:
óó5 6
$str
óó7 @
,
óó@ A
nullable
óóB J
:
óóJ K
false
óóL Q
)
óóQ R
,
óóR S'
RoundCountLimitForEndgame
òò -
=
òò. /
table
òò0 5
.
òò5 6
Column
òò6 <
<
òò< =
int
òò= @
>
òò@ A
(
òòA B
type
òòB F
:
òòF G
$str
òòH Q
,
òòQ R
nullable
òòS [
:
òò[ \
false
òò] b
)
òòb c
,
òòc d0
"DestroyedShipsPercentageForEndgame
ôô 6
=
ôô7 8
table
ôô9 >
.
ôô> ?
Column
ôô? E
<
ôôE F
int
ôôF I
>
ôôI J
(
ôôJ K
type
ôôK O
:
ôôO P
$str
ôôQ Z
,
ôôZ [
nullable
ôô\ d
:
ôôd e
false
ôôf k
)
ôôk l
,
ôôl m*
DestroyedShipCountForEndgame
öö 0
=
öö1 2
table
öö3 8
.
öö8 9
Column
öö9 ?
<
öö? @
int
öö@ C
>
ööC D
(
ööD E
type
ööE I
:
ööI J
$str
ööK T
,
ööT U
nullable
ööV ^
:
öö^ _
false
öö` e
)
ööe f
}
õõ 
,
õõ 
constraints
úú 
:
úú 
table
úú "
=>
úú# %
{
ùù 
table
ûû 
.
ûû 

PrimaryKey
ûû $
(
ûû$ %
$str
ûû% =
,
ûû= >
x
ûû? @
=>
ûûA C
x
ûûD E
.
ûûE F
Id
ûûF H
)
ûûH I
;
ûûI J
table
üü 
.
üü 

ForeignKey
üü $
(
üü$ %
name
†† 
:
†† 
$str
†† P
,
††P Q
column
°° 
:
°° 
x
°°  !
=>
°°" $
x
°°% &
.
°°& '
GameSessionId
°°' 4
,
°°4 5
principalTable
¢¢ &
:
¢¢& '
$str
¢¢( 5
,
¢¢5 6
principalColumn
££ '
:
££' (
$str
££) -
,
££- .
onDelete
§§  
:
§§  !
ReferentialAction
§§" 3
.
§§3 4
Cascade
§§4 ;
)
§§; <
;
§§< =
}
•• 
)
•• 
;
•• 
migrationBuilder
ßß 
.
ßß 
CreateTable
ßß (
(
ßß( )
name
®® 
:
®® 
$str
®® 
,
®® 
columns
©© 
:
©© 
table
©© 
=>
©© !
new
©©" %
{
™™ 
Id
´´ 
=
´´ 
table
´´ 
.
´´ 
Column
´´ %
<
´´% &
Guid
´´& *
>
´´* +
(
´´+ ,
type
´´, 0
:
´´0 1
$str
´´2 8
,
´´8 9
nullable
´´: B
:
´´B C
false
´´D I
)
´´I J
,
´´J K
GameSessionId
¨¨ !
=
¨¨" #
table
¨¨$ )
.
¨¨) *
Column
¨¨* 0
<
¨¨0 1
Guid
¨¨1 5
>
¨¨5 6
(
¨¨6 7
type
¨¨7 ;
:
¨¨; <
$str
¨¨= C
,
¨¨C D
nullable
¨¨E M
:
¨¨M N
false
¨¨O T
)
¨¨T U
,
¨¨U V
IsHost
≠≠ 
=
≠≠ 
table
≠≠ "
.
≠≠" #
Column
≠≠# )
<
≠≠) *
bool
≠≠* .
>
≠≠. /
(
≠≠/ 0
type
≠≠0 4
:
≠≠4 5
$str
≠≠6 ?
,
≠≠? @
nullable
≠≠A I
:
≠≠I J
false
≠≠K P
)
≠≠P Q
,
≠≠Q R
UserId
ÆÆ 
=
ÆÆ 
table
ÆÆ "
.
ÆÆ" #
Column
ÆÆ# )
<
ÆÆ) *
string
ÆÆ* 0
>
ÆÆ0 1
(
ÆÆ1 2
type
ÆÆ2 6
:
ÆÆ6 7
$str
ÆÆ8 >
,
ÆÆ> ?
nullable
ÆÆ@ H
:
ÆÆH I
true
ÆÆJ N
)
ÆÆN O
}
ØØ 
,
ØØ 
constraints
∞∞ 
:
∞∞ 
table
∞∞ "
=>
∞∞# %
{
±± 
table
≤≤ 
.
≤≤ 

PrimaryKey
≤≤ $
(
≤≤$ %
$str
≤≤% 0
,
≤≤0 1
x
≤≤2 3
=>
≤≤4 6
x
≤≤7 8
.
≤≤8 9
Id
≤≤9 ;
)
≤≤; <
;
≤≤< =
table
≥≥ 
.
≥≥ 

ForeignKey
≥≥ $
(
≥≥$ %
name
¥¥ 
:
¥¥ 
$str
¥¥ <
,
¥¥< =
column
µµ 
:
µµ 
x
µµ  !
=>
µµ" $
x
µµ% &
.
µµ& '
UserId
µµ' -
,
µµ- .
principalTable
∂∂ &
:
∂∂& '
$str
∂∂( 5
,
∂∂5 6
principalColumn
∑∑ '
:
∑∑' (
$str
∑∑) -
)
∑∑- .
;
∑∑. /
table
∏∏ 
.
∏∏ 

ForeignKey
∏∏ $
(
∏∏$ %
name
ππ 
:
ππ 
$str
ππ C
,
ππC D
column
∫∫ 
:
∫∫ 
x
∫∫  !
=>
∫∫" $
x
∫∫% &
.
∫∫& '
GameSessionId
∫∫' 4
,
∫∫4 5
principalTable
ªª &
:
ªª& '
$str
ªª( 5
,
ªª5 6
principalColumn
ºº '
:
ºº' (
$str
ºº) -
,
ºº- .
onDelete
ΩΩ  
:
ΩΩ  !
ReferentialAction
ΩΩ" 3
.
ΩΩ3 4
Cascade
ΩΩ4 ;
)
ΩΩ; <
;
ΩΩ< =
}
ææ 
)
ææ 
;
ææ 
migrationBuilder
¿¿ 
.
¿¿ 
CreateTable
¿¿ (
(
¿¿( )
name
¡¡ 
:
¡¡ 
$str
¡¡ "
,
¡¡" #
columns
¬¬ 
:
¬¬ 
table
¬¬ 
=>
¬¬ !
new
¬¬" %
{
√√ 
Id
ƒƒ 
=
ƒƒ 
table
ƒƒ 
.
ƒƒ 
Column
ƒƒ %
<
ƒƒ% &
Guid
ƒƒ& *
>
ƒƒ* +
(
ƒƒ+ ,
type
ƒƒ, 0
:
ƒƒ0 1
$str
ƒƒ2 8
,
ƒƒ8 9
nullable
ƒƒ: B
:
ƒƒB C
false
ƒƒD I
)
ƒƒI J
,
ƒƒJ K
PlayerId
≈≈ 
=
≈≈ 
table
≈≈ $
.
≈≈$ %
Column
≈≈% +
<
≈≈+ ,
Guid
≈≈, 0
>
≈≈0 1
(
≈≈1 2
type
≈≈2 6
:
≈≈6 7
$str
≈≈8 >
,
≈≈> ?
nullable
≈≈@ H
:
≈≈H I
false
≈≈J O
)
≈≈O P
,
≈≈P Q
ShipId
∆∆ 
=
∆∆ 
table
∆∆ "
.
∆∆" #
Column
∆∆# )
<
∆∆) *
Guid
∆∆* .
>
∆∆. /
(
∆∆/ 0
type
∆∆0 4
:
∆∆4 5
$str
∆∆6 <
,
∆∆< =
nullable
∆∆> F
:
∆∆F G
false
∆∆H M
)
∆∆M N
}
«« 
,
«« 
constraints
»» 
:
»» 
table
»» "
=>
»»# %
{
…… 
table
   
.
   

PrimaryKey
   $
(
  $ %
$str
  % 4
,
  4 5
x
  6 7
=>
  8 :
x
  ; <
.
  < =
Id
  = ?
)
  ? @
;
  @ A
table
ÀÀ 
.
ÀÀ 

ForeignKey
ÀÀ $
(
ÀÀ$ %
name
ÃÃ 
:
ÃÃ 
$str
ÃÃ =
,
ÃÃ= >
column
ÕÕ 
:
ÕÕ 
x
ÕÕ  !
=>
ÕÕ" $
x
ÕÕ% &
.
ÕÕ& '
PlayerId
ÕÕ' /
,
ÕÕ/ 0
principalTable
ŒŒ &
:
ŒŒ& '
$str
ŒŒ( 0
,
ŒŒ0 1
principalColumn
œœ '
:
œœ' (
$str
œœ) -
,
œœ- .
onDelete
––  
:
––  !
ReferentialAction
––" 3
.
––3 4
Cascade
––4 ;
)
––; <
;
––< =
table
—— 
.
—— 

ForeignKey
—— $
(
——$ %
name
““ 
:
““ 
$str
““ 9
,
““9 :
column
”” 
:
”” 
x
””  !
=>
””" $
x
””% &
.
””& '
ShipId
””' -
,
””- .
principalTable
‘‘ &
:
‘‘& '
$str
‘‘( .
,
‘‘. /
principalColumn
’’ '
:
’’' (
$str
’’) -
,
’’- .
onDelete
÷÷  
:
÷÷  !
ReferentialAction
÷÷" 3
.
÷÷3 4
Cascade
÷÷4 ;
)
÷÷; <
;
÷÷< =
}
◊◊ 
)
◊◊ 
;
◊◊ 
migrationBuilder
ŸŸ 
.
ŸŸ 
CreateTable
ŸŸ (
(
ŸŸ( )
name
⁄⁄ 
:
⁄⁄ 
$str
⁄⁄  
,
⁄⁄  !
columns
€€ 
:
€€ 
table
€€ 
=>
€€ !
new
€€" %
{
‹‹ 
Id
›› 
=
›› 
table
›› 
.
›› 
Column
›› %
<
››% &
Guid
››& *
>
››* +
(
››+ ,
type
››, 0
:
››0 1
$str
››2 8
,
››8 9
nullable
››: B
:
››B C
false
››D I
)
››I J
,
››J K
XCoordinate
ﬁﬁ 
=
ﬁﬁ  !
table
ﬁﬁ" '
.
ﬁﬁ' (
Column
ﬁﬁ( .
<
ﬁﬁ. /
int
ﬁﬁ/ 2
>
ﬁﬁ2 3
(
ﬁﬁ3 4
type
ﬁﬁ4 8
:
ﬁﬁ8 9
$str
ﬁﬁ: C
,
ﬁﬁC D
nullable
ﬁﬁE M
:
ﬁﬁM N
false
ﬁﬁO T
)
ﬁﬁT U
,
ﬁﬁU V
YCoordinate
ﬂﬂ 
=
ﬂﬂ  !
table
ﬂﬂ" '
.
ﬂﬂ' (
Column
ﬂﬂ( .
<
ﬂﬂ. /
int
ﬂﬂ/ 2
>
ﬂﬂ2 3
(
ﬂﬂ3 4
type
ﬂﬂ4 8
:
ﬂﬂ8 9
$str
ﬂﬂ: C
,
ﬂﬂC D
nullable
ﬂﬂE M
:
ﬂﬂM N
false
ﬂﬂO T
)
ﬂﬂT U
,
ﬂﬂU V
IsDestroyed
‡‡ 
=
‡‡  !
table
‡‡" '
.
‡‡' (
Column
‡‡( .
<
‡‡. /
bool
‡‡/ 3
>
‡‡3 4
(
‡‡4 5
type
‡‡5 9
:
‡‡9 :
$str
‡‡; D
,
‡‡D E
nullable
‡‡F N
:
‡‡N O
false
‡‡P U
)
‡‡U V
,
‡‡V W
PlayerShipId
··  
=
··! "
table
··# (
.
··( )
Column
··) /
<
··/ 0
Guid
··0 4
>
··4 5
(
··5 6
type
··6 :
:
··: ;
$str
··< B
,
··B C
nullable
··D L
:
··L M
false
··N S
)
··S T
}
‚‚ 
,
‚‚ 
constraints
„„ 
:
„„ 
table
„„ "
=>
„„# %
{
‰‰ 
table
ÂÂ 
.
ÂÂ 

PrimaryKey
ÂÂ $
(
ÂÂ$ %
$str
ÂÂ% 2
,
ÂÂ2 3
x
ÂÂ4 5
=>
ÂÂ6 8
x
ÂÂ9 :
.
ÂÂ: ;
Id
ÂÂ; =
)
ÂÂ= >
;
ÂÂ> ?
table
ÊÊ 
.
ÊÊ 

ForeignKey
ÊÊ $
(
ÊÊ$ %
name
ÁÁ 
:
ÁÁ 
$str
ÁÁ C
,
ÁÁC D
column
ËË 
:
ËË 
x
ËË  !
=>
ËË" $
x
ËË% &
.
ËË& '
PlayerShipId
ËË' 3
,
ËË3 4
principalTable
ÈÈ &
:
ÈÈ& '
$str
ÈÈ( 4
,
ÈÈ4 5
principalColumn
ÍÍ '
:
ÍÍ' (
$str
ÍÍ) -
,
ÍÍ- .
onDelete
ÎÎ  
:
ÎÎ  !
ReferentialAction
ÎÎ" 3
.
ÎÎ3 4
Cascade
ÎÎ4 ;
)
ÎÎ; <
;
ÎÎ< =
}
ÏÏ 
)
ÏÏ 
;
ÏÏ 
migrationBuilder
ÓÓ 
.
ÓÓ 
CreateIndex
ÓÓ (
(
ÓÓ( )
name
ÔÔ 
:
ÔÔ 
$str
ÔÔ 2
,
ÔÔ2 3
table
 
:
 
$str
 )
,
) *
column
ÒÒ 
:
ÒÒ 
$str
ÒÒ  
)
ÒÒ  !
;
ÒÒ! "
migrationBuilder
ÛÛ 
.
ÛÛ 
CreateIndex
ÛÛ (
(
ÛÛ( )
name
ÙÙ 
:
ÙÙ 
$str
ÙÙ %
,
ÙÙ% &
table
ıı 
:
ıı 
$str
ıı $
,
ıı$ %
column
ˆˆ 
:
ˆˆ 
$str
ˆˆ (
,
ˆˆ( )
unique
˜˜ 
:
˜˜ 
true
˜˜ 
)
˜˜ 
;
˜˜ 
migrationBuilder
˘˘ 
.
˘˘ 
CreateIndex
˘˘ (
(
˘˘( )
name
˙˙ 
:
˙˙ 
$str
˙˙ 2
,
˙˙2 3
table
˚˚ 
:
˚˚ 
$str
˚˚ )
,
˚˚) *
column
¸¸ 
:
¸¸ 
$str
¸¸  
)
¸¸  !
;
¸¸! "
migrationBuilder
˛˛ 
.
˛˛ 
CreateIndex
˛˛ (
(
˛˛( )
name
ˇˇ 
:
ˇˇ 
$str
ˇˇ 2
,
ˇˇ2 3
table
ÄÄ 
:
ÄÄ 
$str
ÄÄ )
,
ÄÄ) *
column
ÅÅ 
:
ÅÅ 
$str
ÅÅ  
)
ÅÅ  !
;
ÅÅ! "
migrationBuilder
ÉÉ 
.
ÉÉ 
CreateIndex
ÉÉ (
(
ÉÉ( )
name
ÑÑ 
:
ÑÑ 
$str
ÑÑ 1
,
ÑÑ1 2
table
ÖÖ 
:
ÖÖ 
$str
ÖÖ (
,
ÖÖ( )
column
ÜÜ 
:
ÜÜ 
$str
ÜÜ  
)
ÜÜ  !
;
ÜÜ! "
migrationBuilder
àà 
.
àà 
CreateIndex
àà (
(
àà( )
name
ââ 
:
ââ 
$str
ââ "
,
ââ" #
table
ää 
:
ää 
$str
ää $
,
ää$ %
column
ãã 
:
ãã 
$str
ãã )
)
ãã) *
;
ãã* +
migrationBuilder
çç 
.
çç 
CreateIndex
çç (
(
çç( )
name
éé 
:
éé 
$str
éé 4
,
éé4 5
table
èè 
:
èè 
$str
èè $
,
èè$ %
column
êê 
:
êê 
$str
êê '
)
êê' (
;
êê( )
migrationBuilder
íí 
.
íí 
CreateIndex
íí (
(
íí( )
name
ìì 
:
ìì 
$str
ìì %
,
ìì% &
table
îî 
:
îî 
$str
îî $
,
îî$ %
column
ïï 
:
ïï 
$str
ïï ,
,
ïï, -
unique
ññ 
:
ññ 
true
ññ 
)
ññ 
;
ññ 
migrationBuilder
òò 
.
òò 
CreateIndex
òò (
(
òò( )
name
ôô 
:
ôô 
$str
ôô /
,
ôô/ 0
table
öö 
:
öö 
$str
öö $
,
öö$ %
column
õõ 
:
õõ 
$str
õõ "
)
õõ" #
;
õõ# $
migrationBuilder
ùù 
.
ùù 
CreateIndex
ùù (
(
ùù( )
name
ûû 
:
ûû 
$str
ûû <
,
ûû< =
table
üü 
:
üü 
$str
üü ,
,
üü, -
column
†† 
:
†† 
$str
†† '
,
††' (
unique
°° 
:
°° 
true
°° 
)
°° 
;
°° 
migrationBuilder
££ 
.
££ 
CreateIndex
££ (
(
££( )
name
§§ 
:
§§ 
$str
§§ /
,
§§/ 0
table
•• 
:
•• 
$str
•• 
,
••  
column
¶¶ 
:
¶¶ 
$str
¶¶ '
)
¶¶' (
;
¶¶( )
migrationBuilder
®® 
.
®® 
CreateIndex
®® (
(
®®( )
name
©© 
:
©© 
$str
©© (
,
©©( )
table
™™ 
:
™™ 
$str
™™ 
,
™™  
column
´´ 
:
´´ 
$str
´´  
)
´´  !
;
´´! "
migrationBuilder
≠≠ 
.
≠≠ 
CreateIndex
≠≠ (
(
≠≠( )
name
ÆÆ 
:
ÆÆ 
$str
ÆÆ .
,
ÆÆ. /
table
ØØ 
:
ØØ 
$str
ØØ #
,
ØØ# $
column
∞∞ 
:
∞∞ 
$str
∞∞ "
)
∞∞" #
;
∞∞# $
migrationBuilder
≤≤ 
.
≤≤ 
CreateIndex
≤≤ (
(
≤≤( )
name
≥≥ 
:
≥≥ 
$str
≥≥ ,
,
≥≥, -
table
¥¥ 
:
¥¥ 
$str
¥¥ #
,
¥¥# $
column
µµ 
:
µµ 
$str
µµ  
)
µµ  !
;
µµ! "
migrationBuilder
∑∑ 
.
∑∑ 
CreateIndex
∑∑ (
(
∑∑( )
name
∏∏ 
:
∏∏ 
$str
∏∏ 0
,
∏∏0 1
table
ππ 
:
ππ 
$str
ππ !
,
ππ! "
column
∫∫ 
:
∫∫ 
$str
∫∫ &
)
∫∫& '
;
∫∫' (
migrationBuilder
ºº 
.
ºº 
CreateIndex
ºº (
(
ºº( )
name
ΩΩ 
:
ΩΩ 
$str
ΩΩ 8
,
ΩΩ8 9
table
ææ 
:
ææ 
$str
ææ (
,
ææ( )
column
øø 
:
øø 
$str
øø '
)
øø' (
;
øø( )
migrationBuilder
¡¡ 
.
¡¡ 
CreateIndex
¡¡ (
(
¡¡( )
name
¬¬ 
:
¬¬ 
$str
¬¬ 1
,
¬¬1 2
table
√√ 
:
√√ 
$str
√√ (
,
√√( )
column
ƒƒ 
:
ƒƒ 
$str
ƒƒ  
)
ƒƒ  !
;
ƒƒ! "
migrationBuilder
∆∆ 
.
∆∆ 
CreateIndex
∆∆ (
(
∆∆( )
name
«« 
:
«« 
$str
«« .
,
««. /
table
»» 
:
»» 
$str
»» %
,
»»% &
column
…… 
:
…… 
$str
……  
)
……  !
;
……! "
migrationBuilder
ÀÀ 
.
ÀÀ 
CreateIndex
ÀÀ (
(
ÀÀ( )
name
ÃÃ 
:
ÃÃ 
$str
ÃÃ .
,
ÃÃ. /
table
ÕÕ 
:
ÕÕ 
$str
ÕÕ %
,
ÕÕ% &
column
ŒŒ 
:
ŒŒ 
$str
ŒŒ  
)
ŒŒ  !
;
ŒŒ! "
}
œœ 	
	protected
—— 
override
—— 
void
—— 
Down
——  $
(
——$ %
MigrationBuilder
——% 5
migrationBuilder
——6 F
)
——F G
{
““ 	
migrationBuilder
”” 
.
”” 
	DropTable
”” &
(
””& '
name
‘‘ 
:
‘‘ 
$str
‘‘ (
)
‘‘( )
;
‘‘) *
migrationBuilder
÷÷ 
.
÷÷ 
	DropTable
÷÷ &
(
÷÷& '
name
◊◊ 
:
◊◊ 
$str
◊◊ (
)
◊◊( )
;
◊◊) *
migrationBuilder
ŸŸ 
.
ŸŸ 
	DropTable
ŸŸ &
(
ŸŸ& '
name
⁄⁄ 
:
⁄⁄ 
$str
⁄⁄ (
)
⁄⁄( )
;
⁄⁄) *
migrationBuilder
‹‹ 
.
‹‹ 
	DropTable
‹‹ &
(
‹‹& '
name
›› 
:
›› 
$str
›› '
)
››' (
;
››( )
migrationBuilder
ﬂﬂ 
.
ﬂﬂ 
	DropTable
ﬂﬂ &
(
ﬂﬂ& '
name
‡‡ 
:
‡‡ 
$str
‡‡ (
)
‡‡( )
;
‡‡) *
migrationBuilder
‚‚ 
.
‚‚ 
	DropTable
‚‚ &
(
‚‚& '
name
„„ 
:
„„ 
$str
„„ +
)
„„+ ,
;
„„, -
migrationBuilder
ÂÂ 
.
ÂÂ 
	DropTable
ÂÂ &
(
ÂÂ& '
name
ÊÊ 
:
ÊÊ 
$str
ÊÊ  
)
ÊÊ  !
;
ÊÊ! "
migrationBuilder
ËË 
.
ËË 
	DropTable
ËË &
(
ËË& '
name
ÈÈ 
:
ÈÈ 
$str
ÈÈ '
)
ÈÈ' (
;
ÈÈ( )
migrationBuilder
ÎÎ 
.
ÎÎ 
	DropTable
ÎÎ &
(
ÎÎ& '
name
ÏÏ 
:
ÏÏ 
$str
ÏÏ $
)
ÏÏ$ %
;
ÏÏ% &
migrationBuilder
ÓÓ 
.
ÓÓ 
	DropTable
ÓÓ &
(
ÓÓ& '
name
ÔÔ 
:
ÔÔ 
$str
ÔÔ #
)
ÔÔ# $
;
ÔÔ$ %
migrationBuilder
ÒÒ 
.
ÒÒ 
	DropTable
ÒÒ &
(
ÒÒ& '
name
ÚÚ 
:
ÚÚ 
$str
ÚÚ "
)
ÚÚ" #
;
ÚÚ# $
migrationBuilder
ÙÙ 
.
ÙÙ 
	DropTable
ÙÙ &
(
ÙÙ& '
name
ıı 
:
ıı 
$str
ıı 
)
ıı 
;
ıı  
migrationBuilder
˜˜ 
.
˜˜ 
	DropTable
˜˜ &
(
˜˜& '
name
¯¯ 
:
¯¯ 
$str
¯¯ 
)
¯¯ 
;
¯¯ 
migrationBuilder
˙˙ 
.
˙˙ 
	DropTable
˙˙ &
(
˙˙& '
name
˚˚ 
:
˚˚ 
$str
˚˚ #
)
˚˚# $
;
˚˚$ %
migrationBuilder
˝˝ 
.
˝˝ 
	DropTable
˝˝ &
(
˝˝& '
name
˛˛ 
:
˛˛ 
$str
˛˛ #
)
˛˛# $
;
˛˛$ %
migrationBuilder
ÄÄ 
.
ÄÄ 
	DropTable
ÄÄ &
(
ÄÄ& '
name
ÅÅ 
:
ÅÅ 
$str
ÅÅ $
)
ÅÅ$ %
;
ÅÅ% &
}
ÇÇ 	
}
ÉÉ 
}ÑÑ ∂
HD:\dev\Battleships\Battleships\Migrations\20221103203611_UpdatePlayer.cs
	namespace 	
Battleships
 
. 

Migrations  
{ 
public 

partial 
class 
UpdatePlayer %
:& '
	Migration( 1
{ 
	protected		 
override		 
void		 
Up		  "
(		" #
MigrationBuilder		# 3
migrationBuilder		4 D
)		D E
{

 	
migrationBuilder 
. 
	AddColumn &
<& '
bool' +
>+ ,
(, -
name 
: 
$str +
,+ ,
table 
: 
$str 
,  
type 
: 
$str 
,  
nullable 
: 
false 
,  
defaultValue 
: 
false #
)# $
;$ %
} 	
	protected 
override 
void 
Down  $
($ %
MigrationBuilder% 5
migrationBuilder6 F
)F G
{ 	
migrationBuilder 
. 

DropColumn '
(' (
name 
: 
$str +
,+ ,
table 
: 
$str 
)  
;  !
} 	
} 
} ™+
JD:\dev\Battleships\Battleships\Migrations\20221103225052_UpdateShipTile.cs
	namespace 	
Battleships
 
. 

Migrations  
{ 
public 

partial 
class 
UpdateShipTile '
:( )
	Migration* 3
{		 
	protected

 
override

 
void

 
Up

  "
(

" #
MigrationBuilder

# 3
migrationBuilder

4 D
)

D E
{ 	
migrationBuilder 
. 
DropForeignKey +
(+ ,
name 
: 
$str ;
,; <
table 
: 
$str !
)! "
;" #
migrationBuilder 
. 
AlterColumn (
<( )
Guid) -
>- .
(. /
name 
: 
$str $
,$ %
table 
: 
$str !
,! "
type 
: 
$str 
, 
nullable 
: 
true 
, 

oldClrType 
: 
typeof "
(" #
Guid# '
)' (
,( )
oldType 
: 
$str 
)  
;  !
migrationBuilder 
. 
	AddColumn &
<& '
Guid' +
>+ ,
(, -
name 
: 
$str %
,% &
table 
: 
$str !
,! "
type 
: 
$str 
, 
nullable 
: 
true 
) 
;  
migrationBuilder 
. 
CreateIndex (
(( )
name 
: 
$str 1
,1 2
table   
:   
$str   !
,  ! "
column!! 
:!! 
$str!! '
)!!' (
;!!( )
migrationBuilder## 
.## 
AddForeignKey## *
(##* +
name$$ 
:$$ 
$str$$ 8
,$$8 9
table%% 
:%% 
$str%% !
,%%! "
column&& 
:&& 
$str&& '
,&&' (
principalTable'' 
:'' 
$str''  (
,''( )
principalColumn(( 
:((  
$str((! %
)((% &
;((& '
migrationBuilder** 
.** 
AddForeignKey** *
(*** +
name++ 
:++ 
$str++ ;
,++; <
table,, 
:,, 
$str,, !
,,,! "
column-- 
:-- 
$str-- &
,--& '
principalTable.. 
:.. 
$str..  ,
,.., -
principalColumn// 
://  
$str//! %
)//% &
;//& '
}00 	
	protected22 
override22 
void22 
Down22  $
(22$ %
MigrationBuilder22% 5
migrationBuilder226 F
)22F G
{33 	
migrationBuilder44 
.44 
DropForeignKey44 +
(44+ ,
name55 
:55 
$str55 8
,558 9
table66 
:66 
$str66 !
)66! "
;66" #
migrationBuilder88 
.88 
DropForeignKey88 +
(88+ ,
name99 
:99 
$str99 ;
,99; <
table:: 
::: 
$str:: !
)::! "
;::" #
migrationBuilder<< 
.<< 
	DropIndex<< &
(<<& '
name== 
:== 
$str== 1
,==1 2
table>> 
:>> 
$str>> !
)>>! "
;>>" #
migrationBuilder@@ 
.@@ 

DropColumn@@ '
(@@' (
nameAA 
:AA 
$strAA %
,AA% &
tableBB 
:BB 
$strBB !
)BB! "
;BB" #
migrationBuilderDD 
.DD 
AlterColumnDD (
<DD( )
GuidDD) -
>DD- .
(DD. /
nameEE 
:EE 
$strEE $
,EE$ %
tableFF 
:FF 
$strFF !
,FF! "
typeGG 
:GG 
$strGG 
,GG 
nullableHH 
:HH 
falseHH 
,HH  
defaultValueII 
:II 
newII !
GuidII" &
(II& '
$strII' M
)IIM N
,IIN O

oldClrTypeJJ 
:JJ 
typeofJJ "
(JJ" #
GuidJJ# '
)JJ' (
,JJ( )
oldTypeKK 
:KK 
$strKK 
,KK  
oldNullableLL 
:LL 
trueLL !
)LL! "
;LL" #
migrationBuilderNN 
.NN 
AddForeignKeyNN *
(NN* +
nameOO 
:OO 
$strOO ;
,OO; <
tablePP 
:PP 
$strPP !
,PP! "
columnQQ 
:QQ 
$strQQ &
,QQ& '
principalTableRR 
:RR 
$strRR  ,
,RR, -
principalColumnSS 
:SS  
$strSS! %
,SS% &
onDeleteTT 
:TT 
ReferentialActionTT +
.TT+ ,
CascadeTT, 3
)TT3 4
;TT4 5
}UU 	
}VV 
}WW ‚(
OD:\dev\Battleships\Battleships\Migrations\20221103235240_UpdateShipTileAgain.cs
	namespace 	
Battleships
 
. 

Migrations  
{ 
public 

partial 
class 
UpdateShipTileAgain ,
:- .
	Migration/ 8
{		 
	protected

 
override

 
void

 
Up

  "
(

" #
MigrationBuilder

# 3
migrationBuilder

4 D
)

D E
{ 	
migrationBuilder 
. 
DropForeignKey +
(+ ,
name 
: 
$str 8
,8 9
table 
: 
$str !
)! "
;" #
migrationBuilder 
. 
RenameColumn )
() *
name 
: 
$str %
,% &
table 
: 
$str !
,! "
newName 
: 
$str )
)) *
;* +
migrationBuilder 
. 
RenameIndex (
(( )
name 
: 
$str 1
,1 2
table 
: 
$str !
,! "
newName 
: 
$str 5
)5 6
;6 7
migrationBuilder 
. 
	AddColumn &
<& '
Guid' +
>+ ,
(, -
name 
: 
$str (
,( )
table 
: 
$str !
,! "
type 
: 
$str 
, 
nullable 
: 
true 
) 
;  
migrationBuilder   
.   
CreateIndex   (
(  ( )
name!! 
:!! 
$str!! 4
,!!4 5
table"" 
:"" 
$str"" !
,""! "
column## 
:## 
$str## *
)##* +
;##+ ,
migrationBuilder%% 
.%% 
AddForeignKey%% *
(%%* +
name&& 
:&& 
$str&& ;
,&&; <
table'' 
:'' 
$str'' !
,''! "
column(( 
:(( 
$str(( *
,((* +
principalTable)) 
:)) 
$str))  (
,))( )
principalColumn** 
:**  
$str**! %
)**% &
;**& '
migrationBuilder,, 
.,, 
AddForeignKey,, *
(,,* +
name-- 
:-- 
$str-- 9
,--9 :
table.. 
:.. 
$str.. !
,..! "
column// 
:// 
$str// (
,//( )
principalTable00 
:00 
$str00  (
,00( )
principalColumn11 
:11  
$str11! %
)11% &
;11& '
}22 	
	protected44 
override44 
void44 
Down44  $
(44$ %
MigrationBuilder44% 5
migrationBuilder446 F
)44F G
{55 	
migrationBuilder66 
.66 
DropForeignKey66 +
(66+ ,
name77 
:77 
$str77 ;
,77; <
table88 
:88 
$str88 !
)88! "
;88" #
migrationBuilder:: 
.:: 
DropForeignKey:: +
(::+ ,
name;; 
:;; 
$str;; 9
,;;9 :
table<< 
:<< 
$str<< !
)<<! "
;<<" #
migrationBuilder>> 
.>> 
	DropIndex>> &
(>>& '
name?? 
:?? 
$str?? 4
,??4 5
table@@ 
:@@ 
$str@@ !
)@@! "
;@@" #
migrationBuilderBB 
.BB 

DropColumnBB '
(BB' (
nameCC 
:CC 
$strCC (
,CC( )
tableDD 
:DD 
$strDD !
)DD! "
;DD" #
migrationBuilderFF 
.FF 
RenameColumnFF )
(FF) *
nameGG 
:GG 
$strGG &
,GG& '
tableHH 
:HH 
$strHH !
,HH! "
newNameII 
:II 
$strII (
)II( )
;II) *
migrationBuilderKK 
.KK 
RenameIndexKK (
(KK( )
nameLL 
:LL 
$strLL 2
,LL2 3
tableMM 
:MM 
$strMM !
,MM! "
newNameNN 
:NN 
$strNN 4
)NN4 5
;NN5 6
migrationBuilderPP 
.PP 
AddForeignKeyPP *
(PP* +
nameQQ 
:QQ 
$strQQ 8
,QQ8 9
tableRR 
:RR 
$strRR !
,RR! "
columnSS 
:SS 
$strSS '
,SS' (
principalTableTT 
:TT 
$strTT  (
,TT( )
principalColumnUU 
:UU  
$strUU! %
)UU% &
;UU& '
}VV 	
}WW 
}XX ¸!
HD:\dev\Battleships\Battleships\Migrations\20221104071239_AddShipState.cs
	namespace 	
Battleships
 
. 

Migrations  
{ 
public 

partial 
class 
AddShipState %
:& '
	Migration( 1
{ 
	protected		 
override		 
void		 
Up		  "
(		" #
MigrationBuilder		# 3
migrationBuilder		4 D
)		D E
{

 	
migrationBuilder 
. 
	AddColumn &
<& '
int' *
>* +
(+ ,
name 
: 
$str 
, 
table 
: 
$str !
,! "
type 
: 
$str 
,  
nullable 
: 
false 
,  
defaultValue 
: 
$num 
)  
;  !
migrationBuilder 
. 
	AddColumn &
<& '
int' *
>* +
(+ ,
name 
: 
$str  
,  !
table 
: 
$str !
,! "
type 
: 
$str 
,  
nullable 
: 
false 
,  
defaultValue 
: 
$num 
)  
;  !
migrationBuilder 
. 
	AddColumn &
<& '
int' *
>* +
(+ ,
name 
: 
$str 
, 
table 
: 
$str !
,! "
type 
: 
$str 
,  
nullable 
: 
false 
,  
defaultValue 
: 
$num 
)  
;  !
migrationBuilder   
.   
	AddColumn   &
<  & '
bool  ' +
>  + ,
(  , -
name!! 
:!! 
$str!! "
,!!" #
table"" 
:"" 
$str"" !
,""! "
type## 
:## 
$str## 
,##  
nullable$$ 
:$$ 
false$$ 
,$$  
defaultValue%% 
:%% 
false%% #
)%%# $
;%%$ %
migrationBuilder'' 
.'' 
	AddColumn'' &
<''& '
bool''' +
>''+ ,
('', -
name(( 
:(( 
$str(( 
,(( 
table)) 
:)) 
$str)) !
,))! "
type** 
:** 
$str** 
,**  
nullable++ 
:++ 
false++ 
,++  
defaultValue,, 
:,, 
false,, #
),,# $
;,,$ %
}-- 	
	protected// 
override// 
void// 
Down//  $
(//$ %
MigrationBuilder//% 5
migrationBuilder//6 F
)//F G
{00 	
migrationBuilder11 
.11 

DropColumn11 '
(11' (
name22 
:22 
$str22 
,22 
table33 
:33 
$str33 !
)33! "
;33" #
migrationBuilder55 
.55 

DropColumn55 '
(55' (
name66 
:66 
$str66  
,66  !
table77 
:77 
$str77 !
)77! "
;77" #
migrationBuilder99 
.99 

DropColumn99 '
(99' (
name:: 
::: 
$str:: 
,:: 
table;; 
:;; 
$str;; !
);;! "
;;;" #
migrationBuilder== 
.== 

DropColumn== '
(==' (
name>> 
:>> 
$str>> "
,>>" #
table?? 
:?? 
$str?? !
)??! "
;??" #
migrationBuilderAA 
.AA 

DropColumnAA '
(AA' (
nameBB 
:BB 
$strBB 
,BB 
tableCC 
:CC 
$strCC !
)CC! "
;CC" #
}DD 	
}EE 
}FF Ù!
DD:\dev\Battleships\Battleships\Migrations\20221122173954_NewInit2.cs
	namespace 	
Battleships
 
. 

Migrations  
{ 
public 

partial 
class 
NewInit2 !
:" #
	Migration$ -
{ 
	protected		 
override		 
void		 
Up		  "
(		" #
MigrationBuilder		# 3
migrationBuilder		4 D
)		D E
{

 	
migrationBuilder 
. 
	AddColumn &
<& '
int' *
>* +
(+ ,
name 
: 
$str 
, 
table 
: 
$str !
,! "
type 
: 
$str 
,  
nullable 
: 
false 
,  
defaultValue 
: 
$num 
)  
;  !
migrationBuilder 
. 
	AddColumn &
<& '
int' *
>* +
(+ ,
name 
: 
$str  
,  !
table 
: 
$str !
,! "
type 
: 
$str 
,  
nullable 
: 
false 
,  
defaultValue 
: 
$num 
)  
;  !
migrationBuilder 
. 
	AddColumn &
<& '
int' *
>* +
(+ ,
name 
: 
$str 
, 
table 
: 
$str !
,! "
type 
: 
$str 
,  
nullable 
: 
false 
,  
defaultValue 
: 
$num 
)  
;  !
migrationBuilder   
.   
	AddColumn   &
<  & '
bool  ' +
>  + ,
(  , -
name!! 
:!! 
$str!! "
,!!" #
table"" 
:"" 
$str"" !
,""! "
type## 
:## 
$str## 
,##  
nullable$$ 
:$$ 
false$$ 
,$$  
defaultValue%% 
:%% 
false%% #
)%%# $
;%%$ %
migrationBuilder'' 
.'' 
	AddColumn'' &
<''& '
bool''' +
>''+ ,
('', -
name(( 
:(( 
$str(( 
,(( 
table)) 
:)) 
$str)) !
,))! "
type** 
:** 
$str** 
,**  
nullable++ 
:++ 
false++ 
,++  
defaultValue,, 
:,, 
false,, #
),,# $
;,,$ %
}-- 	
	protected// 
override// 
void// 
Down//  $
(//$ %
MigrationBuilder//% 5
migrationBuilder//6 F
)//F G
{00 	
migrationBuilder11 
.11 

DropColumn11 '
(11' (
name22 
:22 
$str22 
,22 
table33 
:33 
$str33 !
)33! "
;33" #
migrationBuilder55 
.55 

DropColumn55 '
(55' (
name66 
:66 
$str66  
,66  !
table77 
:77 
$str77 !
)77! "
;77" #
migrationBuilder99 
.99 

DropColumn99 '
(99' (
name:: 
::: 
$str:: 
,:: 
table;; 
:;; 
$str;; !
);;! "
;;;" #
migrationBuilder== 
.== 

DropColumn== '
(==' (
name>> 
:>> 
$str>> "
,>>" #
table?? 
:?? 
$str?? !
)??! "
;??" #
migrationBuilderAA 
.AA 

DropColumnAA '
(AA' (
nameBB 
:BB 
$strBB 
,BB 
tableCC 
:CC 
$strCC !
)CC! "
;CC" #
}DD 	
}EE 
}FF ˘
4D:\dev\Battleships\Battleships\Models\Achievement.cs
	namespace 	
Battleships
 
. 
Models 
{ 
public 

class 
Achievement 
:  
AchievementPrototype 3
{		 
public

 
string

 
Name

 
{

 
get

  
;

  !
set

" %
;

% &
}

' (
public 
string 
Description !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string 
RequiredAction $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
int  
ActionPerformedCount '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
public 
int (
RequiredActionPerformedCount /
{0 1
get2 5
;5 6
set7 :
;: ;
}< =
public 
List 
< 
ApplicationUser #
># $
Users% *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
public 
override  
AchievementPrototype ,
Clone- 2
(2 3
)3 4
{ 	
return 
this 
. 
MemberwiseClone '
(' (
)( )
as* , 
AchievementPrototype- A
;A B
} 	
} 
} ç
8D:\dev\Battleships\Battleships\Models\ApplicationUser.cs
	namespace 	
Battleships
 
. 
Models 
{ 
public 

class 
ApplicationUser  
:! "
IdentityUser# /
{ 
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
public		 
string		 
Surname		 
{		 
get		  #
;		# $
set		% (
;		( )
}		* +
public 
List 
< 
UserCosmetic  
>  !
	Cosmetics" +
{, -
get. 1
;1 2
set3 6
;6 7
}8 9
public 
List 
< 
Player 
> 
Players #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
List 
< 
UserAchievement #
># $
UserAchievements% 5
{6 7
get8 ;
;; <
set= @
;@ A
}B C
public 
List 
< 
GameSession 
>  
WonGames! )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
public 
override 
string 
ToString '
(' (
)( )
{ 	
return 
$" 
{ 
base 
. 
ToString #
(# $
)$ %
}% &
$str& (
{( )
nameof) /
(/ 0
Name0 4
)4 5
}5 6
$str6 8
{8 9
Name9 =
}= >
$str> @
{@ A
nameofA G
(G H
SurnameH O
)O P
}P Q
$strQ S
{S T
SurnameT [
}[ \
$str\ ^
{^ _
nameof_ e
(e f
	Cosmeticsf o
)o p
}p q
$strq s
{s t
	Cosmeticst }
}} ~
$str	~ Ä
{
Ä Å
nameof
Å á
(
á à
UserAchievements
à ò
)
ò ô
}
ô ö
$str
ö ú
{
ú ù
UserAchievements
ù ≠
}
≠ Æ
"
Æ Ø
;
Ø ∞
} 	
} 
} æ
2D:\dev\Battleships\Battleships\Models\BaseModel.cs
	namespace 	
Battleships
 
. 
Models 
{ 
public 

class 
	BaseModel 
{ 
[ 	
Key	 
] 
public		 
Guid		 
Id		 
{		 
get		 
;		 
set		 !
;		! "
}		# $
}

 
} ú
5D:\dev\Battleships\Battleships\Models\enums\Engine.cs
	namespace 	
Battleships
 
. 
Models 
. 
enums "
{ 
public 

enum 
Engine 
{ 
} 
} √
@D:\dev\Battleships\Battleships\Models\enums\GameSessionStatus.cs
	namespace 	
Battleships
 
. 
Models 
. 
enums "
{ 
public 

enum 
GameSessionStatus !
{ 
	Undefined 
= 
$num 
, 
Created 
= 
$num 
, 

InProgress 
= 
$num 
, 
EndgameReached 
= 
$num 
}		 
}

 ´
8D:\dev\Battleships\Battleships\Models\enums\GameTypes.cs
	namespace 	
Battleships
 
. 
Models 
. 
enums "
{ 
public 

enum 
	GameTypes 
{ 
	Undefined 
= 
$num 
, 
Classic 
= 
$num 
, 

DeathMatch 
= 
$num 
, 
Custom 
= 
$num 
}		 
}

 Ö
2D:\dev\Battleships\Battleships\Models\enums\Gun.cs
	namespace 	
Battleships
 
. 
Models 
. 
enums "
;" #
public 
enum 
Gun 
{ 
} ˝
/D:\dev\Battleships\Battleships\Models\Friend.cs
	namespace 	
Battleships
 
. 
Models 
{ 
public 

class 
Friend 
: 
	BaseModel #
{		 
[

 	
Required

	 
]

 
[ 	

ForeignKey	 
( 
$str %
)% &
]& '
public 
Guid 
User1 
{ 
get 
;  
set! $
;$ %
}& '
[ 	
Required	 
] 
[ 	

ForeignKey	 
( 
$str %
)% &
]& '
public 
Guid 
User2 
{ 
get 
;  
set! $
;$ %
}& '
} 
}   ¥A
4D:\dev\Battleships\Battleships\Models\GameSession.cs
	namespace

 

Battleships

 
.

 
Models

 
{ 
public 

class 
GameSession 
:  
GameSessionPrototype 3
{ 
public 
string 
Icon 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
public 
DateTime 
DateCreated #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
TimeSpan 

GameLength "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
GameSessionStatus  
Status! '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
public 
int 
CurrentRound 
{  !
get" %
;% &
set' *
;* +
}, -
=. /
$num0 1
;1 2
public 
string 
EndgameStrategy %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
List 
< 
Player 
> 
Players #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
GameSessionSettings "
Settings# +
{, -
get. 1
;1 2
set3 6
;6 7
}8 9
public 
string 
WinnerId 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
ApplicationUser 
Winner %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
GameSessionDto 
toDto #
(# $
)$ %
{ 	
var 
dto 
= 
new 
GameSessionDto (
(( )
)) *
;* +
dto 
. 
Id 
= 
this 
. 
Id 
; 
dto   
.   
HostId   
=   
this   
.   
Players   %
[  % &
$num  & '
]  ' (
.  ( )
Id  ) +
;  + ,
dto"" 
."" 
HostName"" 
="" 
this"" 
.""  
Players""  '
[""' (
$num""( )
]"") *
.""* +
Id""+ -
.""- .
ToString"". 6
(""6 7
)""7 8
;""8 9
dto## 
.## 
Icon## 
=## 
this## 
.## 
Icon##  
;##  !
dto$$ 
.$$ 
Name$$ 
=$$ 
this$$ 
.$$ 
Name$$  
;$$  !
dto%% 
.%% 
GridSize%% 
=%% 
this%% 
.%%  
Settings%%  (
.%%( )
GridSize%%) 1
;%%1 2
dto&& 
.&& 
GameType&& 
=&& 
this&& 
.&&  
Settings&&  (
.&&( )
GameType&&) 1
;&&1 2
var'' 
players'' 
='' 
this'' 
.'' 
Players'' &
.''& '
Select''' -
(''- .
player''. 4
=>''5 7
player''8 >
.''> ?

ToLobbyDto''? I
(''I J
)''J K
)''K L
.''L M
ToList''M S
(''S T
)''T U
;''U V
dto(( 
.(( 
LobbyPlayers(( 
=(( 
players(( &
;((& '
return** 
dto** 
;** 
}++ 	
private-- 
GameSession-- 
DeepCopy-- $
(--$ %
GameSession--% 0
gameSession--1 <
)--< =
{.. 	
var// 
shallowCopy// 
=// 
ShallowClone// *
(//* +
)//+ ,
as//- /
GameSession//0 ;
;//; <
var00 
settings00 
=00 
shallowCopy00 &
.00& '
Settings00' /
;00/ 0
var22 
	playerOne22 
=22 
new22 
Player22  &
(22& '
gameSession22' 2
,222 3
true224 8
,228 9
gameSession22: E
.22E F
Players22F M
[22M N
$num22N O
]22O P
.22P Q
UserId22Q W
)22W X
;22X Y
var33 
	playerTwo33 
=33 
new33 
Player33  &
(33& '
gameSession33' 2
,332 3
false334 9
,339 :
gameSession33; F
.33F G
Players33G N
[33N O
$num33O P
]33P Q
.33Q R
UserId33R X
)33X Y
;33Y Z
var44 
players44 
=44 
new44 
List44 "
<44" #
Player44# )
>44) *
{44* +
	playerOne44, 5
,446 7
	playerTwo448 A
}44A B
;44B C
var66 
session66 
=66 
new66 
GameSession66 )
{77 
Icon88 
=88 
gameSession88 "
.88" #
Icon88# '
,88' (
Name99 
=99 
gameSession99 "
.99" #
Name99# '
,99' (
DateCreated:: 
=:: 
gameSession:: )
.::) *
DateCreated::* 5
,::5 6

GameLength;; 
=;; 
gameSession;; (
.;;( )

GameLength;;) 3
,;;3 4
Status<< 
=<< 
gameSession<< $
.<<$ %
Status<<% +
,<<+ ,
CurrentRound== 
=== 
gameSession== *
.==* +
CurrentRound==+ 7
,==7 8
EndgameStrategy>> 
=>>  !
gameSession>>" -
.>>- .
EndgameStrategy>>. =
,>>= >
Players?? 
=?? 
players?? !
,??! "
Settings@@ 
=@@ 
settings@@ #
,@@# $
}AA 
;AA 
returnCC 
sessionCC 
;CC 
}DD 	
publicFF 
GameSessionFF 
(FF 
)FF 
{GG 	
}II 	
publicKK 
overrideKK 
stringKK 
ToStringKK '
(KK' (
)KK( )
{LL 	
returnMM 
thisMM 
.MM 
IdMM 
.MM 
ToStringMM #
(MM# $
)MM$ %
+MM& '
$strMM( +
+MM, -
thisMM. 2
.MM2 3
NameMM3 7
+MM8 9
$strMM: =
+MM> ?
thisMM@ D
.MMD E
IconMME I
+MMJ K
$strMML O
+MMP Q
thisMMR V
.MMV W
PlayersMMW ^
[MM^ _
$numMM_ `
]MM` a
.MMa b
IdMMb d
;MMd e
}NN 	
publicPP 
overridePP  
GameSessionPrototypePP ,
ShallowClonePP- 9
(PP9 :
)PP: ;
{QQ 	
returnRR 
thisRR 
.RR 
MemberwiseCloneRR '
(RR' (
)RR( )
asRR* , 
GameSessionPrototypeRR- A
;RRA B
}SS 	
publicUU 
overrideUU  
GameSessionPrototypeUU ,
	DeepCloneUU- 6
(UU6 7
GameSessionUU7 B
gameSessionUUC N
)UUN O
{VV 	
varWW 
copiedSessionWW 
=WW 
DeepCopyWW  (
(WW( )
gameSessionWW) 4
)WW4 5
;WW5 6
returnXX 
copiedSessionXX  
asXX! # 
GameSessionPrototypeXX$ 8
;XX8 9
}YY 	
}ZZ 
}[[ Ú
<D:\dev\Battleships\Battleships\Models\GameSessionSettings.cs
	namespace 	
Battleships
 
. 
Models 
{ 
public 

class 
GameSessionSettings $
:% &
	BaseModel' 0
{ 
public 
Guid 
GameSessionId !
{" #
get$ '
;' (
set) ,
;, -
}. /
public		 
string		 
GridSize		 
{		  
get		! $
;		$ %
set		& )
;		) *
}		+ ,
public

 
int

 
ColumnCount

 
{

  
get

! $
;

$ %
set

& )
;

) *
}

+ ,
public 
int 
RowCount 
{ 
get !
;! "
set# &
;& '
}( )
public 
	GameTypes 
GameType !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
int %
RoundCountLimitForEndgame ,
{- .
get/ 2
;2 3
set4 7
;7 8
}9 :
public 
int .
"DestroyedShipsPercentageForEndgame 5
{6 7
get8 ;
;; <
set= @
;@ A
}B C
public 
int (
DestroyedShipCountForEndgame /
{0 1
get2 5
;5 6
set7 :
;: ;
}< =
public 
GameSession 
GameSession &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
} 
} î
5D:\dev\Battleships\Battleships\Models\Notification.cs
	namespace 	
Battleships
 
. 
Models 
{ 
public 

class 
Notification 
: 
	BaseModel  )
{ 
public 
Guid 
NotificationId "
{# $
get% (
;( )
set* -
;- .
}/ 0
public		 
string		 
Type		 
{		 
get		  
;		  !
set		" %
;		% &
}		' (
public

 
string

 
Text

 
{

 
get

  
;

  !
set

" %
;

% &
}

' (
public 
Guid 
ReceiveUser 
{  !
get" %
;% &
set' *
;* +
}, -
} 
} ó 
/D:\dev\Battleships\Battleships\Models\Player.cs
	namespace 	
Battleships
 
. 
Models 
{ 
public 

class 
Player 
: 
	BaseModel #
{ 
public		 
Guid		 
GameSessionId		 !
{		" #
get		$ '
;		' (
set		) ,
;		, -
}		. /
public

 
GameSession

 
GameSession

 &
{

' (
get

) ,
;

, -
set

. 1
;

1 2
}

3 4
public 
bool 
IsHost 
{ 
get  
;  !
set" %
;% &
}' (
public 
bool 
IsCurrentPlayerTurn '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
public 
string 
UserId 
{ 
get "
;" #
set$ '
;' (
}) *
public 
ApplicationUser 
User #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
List 
< 

PlayerShip 
> 
PlayerShips  +
{, -
get. 1
;1 2
set3 6
;6 7
}8 9
public 
Player 
( 
) 
{ 	
} 	
public 
Player 
( 
GameSession !
gameSession" -
,- .
bool/ 3
isHost4 :
,: ;
string< B
userIdC I
)I J
{ 	
GameSession 
= 
gameSession %
;% &
IsHost 
= 
isHost 
; 
UserId 
= 
userId 
; 
} 	
public 
PlayerLobbyDto 

ToLobbyDto (
(( )
)) *
{   	
var!! 
dto!! 
=!! 
new!! 
PlayerLobbyDto!! (
{"" 
Id## 
=## 
Id## 
.## 
ToString##  
(##  !
)##! "
,##" #
Name$$ 
=$$ 
User$$ 
.$$ 
UserName$$ $
,$$$ %
UserId%% 
=%% 
UserId%% 
}&& 
;&& 
return(( 
dto(( 
;(( 
})) 	
public++ 
override++ 
string++ 
ToString++ '
(++' (
)++( )
{,, 	
return-- 
$"-- 
{-- 
nameof-- 
(-- 
GameSessionId-- *
)--* +
}--+ ,
$str--, .
{--. /
GameSessionId--/ <
}--< =
$str--= ?
{--? @
nameof--@ F
(--F G
GameSession--G R
)--R S
}--S T
$str--T V
{--V W
GameSession--W b
}--b c
$str--c e
{--e f
nameof--f l
(--l m
IsHost--m s
)--s t
}--t u
$str--u w
{--w x
IsHost--x ~
}--~ 
$str	-- Å
{
--Å Ç
nameof
--Ç à
(
--à â
UserId
--â è
)
--è ê
}
--ê ë
$str
--ë ì
{
--ì î
UserId
--î ö
}
--ö õ
$str
--õ ù
{
--ù û
nameof
--û §
(
--§ •
User
--• ©
)
--© ™
}
--™ ´
$str
--´ ≠
{
--≠ Æ
User
--Æ ≤
.
--≤ ≥
ToString
--≥ ª
(
--ª º
)
--º Ω
}
--Ω æ
$str
--æ ¿
{
--¿ ¡
nameof
--¡ «
(
--« »
PlayerShips
--» ”
)
--” ‘
}
--‘ ’
$str
--’ ◊
{
--◊ ÿ
PlayerShips
--ÿ „
}
--„ ‰
"
--‰ Â
;
--Â Ê
}.. 	
}// 
}00 Î
3D:\dev\Battleships\Battleships\Models\PlayerShip.cs
	namespace 	
Battleships
 
. 
Models 
{ 
public 

class 

PlayerShip 
: 
	BaseModel '
{ 
public		 
Guid		 
PlayerId		 
{		 
get		 "
;		" #
set		$ '
;		' (
}		) *
public

 
Player

 
Player

 
{

 
get

 "
;

" #
set

$ '
;

' (
}

) *
public 
Guid 
ShipId 
{ 
get  
;  !
set" %
;% &
}' (
public 
Ship 
Ship 
{ 
get 
; 
set  #
;# $
}% &
public 
List 
< 
ShipTile 
> 
Tiles #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
void 
MoveUp 
( 
) 
{ 	
List 
< 
ShipTile 
> 
temp 
=  !
this" &
.& '
Tiles' ,
;, -
foreach 
( 
var 
tile 
in  
temp! %
)% &
{ 
tile 
. 
XCoordinate  
-=! #
$num$ %
;% &
} 
this 
. 
Tiles 
= 
temp 
; 
} 	
public 
void 
MoveDown 
( 
) 
{ 	
List 
< 
ShipTile 
> 
temp 
=  !
this" &
.& '
Tiles' ,
;, -
foreach 
( 
var 
tile 
in  
temp! %
)% &
{   
tile!! 
.!! 
XCoordinate!!  
+=!!! #
$num!!$ %
;!!% &
}"" 
this## 
.## 
Tiles## 
=## 
temp## 
;## 
}$$ 	
public%% 
void%% 
MoveLeft%% 
(%% 
)%% 
{&& 	
List'' 
<'' 
ShipTile'' 
>'' 
temp'' 
=''  !
this''" &
.''& '
Tiles''' ,
;'', -
foreach)) 
()) 
var)) 
tile)) 
in))  
temp))! %
)))% &
{** 
tile++ 
.++ 
YCoordinate++  
-=++! #
$num++$ %
;++% &
},, 
this-- 
.-- 
Tiles-- 
=-- 
temp-- 
;-- 
}.. 	
public// 
void// 
	MoveRight// 
(// 
)// 
{00 	
List11 
<11 
ShipTile11 
>11 
temp11 
=11  !
this11" &
.11& '
Tiles11' ,
;11, -
foreach33 
(33 
var33 
tile33 
in33  
temp33! %
)33% &
{44 
tile55 
.55 
YCoordinate55  
+=55! #
$num55$ %
;55% &
}66 
this77 
.77 
Tiles77 
=77 
temp77 
;77 
}88 	
};; 
}<< Ô
=D:\dev\Battleships\Battleships\Models\Ships\BattleshipShip.cs
	namespace 	
Battleships
 
. 
Models 
. 
Ships "
{ 
public 

class 
BattleshipShip 
:  !
Ship" &
{ 
public 
override 
void 
ChangeState (
(( )
)) *
{ 	
base 
. 
Description 
= 
$" !
$str! 1
{1 2
_state2 8
.8 9
GetState9 A
(A B
)B C
}C D
$strD E
"E F
;F G
}		 	
}

 
} È
:D:\dev\Battleships\Battleships\Models\Ships\CarrierShip.cs
	namespace 	
Battleships
 
. 
Models 
. 
Ships "
{ 
public 

class 
CarrierShip 
: 
Ship #
{ 
public 
override 
void 
ChangeState (
(( )
)) *
{ 	
base		 
.		 
Description		 
=		 
$"		 !
$str		! .
{		. /
_state		/ 5
.		5 6
GetState		6 >
(		> ?
)		? @
}		@ A
$str		A B
"		B C
;		C D
}

 	
} 
} È
:D:\dev\Battleships\Battleships\Models\Ships\CruiserShip.cs
	namespace 	
Battleships
 
. 
Models 
. 
Ships "
{ 
public 

class 
CruiserShip 
: 
Ship #
{ 
public 
override 
void 
ChangeState (
(( )
)) *
{ 	
base 
. 
Description 
= 
$" !
$str! .
{. /
_state/ 5
.5 6
GetState6 >
(> ?
)? @
}@ A
$strA B
"B C
;C D
} 	
}		 
}

 Ì
<D:\dev\Battleships\Battleships\Models\Ships\DestroyerShip.cs
	namespace 	
Battleships
 
. 
Models 
. 
Ships "
{ 
public 

class 
DestroyerShip 
:  
Ship! %
{ 
public 
override 
void 
ChangeState (
(( )
)) *
{ 	
base 
. 
Description 
= 
$" !
$str! 0
{0 1
_state1 7
.7 8
GetState8 @
(@ A
)A B
}B C
$strC D
"D E
;E F
} 	
}		 
}

 Â
8D:\dev\Battleships\Battleships\Models\Ships\DummyShip.cs
	namespace 	
Battleships
 
. 
Models 
. 
Ships "
{ 
public 

class 
	DummyShip 
: 
Ship !
{ 
public 
override 
void 
ChangeState (
(( )
)) *
{ 	
base 
. 
Description 
= 
$" !
$str! ,
{, -
_state- 3
.3 4
GetState4 <
(< =
)= >
}> ?
$str? @
"@ A
;A B
} 	
}		 
}

 ª
3D:\dev\Battleships\Battleships\Models\Ships\Ship.cs
	namespace 	
Battleships
 
. 
Models 
. 
Ships "
{ 
public 

abstract 
class 
Ship 
:  
	BaseModel! *
{ 
public		 
string		 !
ShipTypeDiscriminator		 +
{		, -
get		. 1
;		1 2
set		3 6
;		6 7
}		8 9
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
Description !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string 
ShipType 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
List 
< 
UserCosmetic  
>  !
UserCosmetics" /
{0 1
get2 5
;5 6
set7 :
;: ;
}< =
public 
List 
< 

PlayerShip 
> 
PlayerShips  +
{, -
get. 1
;1 2
set3 6
;6 7
}8 9
	protected 

IShipState 
_state #
;# $
[ 	
	NotMapped	 
] 
public 

IShipState 
State 
{ 	
get 
{ 
return 
_state 
; 
} 
set 
{ 
_state 
= 
value 
; 
} 
}   	
public"" 
abstract"" 
void"" 
ChangeState"" (
(""( )
)"") *
;""* +
}## 
}$$ Ì
<D:\dev\Battleships\Battleships\Models\Ships\SubmarineShip.cs
	namespace 	
Battleships
 
. 
Models 
. 
Ships "
{ 
public 

class 
SubmarineShip 
:  
Ship! %
{ 
public 
override 
void 
ChangeState (
(( )
)) *
{ 	
base 
. 
Description 
= 
$" !
$str! 0
{0 1
_state1 7
.7 8
GetState8 @
(@ A
)A B
}B C
$strC D
"D E
;E F
} 	
}		 
}

 ·
1D:\dev\Battleships\Battleships\Models\ShipTile.cs
	namespace 	
Battleships
 
. 
Models 
{ 
public 

class 
ShipTile 
: 
	BaseModel %
{ 
public 
int 
XCoordinate 
{  
get! $
;$ %
set& )
;) *
}+ ,
public		 
int		 
YCoordinate		 
{		  
get		! $
;		$ %
set		& )
;		) *
}		+ ,
public

 
bool

 
IsDestroyed

 
{

  !
get

" %
;

% &
set

' *
;

* +
}

, -
public 
Guid 
? 
AttackerPlayerId %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
Player 
AttackerPlayer $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
Guid 
? 
TargetPlayerId #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
Player 
TargetPlayer "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
Guid 
? 
PlayerShipId !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 

PlayerShip 

PlayerShip $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
Engine 
Engine 
{ 
get "
;" #
set$ '
;' (
}) *
public 
Gun 
Guns 
{ 
get 
; 
set "
;" #
}$ %
public 
bool 
Shield 
{ 
get  
;  !
set" %
;% &
}' (
public 
int 
GunCount 
{ 
get !
;! "
set# &
;& '
}( )
public 
bool 

IsFlagship 
{  
get! $
;$ %
set& )
;) *
}+ ,
} 
} ´
8D:\dev\Battleships\Battleships\Models\UserAchievement.cs
	namespace 	
Battleships
 
. 
Models 
{ 
public 

class 
UserAchievement  
:! "
	BaseModel# ,
{ 
public 
Guid 
AchievementId !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string 
UserId 
{ 
get "
;" #
set$ '
;' (
}) *
public		 
ApplicationUser		 
User		 #
{		$ %
get		& )
;		) *
set		+ .
;		. /
}		0 1
public

 
Achievement

 
Achievement

 &
{

' (
get

) ,
;

, -
set

. 1
;

1 2
}

3 4
} 
} ÷	
5D:\dev\Battleships\Battleships\Models\UserCosmetic.cs
	namespace 	
Battleships
 
. 
Models 
{ 
public 

class 
UserCosmetic 
: 
	BaseModel  )
{ 
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
public		 
string		 
Description		 !
{		" #
get		$ '
;		' (
set		) ,
;		, -
}		. /
public 
string 
UserId 
{ 
get "
;" #
set$ '
;' (
}) *
public 
ApplicationUser 
User #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
Guid 
? 
ShipId 
{ 
get !
;! "
set# &
;& '
}( )
public 
Ship 
Ship 
{ 
get 
; 
set  #
;# $
}% &
} 
} Ç

)D:\dev\Battleships\Battleships\Program.cs
	namespace

 	
Battleships


 
{ 
public 

class 
Program 
{ 
public 
static 
void 
Main 
(  
string  &
[& '
]' (
args) -
)- .
{ 	
CreateHostBuilder 
( 
args "
)" #
.# $
Build$ )
() *
)* +
.+ ,
Run, /
(/ 0
)0 1
;1 2
} 	
public 
static 
IHostBuilder "
CreateHostBuilder# 4
(4 5
string5 ;
[; <
]< =
args> B
)B C
=>D F
Host 
.  
CreateDefaultBuilder %
(% &
args& *
)* +
. $
ConfigureWebHostDefaults )
() *

webBuilder* 4
=>5 7
{8 9

webBuilder: D
.D E

UseStartupE O
<O P
StartupP W
>W X
(X Y
)Y Z
;Z [
}\ ]
)] ^
;^ _
} 
} ©
>D:\dev\Battleships\Battleships\Prototype\AchievementManager.cs
	namespace 	
Battleships
 
. 
	Prototype 
{ 
public 

class 
AchievementManager #
{ 
private 

Dictionary 
< 
string !
,! " 
AchievementPrototype# 7
>7 8
achievements9 E
=F G
newH K
(K L
)L M
;N O
public  
AchievementPrototype #
this$ (
[( )
string) /
	shortName0 9
]9 :
{		 	
get

 
{

 
return

 
achievements

 %
[

% &
	shortName

& /
]

/ 0
;

0 1
}

2 3
set 
{ 
achievements 
. 
Add "
(" #
	shortName# ,
,, -
value. 3
)3 4
;4 5
}6 7
} 	
} 
} ﬂ
@D:\dev\Battleships\Battleships\Prototype\AchievementPrototype.cs
	namespace 	
Battleships
 
. 
	Prototype 
{ 
public 

abstract 
class  
AchievementPrototype .
:/ 0
	BaseModel1 :
{ 
public 
abstract  
AchievementPrototype ,
Clone- 2
(2 3
)3 4
;4 5
} 
}		 ±
@D:\dev\Battleships\Battleships\Prototype\GameSessionPrototype.cs
	namespace 	
Battleships
 
. 
	Prototype 
{ 
public 

abstract 
class  
GameSessionPrototype .
:/ 0
	BaseModel1 :
{ 
public 
abstract  
GameSessionPrototype ,
	DeepClone- 6
(6 7
GameSession7 B 
gameSessionPrototypeC W
)W X
;X Y
public 
abstract  
GameSessionPrototype ,
ShallowClone- 9
(9 :
): ;
;; <
}		 
}

 íH
=D:\dev\Battleships\Battleships\Repositories\BaseRepository.cs
	namespace

 	
Battleships


 
.

 
Repositories

 "
{ 
public 

class 
BaseRepository 
<  
TModel  &
>& '
:( )
IRepository* 5
<5 6
TModel6 <
>< =
where> C
TModelD J
:K L
	BaseModelM V
{ 
	protected 
readonly  
ApplicationDbContext /
_context0 8
;8 9
	protected 
DbSet 
< 
TModel 
> 
ItemSet  '
=>( *
_context+ 3
.3 4
Set4 7
<7 8
TModel8 >
>> ?
(? @
)@ A
;A B
public 
BaseRepository 
(  
ApplicationDbContext 2
context3 :
): ;
{ 	
_context 
= 
context 
; 
} 	
public 
virtual 
async 
Task !
<! "
TModel" (
>( )
GetById* 1
(1 2
Guid2 6
id7 9
)9 :
{ 	
return 
await 
ItemSet  
.  !
FirstOrDefaultAsync! 4
(4 5
m5 6
=>7 9
m: ;
.; <
Id< >
==? A
idB D
)D E
;E F
} 	
public 
async 
Task 
< 
List 
< 
TModel %
>% &
>& '
GetWhere( 0
(0 1

Expression1 ;
<; <
Func< @
<@ A
TModelA G
,G H
boolI M
>M N
>N O
filterP V
)V W
{ 	
return 
await 
ItemSet  
.  !
Where! &
(& '
filter' -
)- .
.. /
ToListAsync/ :
(: ;
); <
;< =
} 	
public"" 
virtual"" 
async"" 
Task"" !
<""! "
List""" &
<""& '
TModel""' -
>""- .
>"". /
GetAll""0 6
(""6 7
)""7 8
{## 	
return$$ 
await$$ 
ItemSet$$  
.$$  !
ToListAsync$$! ,
($$, -
)$$- .
;$$. /
}%% 	
public'' 
async'' 
Task'' 
<'' 
Guid'' 
>'' 
Create''  &
(''& '
TModel''' -
model''. 3
)''3 4
{(( 	
await)) 
ItemSet)) 
.)) 
AddAsync)) "
())" #
model))# (
)))( )
;))) *
await** 
SaveChanges** 
(** 
)** 
;**  
return,, 
model,, 
.,, 
Id,, 
;,, 
}-- 	
public// 
async// 
Task// 
Update//  
(//  !
TModel//! '
model//( -
)//- .
{00 	
ItemSet11 
.11 
Update11 
(11 
model11  
)11  !
;11! "
await22 
SaveChanges22 
(22 
)22 
;22  
}33 	
public55 
async55 
Task55 
Delete55  
(55  !
TModel55! '
model55( -
)55- .
{66 	
ItemSet77 
.77 
Remove77 
(77 
model77  
)77  !
;77! "
await88 
SaveChanges88 
(88 
)88 
;88  
}99 	
public;; 
async;; 
Task;; 
<;; 
List;; 
<;; 
Guid;; #
>;;# $
>;;$ %

CreateMany;;& 0
(;;0 1
List;;1 5
<;;5 6
TModel;;6 <
>;;< =
models;;> D
);;D E
{<< 	
await== 
ItemSet== 
.== 
AddRangeAsync== '
(==' (
models==( .
)==. /
;==/ 0
await>> 
SaveChanges>> 
(>> 
)>> 
;>>  
return@@ 
models@@ 
.@@ 
Select@@  
(@@  !
m@@! "
=>@@# %
m@@& '
.@@' (
Id@@( *
)@@* +
.@@+ ,
ToList@@, 2
(@@2 3
)@@3 4
;@@4 5
}AA 	
publicCC 
asyncCC 
TaskCC 

UpdateManyCC $
(CC$ %
ListCC% )
<CC) *
TModelCC* 0
>CC0 1
modelsCC2 8
)CC8 9
{DD 	
ItemSetEE 
.EE 
UpdateRangeEE 
(EE  
modelsEE  &
)EE& '
;EE' (
awaitFF 
SaveChangesFF 
(FF 
)FF 
;FF  
}GG 	
publicII 
asyncII 
TaskII 

DeleteManyII $
(II$ %
ListII% )
<II) *
TModelII* 0
>II0 1
modelsII2 8
)II8 9
{JJ 	
ItemSetKK 
.KK 
RemoveRangeKK 
(KK  
modelsKK  &
)KK& '
;KK' (
awaitLL 
SaveChangesLL 
(LL 
)LL 
;LL  
}MM 	
publicOO 
boolOO 
IsEmptyOO 
(OO 
)OO 
{PP 	
varQQ 
anyExistQQ 
=QQ 
ItemSetQQ "
.QQ" #
AnyQQ# &
(QQ& '
)QQ' (
;QQ( )
returnRR 
!RR 
anyExistRR 
;RR 
}SS 	
privateUU 
asyncUU 
TaskUU 
SaveChangesUU &
(UU& '
)UU' (
{VV 	
awaitWW 
_contextWW 
.WW 
SaveChangesAsyncWW +
(WW+ ,
)WW, -
;WW- .
}XX 	
	protectedZZ 
asyncZZ 
TaskZZ 
<ZZ 
TModelZZ #
>ZZ# $
	GetSingleZZ% .
(ZZ. /

ExpressionZZ/ 9
<ZZ9 :
FuncZZ: >
<ZZ> ?
TModelZZ? E
,ZZE F
boolZZG K
>ZZK L
>ZZL M
filterZZN T
)ZZT U
{[[ 	
return\\ 
(\\ 
await\\ 
_context\\ "
.\\" #
Set\\# &
<\\& '
TModel\\' -
>\\- .
(\\. /
)\\/ 0
.\\0 1
Where\\1 6
(\\6 7
filter\\7 =
)\\= >
.\\> ?
ToArrayAsync\\? K
(\\K L
)\\L M
)\\M N
.\\N O
SingleOrDefault\\O ^
(\\^ _
)\\_ `
;\\` a
}]] 	
	protected__ 
async__ 
Task__ 
<__ 
TProjection__ (
>__( )
	GetSingle__* 3
<__3 4
TProjection__4 ?
>__? @
(__@ A

Expression`` 
<`` 
Func`` 
<`` 
TModel`` "
,``" #
bool``$ (
>``( )
>``) *
filter``+ 1
,``1 2

Expressionaa 
<aa 
Funcaa 
<aa 
TModelaa "
,aa" #
TProjectionaa$ /
>aa/ 0
>aa0 1 
projectionExpressionaa2 F
)bb 	
{cc 	
returndd 
(dd 
awaitdd 
_contextdd "
.ee 
Setee 
<ee 
TModelee 
>ee  
(ee  !
)ee! "
.ff 
Whereff 
(ff 
filterff !
)ff! "
.gg 
Selectgg 
(gg  
projectionExpressiongg 0
)gg0 1
.hh 
ToArrayAsynchh !
(hh! "
)hh" #
)ii 
.ii 
SingleOrDefaultii !
(ii! "
)ii" #
;ii# $
}jj 	
	protectedll 
asyncll 
Taskll 
<ll 
TProjectionll (
>ll( )
GetByIdll* 1
<ll1 2
TProjectionll2 =
>ll= >
(ll> ?
Guidll? C
idllD F
,llF G

ExpressionllH R
<llR S
FuncllS W
<llW X
TModelllX ^
,ll^ _
TProjectionll` k
>llk l
>lll m!
projectionExpression	lln Ç
)
llÇ É
{mm 	
returnnn 
awaitnn 
ItemSetnn  
.oo 
Whereoo 
(oo 
itemoo 
=>oo 
itemoo #
.oo# $
Idoo$ &
==oo' )
idoo* ,
)oo, -
.pp 
Selectpp 
(pp  
projectionExpressionpp ,
)pp, -
.qq 
FirstOrDefaultAsyncqq $
(qq$ %
)qq% &
;qq& '
}rr 	
}ss 
}tt Ÿ
BD:\dev\Battleships\Battleships\Repositories\BattleshipsDatabase.cs
	namespace 	
Battleships
 
. 
Repositories "
{ 
public 

class 
BattleshipsDatabase $
:% & 
IBattleshipsDatabase' ;
{ 
public 
BattleshipsDatabase "
(" #
IRepository 
< 
Achievement #
># $"
achievementsRepository% ;
,; <#
IGameSessionsRepository		 #"
gameSessionsRepository		$ :
,		: ;*
IGameSessionSettingsRepository

 *)
gameSessionSettingsRepository

+ H
,

H I
IPlayersRepository 
playersRepository 0
,0 1
IRepository 
< 

PlayerShip "
>" #!
playerShipsRepository$ 9
,9 :
IShipsRepository 
shipsRepository ,
,, -
IRepository 
< 
UserCosmetic $
>$ %#
userCosmeticsRepository& =
,= > 
IShipTilesRepository  
shipTilesRepository! 4
,4 5
IRepository 
< 
Friend 
> 
friendsRepository  1
)1 2
{ 	"
AchievementsRepository "
=# $"
achievementsRepository% ;
;; <"
GameSessionsRepository "
=# $"
gameSessionsRepository% ;
;; <)
GameSessionSettingsRepository )
=* +)
gameSessionSettingsRepository, I
;I J
PlayersRepository 
= 
playersRepository  1
;1 2!
PlayerShipsRepository !
=" #!
playerShipsRepository$ 9
;9 :
ShipsRepository 
= 
shipsRepository -
;- .#
UserCosmeticsRepository #
=$ %#
userCosmeticsRepository& =
;= >
ShipTilesRepository 
=  !
shipTilesRepository" 5
;5 6
FriendsRepository 
= 
friendsRepository  1
;1 2
} 	
public 
IRepository 
< 
Achievement &
>& '"
AchievementsRepository( >
{? @
getA D
;D E
}F G
public #
IGameSessionsRepository &"
GameSessionsRepository' =
{> ?
get@ C
;C D
}E F
public *
IGameSessionSettingsRepository -)
GameSessionSettingsRepository. K
{L M
getN Q
;Q R
}S T
public   
IPlayersRepository   !
PlayersRepository  " 3
{  4 5
get  6 9
;  9 :
}  ; <
public!! 
IRepository!! 
<!! 

PlayerShip!! %
>!!% &!
PlayerShipsRepository!!' <
{!!= >
get!!? B
;!!B C
}!!D E
public""  
IShipTilesRepository"" #
ShipTilesRepository""$ 7
{""8 9
get"": =
;""= >
}""? @
public## 
IShipsRepository## 
ShipsRepository##  /
{##0 1
get##2 5
;##5 6
}##7 8
public$$ 
IRepository$$ 
<$$ 
UserCosmetic$$ '
>$$' (#
UserCosmeticsRepository$$) @
{$$A B
get$$C F
;$$F G
}$$H I
public%% 
IRepository%% 
<%% 
Friend%% !
>%%! "
FriendsRepository%%# 4
{%%5 6
get%%7 :
;%%: ;
}%%< =
}&& 
}'' ”	
LD:\dev\Battleships\Battleships\Repositories\GameSessionSettingsRepository.cs
	namespace 	
Battleships
 
. 
Repositories "
{ 
public 

class )
GameSessionSettingsRepository .
:/ 0
BaseRepository1 ?
<? @
GameSessionSettings@ S
>S T
,T U*
IGameSessionSettingsRepositoryV t
{		 
public

 
async

 
Task

 
<

 
GameSessionSettings

 -
>

- .
GetBySessionId

/ =
(

= >
Guid

> B
gameSessionId

C P
)

P Q
{ 	
return 
await 
	GetSingle "
(" #
settings# +
=>, .
settings/ 7
.7 8
GameSessionId8 E
==F H
gameSessionIdI V
)V W
;W X
} 	
public )
GameSessionSettingsRepository ,
(, - 
ApplicationDbContext- A
contextB I
)I J
:K L
baseM Q
(Q R
contextR Y
)Y Z
{ 	
} 	
} 
} õO
ED:\dev\Battleships\Battleships\Repositories\GameSessionsRepository.cs
	namespace 	
Battleships
 
. 
Repositories "
{ 
public 

class "
GameSessionsRepository '
:( )
BaseRepository* 8
<8 9
GameSession9 D
>D E
,E F#
IGameSessionsRepositoryG ^
{ 
public 
override 
async 
Task "
<" #
GameSession# .
>. /
GetById0 7
(7 8
Guid8 <
id= ?
)? @
{ 	
return 
await 
ItemSet  
. 
Include 
( 
gs 
=> 
gs !
.! "
Settings" *
)* +
. 
FirstOrDefaultAsync $
($ %
gs% '
=>( *
gs+ -
.- .
Id. 0
==1 3
id4 6
)6 7
;7 8
} 	
public 
override 
async 
Task "
<" #
List# '
<' (
GameSession( 3
>3 4
>4 5
GetAll6 <
(< =
)= >
{ 	
return 
await 
ItemSet  
.  !
Include! (
(( )
x) *
=>+ -
x. /
./ 0
Players0 7
)7 8
. 
ThenInclude 
( 
x 
=> !
x" #
.# $
User$ (
)( )
. 
Include 
( 
x 
=> 
x 
.  
Settings  (
)( )
. 
ToListAsync 
( 
) 
; 
} 	
public 
async 
Task 
< 
GameSessionDto (
>( )
GetDtoWithPlayers* ;
(; <
Guid< @
gameSessionIdA N
)N O
{   	
return!! 
await!! 
GetById!!  
(!!  !
gameSessionId!!! .
,!!. /
gs!!0 2
=>!!3 5
new!!6 9
GameSessionDto!!: H
{"" 
Id## 
=## 
gs## 
.## 
Id## 
,## 
HostId$$ 
=$$ 
gs$$ 
.$$ 
Players$$ #
[$$# $
$num$$$ %
]$$% &
.$$& '
Id$$' )
,$$) *
HostName%% 
=%% 
gs%% 
.%% 
Players%% %
[%%% &
$num%%& '
]%%' (
.%%( )
User%%) -
.%%- .
Name%%. 2
,%%2 3
Icon&& 
=&& 
gs&& 
.&& 
Icon&& 
,&& 
Name'' 
='' 
gs'' 
.'' 
Name'' 
,'' 
GridSize(( 
=(( 
gs(( 
.(( 
Settings(( &
.((& '
GridSize((' /
,((/ 0
GameType)) 
=)) 
gs)) 
.)) 
Settings)) &
.))& '
GameType))' /
,))/ 0
LobbyPlayers** 
=** 
gs** !
.**! "
Players**" )
.**) *
Select*** 0
(**0 1
player**1 7
=>**8 :
new**; >
PlayerLobbyDto**? M
{++ 
Id,, 
=,, 
player,, 
.,,  
UserId,,  &
,,,& '
UserId-- 
=-- 
player-- #
.--# $
UserId--$ *
,--* +
Name.. 
=.. 
player.. !
...! "
User.." &
...& '
UserName..' /
}// 
)// 
.// 
ToList// 
(// 
)// 
}00 
)00 
;00 
}11 	
public33 
Task33 
<33 
int33 
>33 )
GetRequiredDestroyedShipCount33 6
(336 7
Guid337 ;
gameSessionId33< I
)33I J
{44 	
return55 
GetById55 
(55 
gameSessionId55 (
,55( )
session55* 1
=>552 4
session555 <
.55< =
Settings55= E
.55E F(
DestroyedShipCountForEndgame55F b
)55b c
;55c d
}66 	
public88 
Task88 
<88 
int88 
>88 
GetCurrentRound88 (
(88( )
Guid88) -
gameSessionId88. ;
)88; <
{99 	
return:: 
GetById:: 
(:: 
gameSessionId:: (
,::( )
session::* 1
=>::2 4
session::5 <
.::< =
CurrentRound::= I
)::I J
;::J K
};; 	
public== 
Task== 
<== 
string== 
>== 
GetEndgameStrategy== .
(==. /
Guid==/ 3
gameSessionId==4 A
)==A B
{>> 	
return?? 
GetById?? 
(?? 
gameSessionId?? (
,??( )
gs??* ,
=>??- /
gs??0 2
.??2 3
EndgameStrategy??3 B
)??B C
;??C D
}@@ 	
publicBB 
asyncBB 
TaskBB 
<BB 
(BB 
GuidBB 
,BB  
GuidBB! %
)BB% &
>BB& '
GetPlayerIdsBB( 4
(BB4 5
GuidBB5 9
gameSessionIdBB: G
,BBG H
stringBBI O
currentUserIdBBP ]
)BB] ^
{CC 	
varDD 
ownPlayerIdDD 
=DD 
awaitDD #
GetByIdDD$ +
(DD+ ,
gameSessionIdDD, 9
,DD9 :
gsDD; =
=>DD> @
gsDDA C
.DDC D
PlayersDDD K
.DDK L
FirstDDL Q
(DDQ R
pDDR S
=>DDT V
pDDW X
.DDX Y
UserIdDDY _
==DD` b
currentUserIdDDc p
)DDp q
.DDq r
IdDDr t
)DDt u
;DDu v
varEE 
opponentPlayerIdEE  
=EE! "
awaitEE# (
GetByIdEE) 0
(EE0 1
gameSessionIdEE1 >
,EE> ?
gsEE@ B
=>EEC E
gsEEF H
.EEH I
PlayersEEI P
.EEP Q
FirstEEQ V
(EEV W
pEEW X
=>EEY [
pEE\ ]
.EE] ^
UserIdEE^ d
!=EEe g
currentUserIdEEh u
)EEu v
.EEv w
IdEEw y
)EEy z
;EEz {
returnGG 
(GG 
ownPlayerIdGG 
,GG  
opponentPlayerIdGG! 1
)GG1 2
;GG2 3
}HH 	
publicJJ 
TaskJJ 
<JJ 
InGameSessionDtoJJ $
>JJ$ %
GetInGameSessionJJ& 6
(JJ6 7
GuidJJ7 ;
gameSessionIdJJ< I
,JJI J
stringJJK Q
currentUserIdJJR _
)JJ_ `
{KK 	
returnLL 
GetByIdLL 
(LL 
gameSessionIdLL (
,LL( )
sessionLL* 1
=>LL2 4
newLL5 8
InGameSessionDtoLL9 I
{MM 
GameSessionIdNN 
=NN 
gameSessionIdNN  -
,NN- .
ColumnCountOO 
=OO 
sessionOO %
.OO% &
SettingsOO& .
.OO. /
ColumnCountOO/ :
,OO: ;
RowCountPP 
=PP 
sessionPP "
.PP" #
SettingsPP# +
.PP+ ,
RowCountPP, 4
,PP4 5
CurrentRoundQQ 
=QQ 
sessionQQ &
.QQ& '
CurrentRoundQQ' 3
,QQ3 4
OpponentNameRR 
=RR 
sessionRR &
.RR& '
PlayersRR' .
.RR. /
FirstRR/ 4
(RR4 5
pRR5 6
=>RR7 9
pRR: ;
.RR; <
UserIdRR< B
!=RRC E
currentUserIdRRF S
)RRS T
.RRT U
UserRRU Y
.RRY Z
UserNameRRZ b
,RRb c
OwnNameSS 
=SS 
sessionSS !
.SS! "
PlayersSS" )
.SS) *
FirstSS* /
(SS/ 0
pSS0 1
=>SS2 4
pSS5 6
.SS6 7
UserIdSS7 =
==SS> @
currentUserIdSSA N
)SSN O
.SSO P
UserSSP T
.SST U
UserNameSSU ]
,SS] ^$
CurrentRoundPlayerUserIdTT (
=TT) *
sessionTT+ 2
.TT2 3
PlayersTT3 :
.TT: ;
FirstTT; @
(TT@ A
pTTA B
=>TTC E
pTTF G
.TTG H
IsCurrentPlayerTurnTTH [
)TT[ \
.TT\ ]
UserIdTT] c
}UU 
)UU 
;UU 
}VV 	
publicXX 
asyncXX 
TaskXX 
<XX 
GameSessionXX %
>XX% &%
GetWithPlayersAndSettingsXX' @
(XX@ A
GuidXXA E
gameSessionIdXXF S
)XXS T
{YY 	
returnZZ 
awaitZZ 
ItemSetZZ  
.[[ 
Include[[ 
([[ 
gs[[ 
=>[[ 
gs[[ !
.[[! "
Settings[[" *
)[[* +
.\\ 
Include\\ 
(\\ 
gs\\ 
=>\\ 
gs\\ !
.\\! "
Players\\" )
)\\) *
.]] 
FirstOrDefaultAsync]] $
(]]$ %
gs]]% '
=>]]( *
gs]]+ -
.]]- .
Id]]. 0
==]]1 3
gameSessionId]]4 A
)]]A B
;]]B C
}^^ 	
public`` "
GameSessionsRepository`` %
(``% & 
ApplicationDbContext``& :
context``; B
)``B C
:``D E
base``F J
(``J K
context``K R
)``R S
{aa 	
}bb 	
}cc 
}dd ¶
CD:\dev\Battleships\Battleships\Repositories\IBattleshipsDatabase.cs
	namespace 	
Battleships
 
. 
Repositories "
{ 
public 

	interface  
IBattleshipsDatabase )
{ 
public 
IRepository 
< 
Achievement &
>& '"
AchievementsRepository( >
{? @
getA D
;D E
}F G
public		 #
IGameSessionsRepository		 &"
GameSessionsRepository		' =
{		> ?
get		@ C
;		C D
}		E F
public

 *
IGameSessionSettingsRepository

 -)
GameSessionSettingsRepository

. K
{

L M
get

N Q
;

Q R
}

S T
public 
IPlayersRepository !
PlayersRepository" 3
{4 5
get6 9
;9 :
}; <
public 
IRepository 
< 

PlayerShip %
>% &!
PlayerShipsRepository' <
{= >
get? B
;B C
}D E
public  
IShipTilesRepository #
ShipTilesRepository$ 7
{8 9
get: =
;= >
}? @
public 
IShipsRepository 
ShipsRepository  /
{0 1
get2 5
;5 6
}7 8
public 
IRepository 
< 
UserCosmetic '
>' (#
UserCosmeticsRepository) @
{A B
getC F
;F G
}H I
public 
IRepository 
< 
Friend !
>! "
FriendsRepository# 4
{5 6
get7 :
;: ;
}< =
} 
} „
MD:\dev\Battleships\Battleships\Repositories\IGameSessionSettingsRepository.cs
	namespace 	
Battleships
 
. 
Repositories "
{ 
public 

	interface *
IGameSessionSettingsRepository 3
:4 5
IRepository6 A
<A B
GameSessionSettingsB U
>U V
{ 
Task		 
<		 
GameSessionSettings		  
>		  !
GetBySessionId		" 0
(		0 1
Guid		1 5
gameSessionId		6 C
)		C D
;		D E
}

 
} à
FD:\dev\Battleships\Battleships\Repositories\IGameSessionsRepository.cs
	namespace 	
Battleships
 
. 
Repositories "
{ 
public		 

	interface		 #
IGameSessionsRepository		 ,
:		- .
IRepository		/ :
<		: ;
GameSession		; F
>		F G
{

 
Task 
< 
GameSessionDto 
> 
GetDtoWithPlayers .
(. /
Guid/ 3
gameSessionId4 A
)A B
;B C
Task 
< 
int 
> )
GetRequiredDestroyedShipCount /
(/ 0
Guid0 4
gameSessionId5 B
)B C
;C D
Task 
< 
int 
> 
GetCurrentRound !
(! "
Guid" &
gameSessionId' 4
)4 5
;5 6
Task 
< 
string 
> 
GetEndgameStrategy '
(' (
Guid( ,
gameSessionId- :
): ;
;; <
Task 
< 
( 
Guid 
, 
Guid 
) 
> 
GetPlayerIds '
(' (
Guid( ,
gameSessionId- :
,: ;
string< B
currentUserIdC P
)P Q
;Q R
Task 
< 
InGameSessionDto 
> 
GetInGameSession /
(/ 0
Guid0 4
gameSessionId5 B
,B C
stringD J
currentUserIdK X
)X Y
;Y Z
Task 
< 
GameSession 
> %
GetWithPlayersAndSettings 3
(3 4
Guid4 8
gameSessionId9 F
)F G
;G H
} 
} ˜
AD:\dev\Battleships\Battleships\Repositories\IPlayersRepository.cs
	namespace 	
Battleships
 
. 
Repositories "
{ 
public 

	interface 
IPlayersRepository '
:( )
IRepository* 5
<5 6
Player6 <
>< =
{		 
}

 
} ∞
:D:\dev\Battleships\Battleships\Repositories\IRepository.cs
	namespace 	
Battleships
 
. 
Repositories "
{ 
public		 

	interface		 
IRepository		  
<		  !
TModel		! '
>		' (
where		) .
TModel		/ 5
:		6 7
	BaseModel		8 A
{

 
Task 
< 
TModel 
> 
GetById 
( 
Guid !
id" $
)$ %
;% &
Task 
< 
List 
< 
TModel 
> 
> 
GetAll !
(! "
)" #
;# $
Task 
< 
List 
< 
TModel 
> 
> 
GetWhere #
(# $

Expression$ .
<. /
Func/ 3
<3 4
TModel4 :
,: ;
bool< @
>@ A
>A B
filterC I
)I J
;J K
Task 
< 
Guid 
> 
Create 
( 
TModel  
model! &
)& '
;' (
Task 
Update 
( 
TModel 
model  
)  !
;! "
Task 
Delete 
( 
TModel 
model  
)  !
;! "
Task 
< 
List 
< 
Guid 
> 
> 

CreateMany #
(# $
List$ (
<( )
TModel) /
>/ 0
models1 7
)7 8
;8 9
Task 

UpdateMany 
( 
List 
< 
TModel #
># $
models% +
)+ ,
;, -
Task 

DeleteMany 
( 
List 
< 
TModel #
># $
models% +
)+ ,
;, -
bool 
IsEmpty 
( 
) 
; 
} 
} °
?D:\dev\Battleships\Battleships\Repositories\IShipsRepository.cs
	namespace 	
Battleships
 
. 
Repositories "
{ 
public 

	interface 
IShipsRepository %
:& '
IRepository( 3
<3 4
Ship4 8
>8 9
{ 
Task 
< 
Ship 
> 
	GetByType 
( 
string #
shipType$ ,
), -
;- .
}		 
}

 ≈
CD:\dev\Battleships\Battleships\Repositories\IShipTilesRepository.cs
	namespace 	
Battleships
 
. 
Repositories "
{ 
public		 

	interface		  
IShipTilesRepository		 )
:		* +
IRepository		, 7
<		7 8
ShipTile		8 @
>		@ A
{

 
Task 
< 
List 
< 
ShipTile 
> 
> 
GetAttackedTiles -
(- .
AttackPayload. ;
attack< B
)B C
;C D
Task 
< 
List 
< 
ShipTile 
> 
> 
GetSessionShipTiles 0
(0 1
Guid1 5
gameSessionId6 C
)C D
;D E
Task 
< 
List 
< 
ShipTile 
> 
> 
GetPlayerTiles +
(+ ,
Guid, 0
playerId1 9
)9 :
;: ;
} 
} ¿	
@D:\dev\Battleships\Battleships\Repositories\PlayersRepository.cs
	namespace 	
Battleships
 
. 
Repositories "
{		 
public

 

class

 
PlayersRepository

 "
:

# $
BaseRepository

% 3
<

3 4
Player

4 :
>

: ;
,

; <
IPlayersRepository

= O
{ 
public 
PlayersRepository  
(  ! 
ApplicationDbContext! 5
context6 =
)= >
:? @
baseA E
(E F
contextF M
)M N
{ 	
} 	
public 
override 
async 
Task "
<" #
List# '
<' (
Player( .
>. /
>/ 0
GetAll1 7
(7 8
)8 9
{ 	
return 
await 
ItemSet  
.  !
Include! (
(( )
x) *
=>+ -
x. /
./ 0
User0 4
)4 5
. 
ToListAsync 
( 
) 
; 
} 	
} 
} „
>D:\dev\Battleships\Battleships\Repositories\ShipsRepository.cs
	namespace 	
Battleships
 
. 
Repositories "
{ 
public 

class 
ShipsRepository  
:! "
BaseRepository# 1
<1 2
Ship2 6
>6 7
,7 8
IShipsRepository9 I
{ 
public		 
async		 
Task		 
<		 
Ship		 
>		 
	GetByType		  )
(		) *
string		* 0
shipType		1 9
)		9 :
{

 	
return 
await 
	GetSingle "
(" #
ship# '
=>( *
ship+ /
./ 0
ShipType0 8
==9 ;
shipType< D
)D E
;E F
} 	
public 
ShipsRepository 
(  
ApplicationDbContext 3
context4 ;
); <
:= >
base? C
(C D
contextD K
)K L
{ 	
} 	
} 
} ≥
BD:\dev\Battleships\Battleships\Repositories\ShipTilesRepository.cs
	namespace

 	
Battleships


 
.

 
Repositories

 "
{ 
public 

class 
ShipTilesRepository $
:% &
BaseRepository' 5
<5 6
ShipTile6 >
>> ?
,? @ 
IShipTilesRepositoryA U
{ 
public 
ShipTilesRepository "
(" # 
ApplicationDbContext# 7
context8 ?
)? @
:A B
baseC G
(G H
contextH O
)O P
{ 	
} 	
public 
async 
Task 
< 
List 
< 
ShipTile '
>' (
>( )
GetAttackedTiles* :
(: ;
AttackPayload; H
attackI O
)O P
{ 	
return 
await 
GetWhere !
(! "
tile" &
=>' )
tile 
. 
XCoordinate  
==! #
attack$ *
.* +
TargetXCoordinate+ <
&&= ?
tile@ D
.D E
YCoordinateE P
==Q S
attackT Z
.Z [
TargetYCoordinate[ l
&&m o
tile 
. 

PlayerShip 
.  
Player  &
.& '
UserId' -
!=. 0
attack1 7
.7 8
AttackingUserId8 G
&&H J
tile 
. 

PlayerShip 
.  
Player  &
.& '
GameSessionId' 4
==5 7
attack8 >
.> ?
GameSessionId? L
) 
; 
} 	
public 
async 
Task 
< 
List 
< 
ShipTile '
>' (
>( )
GetSessionShipTiles* =
(= >
Guid> B
gameSessionIdC P
)P Q
{ 	
return 
await 
ItemSet  
. 
Include 
( 
tile 
=>  
tile! %
.% &

PlayerShip& 0
)0 1
. 
Where 
( 
tile 
=> 
tile #
.# $

PlayerShip$ .
.. /
Player/ 5
.5 6
GameSessionId6 C
==D F
gameSessionIdG T
)T U
.   
ToListAsync   
(   
)   
;   
}!! 	
public## 
async## 
Task## 
<## 
List## 
<## 
ShipTile## '
>##' (
>##( )
GetPlayerTiles##* 8
(##8 9
Guid##9 =
playerId##> F
)##F G
{$$ 	
return%% 
await%% 
ItemSet%%  
.&& 
Where&& 
(&& 
tile&& 
=>&& 
tile&& #
.&&# $

PlayerShip&&$ .
.&&. /
PlayerId&&/ 7
==&&8 :
playerId&&; C
||&&D F
tile&&G K
.&&K L
TargetPlayerId&&L Z
==&&[ ]
playerId&&^ f
)&&f g
.'' 
ToListAsync'' 
('' 
)'' 
;'' 
}(( 	
}** 
}++ ≈
ID:\dev\Battleships\Battleships\Services\Achievement\AchievementService.cs
	namespace

 	
Battleships


 
.

 
Services

 
.

 
Achievement

 *
{ 
public 

class 
AchievementService #
:$ %
IAchievementService& 9
{ 
private 
readonly  
IBattleshipsDatabase -
_db. 1
;1 2
public 
AchievementService !
(" # 
IBattleshipsDatabase# 7
db8 :
): ;
{ 	
_db 
= 
db 
; 
} 	
public 
async 
Task 
< 
List 
< 
AchievementDto -
>- .
>. /
ListAchievements0 @
(@ A
)A B
{ 	
var 
allAchievements 
=  !
await" '
_db( +
.+ ,"
AchievementsRepository, B
.B C
GetAllC I
(I J
)J K
;K L
var 
achievementList 
=  !
new" %
List& *
<* +
AchievementDto+ 9
>9 :
(: ;
); <
;< =
foreach 
( 
var 
item 
in  
allAchievements! 0
)0 1
{ 
var 
achievement 
=  !
new" %
AchievementDto& 4
(4 5
)5 6
{ 
Name 
= 
item 
.  
Name  $
,$ %
Description   
=    !
item  " &
.  & '
Description  ' 2
}!! 
;!! 
achievementList## 
.##  
Add##  #
(### $
achievement##$ /
)##/ 0
;##0 1
}$$ 
return&& 
achievementList&& "
;&&" #
}'' 	
}(( 
})) ƒ
UD:\dev\Battleships\Battleships\Services\Achievement\Interfaces\IAchievementService.cs
	namespace 	
Battleships
 
. 
Services 
. 
Achievement *
.* +

Interfaces+ 5
{ 
public 

	interface 
IAchievementService (
{ 
Task		 
<		 
List		 
<		 
AchievementDto		  
>		  !
>		! "
ListAchievements		# 3
(		3 4
)		4 5
;		5 6
}

 
} ª.
AD:\dev\Battleships\Battleships\Services\AttackExecutionService.cs
	namespace 	
Battleships
 
. 
Services 
{		 
public

 

class

 "
AttackExecutionService

 '
:

( )#
IAttackExecutionService

* A
{ 
private 
readonly  
IBattleshipsDatabase - 
_battleshipsDatabase. B
;B C
private 
readonly 
IEndgameService (
_endgameService) 8
;8 9
private 
readonly .
"IBattleshipsSynchronizationService ;.
"_battleshipsSynchronizationService< ^
;^ _
public "
AttackExecutionService %
(% & 
IBattleshipsDatabase  
battleshipsDatabase! 4
,4 5
IEndgameService 
endgameService *
,* +.
"IBattleshipsSynchronizationService .-
!battleshipsSynchronizationService/ P
)P Q
{ 	 
_battleshipsDatabase  
=! "
battleshipsDatabase# 6
;6 7
_endgameService 
= 
endgameService ,
;, -.
"_battleshipsSynchronizationService .
=/ 0-
!battleshipsSynchronizationService1 R
;R S
} 	
public 
async 
Task 
ExecuteAttack '
(' (
AttackPayload( 5
attack6 <
)< =
{ 	
var 
session 
= 
await  
_battleshipsDatabase  4
.4 5"
GameSessionsRepository5 K
.K L%
GetWithPlayersAndSettingsL e
(e f
attackf l
.l m
GameSessionIdm z
)z {
;{ |
var 
attackedTiles 
= 
await  % 
_battleshipsDatabase& :
.: ;
ShipTilesRepository; N
.N O
GetAttackedTilesO _
(_ `
attack` f
)f g
;g h
var 
currentUserPlayer !
=" #
session$ +
.+ ,
Players, 3
.3 4
First4 9
(9 :
p: ;
=>< >
p? @
.@ A
IsCurrentPlayerTurnA T
)T U
;U V
var 
opponentPlayer 
=  
session! (
.( )
Players) 0
.0 1
First1 6
(6 7
p7 8
=>9 ;
!< =
p= >
.> ?
IsCurrentPlayerTurn? R
)R S
;S T
if!! 
(!! 
attackedTiles!! 
.!! 
Any!! !
(!!! "
)!!" #
)!!# $
{"" 
attackedTiles## 
.## 
ForEach## %
(##% &
t##& '
=>##( *
t##+ ,
.##, -
IsDestroyed##- 8
=##9 :
true##; ?
)##? @
;##@ A
await$$  
_battleshipsDatabase$$ *
.$$* +
ShipTilesRepository$$+ >
.$$> ?

UpdateMany$$? I
($$I J
attackedTiles$$J W
)$$W X
;$$X Y
}%% 
else&& 
{'' 
var(( 
tile(( 
=(( 
new(( 
ShipTile(( '
{)) 
IsDestroyed** 
=**  !
true**" &
,**& '
XCoordinate++ 
=++  !
attack++" (
.++( )
TargetXCoordinate++) :
,++: ;
YCoordinate,, 
=,,  !
attack,," (
.,,( )
TargetYCoordinate,,) :
,,,: ;
AttackerPlayerId-- $
=--% &
currentUserPlayer--' 8
.--8 9
Id--9 ;
,--; <
TargetPlayerId.. "
=..# $
opponentPlayer..% 3
...3 4
Id..4 6
}// 
;// 
await00  
_battleshipsDatabase00 *
.00* +
ShipTilesRepository00+ >
.00> ?
Create00? E
(00E F
tile00F J
)00J K
;00K L
}11 
session33 
.33 
CurrentRound33  
+=33! #
$num33$ %
;33% &
currentUserPlayer44 
.44 
IsCurrentPlayerTurn44 1
=442 3
false444 9
;449 :
opponentPlayer55 
.55 
IsCurrentPlayerTurn55 .
=55/ 0
true551 5
;555 6
await77  
_battleshipsDatabase77 &
.77& '"
GameSessionsRepository77' =
.77= >
Update77> D
(77D E
session77E L
)77L M
;77M N
await88 .
"_battleshipsSynchronizationService88 4
.884 5
SendAttackMessage885 F
(88F G
session88G N
.88N O
Id88O Q
,88Q R
new88S V
BattleshipsMessage88W i
<88i j
AttackPayload88j w
>88w x
{99 
CallerUserId:: 
=:: 
attack:: %
.::% &
AttackingUserId::& 5
,::5 6
Payload;; 
=;; 
attack;;  
}<< 
)<< 
;<< 
if>> 
(>> 
await>> 
_endgameService>> %
.>>% &
IsEndgameReached>>& 6
(>>6 7
attack>>7 =
.>>= >
GameSessionId>>> K
)>>K L
)>>L M
{?? 
await@@ 
_endgameService@@ %
.@@% &
EndGameSession@@& 4
(@@4 5
attack@@5 ;
.@@; <
GameSessionId@@< I
,@@I J
attack@@K Q
.@@Q R
AttackingUserId@@R a
)@@a b
;@@b c
}AA 
}BB 	
}CC 
}DD ã6
OD:\dev\Battleships\Battleships\Services\Authentication\AuthenticationService.cs
	namespace 	
Battleships
 
. 
Services 
. 
Authentication -
{ 
public 

class !
AuthenticationService &
:' ("
IAuthenticationService) ?
{ 
private 
readonly 
UserManager $
<$ %
ApplicationUser% 4
>4 5
_userManager6 B
;B C
public !
AuthenticationService $
($ %
UserManager 
< 
ApplicationUser '
>' (
userManager) 4
) 	
{ 	
_userManager 
= 
userManager &
;& '
} 	
public 
async 
Task 
< 
string  
>  !
Login" '
(' (
UserCredentialsDto( :
userCredentialsDto; M
)M N
{ 	
var 
user 
= 
await 
_userManager )
.) *
FindByEmailAsync* :
(: ;
userCredentialsDto; M
.M N
EmailN S
)S T
;T U
if   
(   
user   
==   
null   
||   
!    !
await  ! &
_userManager  ' 3
.  3 4
CheckPasswordAsync  4 F
(  F G
user  G K
,  K L
userCredentialsDto  M _
.  _ `
Password  ` h
)  h i
)  i j
{!! 
throw"" 
new"" #
AuthenticationException"" 1
(""1 2
$str""2 D
)""D E
;""E F
}## 
var%% 
jwtToken%% 
=%% 
await%%  
CreateJwtToken%%! /
(%%/ 0
user%%0 4
)%%4 5
;%%5 6
return'' 
jwtToken'' 
;'' 
}(( 	
public** 
async** 
Task** 
Register** "
(**" #
UserCredentialsDto**# 5
userCredentialsDto**6 H
)**H I
{++ 	
var,, 
newUser,, 
=,, 
new,, 
ApplicationUser,, -
{-- 
Email.. 
=.. 
userCredentialsDto.. *
...* +
Email..+ 0
,..0 1
UserName// 
=// 
userCredentialsDto// -
.//- .
Email//. 3
,//3 4
EmailConfirmed00 
=00  
true00! %
,00% &
Name11 
=11 
$str11 
,11 
Surname22 
=22 
$str22 #
}33 
;33 
await55 
_userManager55 
.55 
CreateAsync55 *
(55* +
newUser55+ 2
)552 3
;553 4
var77 
createdUser77 
=77 
await77 #
_userManager77$ 0
.770 1
FindByEmailAsync771 A
(77A B
newUser77B I
.77I J
Email77J O
)77O P
;77P Q
var88 
result88 
=88 
await88 
_userManager88 +
.88+ ,
AddPasswordAsync88, <
(88< =
createdUser88= H
,88H I
userCredentialsDto88J \
.88\ ]
Password88] e
)88e f
;88f g
if99 
(99 
!99 
result99 
.99 
	Succeeded99 !
)99! "
{:: 
throw;; 
new;; 
	Exception;; #
(;;# $
$str;;$ ,
);;, -
;;;- .
}<< 
}== 	
private?? 
async?? 
Task?? 
<?? 
string?? !
>??! "
CreateJwtToken??# 1
(??1 2
ApplicationUser??2 A
user??B F
)??F G
{@@ 	
varAA 
tokenDescriptorAA 
=AA  !
newAA" %#
SecurityTokenDescriptorAA& =
{BB 
SubjectCC 
=CC 
awaitCC 
GetClaimsIdentityCC  1
(CC1 2
userCC2 6
)CC6 7
,CC7 8
ExpiresDD 
=DD 
DateTimeDD "
.DD" #
UtcNowDD# )
.DD) *
AddHoursDD* 2
(DD2 3
$numDD3 5
)DD5 6
,DD6 7
SigningCredentialsEE "
=EE# $
newFF 
SigningCredentialsFF *
(FF* +!
AuthenticationUtilityGG -
.GG- .#
GetSymmetricSecurityKeyGG. E
(GGE F
)GGF G
,GGG H
SecurityAlgorithmsHH *
.HH* +

HmacSha256HH+ 5
)II 
}JJ 
;JJ 
varLL 
tokenHandlerLL 
=LL 
newLL "#
JwtSecurityTokenHandlerLL# :
(LL: ;
)LL; <
;LL< =
varMM 
securityTokenMM 
=MM 
tokenHandlerMM  ,
.MM, -
CreateTokenMM- 8
(MM8 9
tokenDescriptorMM9 H
)MMH I
;MMI J
varNN 
tokenNN 
=NN 
tokenHandlerNN $
.NN$ %

WriteTokenNN% /
(NN/ 0
securityTokenNN0 =
)NN= >
;NN> ?
returnPP 
tokenPP 
;PP 
}QQ 	
privateSS 
asyncSS 
TaskSS 
<SS 
ClaimsIdentitySS )
>SS) *
GetClaimsIdentitySS+ <
(SS< =
ApplicationUserSS= L
userSSM Q
)SSQ R
{TT 	
varUU 
claimsUU 
=UU 
awaitUU 
	GetClaimsUU (
(UU( )
userUU) -
)UU- .
;UU. /
varVV 
claimsIdentityVV 
=VV  
newVV! $
ClaimsIdentityVV% 3
(VV3 4
claimsVV4 :
)VV: ;
;VV; <
returnXX 
claimsIdentityXX !
;XX! "
}YY 	
private[[ 
async[[ 
Task[[ 
<[[ 
List[[ 
<[[  
Claim[[  %
>[[% &
>[[& '
	GetClaims[[( 1
([[1 2
ApplicationUser[[2 A
user[[B F
)[[F G
{\\ 	
var]] 
claims]] 
=]] 
new]] 
List]] !
<]]! "
Claim]]" '
>]]' (
{^^ 
new__ 
(__ 
BattleshipClaims__ $
.__$ %
UserId__% +
,__+ ,
user__- 1
.__1 2
Id__2 4
.__4 5
ToString__5 =
(__= >
)__> ?
)__? @
}`` 
;`` 
returnbb 
claimsbb 
;bb 
}cc 	
}dd 
}ee ¯
OD:\dev\Battleships\Battleships\Services\Authentication\AuthenticationUtility.cs
	namespace 	
Battleships
 
. 
Services 
. 
Authentication -
{ 
public 

class !
AuthenticationUtility &
{ 
private 
const 
string 
Key  
=! "
$str# j
;j k
public

 
static

  
SymmetricSecurityKey

 *#
GetSymmetricSecurityKey

+ B
(

B C
)

C D
{ 	
return 
new  
SymmetricSecurityKey +
(+ ,
Encoding, 4
.4 5
UTF85 9
.9 :
GetBytes: B
(B C
KeyC F
)F G
)G H
;H I
} 	
} 
} Ä
LD:\dev\Battleships\Battleships\Services\Authentication\CurrentUserService.cs
	namespace 	
Battleships
 
. 
Services 
. 
Authentication -
{ 
public		 

class		 
CurrentUserService		 #
:		$ %
ICurrentUserService		& 9
{

 
private 
readonly  
IHttpContextAccessor - 
_httpContextAccessor. B
;B C
public 
CurrentUserService !
(! " 
IHttpContextAccessor" 6
httpContextAccessor7 J
)J K
{ 	 
_httpContextAccessor  
=! "
httpContextAccessor# 6
;6 7
} 	
public 
string 
GetCurrentUserId &
(& '
)' (
{ 	
var 
userId 
= 
GetClaimValue &
(& '
BattleshipClaims' 7
.7 8
UserId8 >
)> ?
;? @
return 
userId 
; 
} 	
private 
string 
GetClaimValue $
($ %
string% +
	claimType, 5
)5 6
{ 	
var 

claimValue 
=  
_httpContextAccessor 1
.1 2
HttpContext2 =
?= >
.> ?
User? C
.C D
FindFirstValueD R
(R S
	claimTypeS \
)\ ]
;] ^
if 
( 

claimValue 
is 
null "
)" #
{ 
throw 
new %
InvalidOperationException 3
(3 4
$"4 6
$str6 <
{< =
	claimType= F
}F G
$strG Q
"Q R
)R S
;S T
}   
return"" 

claimValue"" 
;"" 
}## 	
}$$ 
}%% ‚
[D:\dev\Battleships\Battleships\Services\Authentication\Interfaces\IAuthenticationService.cs
	namespace 	
Battleships
 
. 
Services 
. 
Authentication -
.- .

Interfaces. 8
{ 
public 

	interface "
IAuthenticationService +
{ 
Task 
< 
string 
> 
Login 
( 
UserCredentialsDto -
userCredentialsDto. @
)@ A
;A B
Task		 
Register		 
(		 
UserCredentialsDto		 (
userCredentialsDto		) ;
)		; <
;		< =
}

 
} ˆ
XD:\dev\Battleships\Battleships\Services\Authentication\Interfaces\ICurrentUserService.cs
	namespace 	
Battleships
 
. 
Services 
. 
Authentication -
.- .

Interfaces. 8
{ 
public 

	interface 
ICurrentUserService (
{ 
public 
string 
GetCurrentUserId &
(& '
)' (
;( )
} 
} ﬁ
<D:\dev\Battleships\Battleships\Services\Bridge\IShipState.cs
	namespace 	
Battleships
 
. 
Services 
. 
Bridge %
{ 
public 

	interface 

IShipState 
{ 
void 
ChangeState 
( 
) 
; 
string 
GetState 
( 
) 
; 
} 
} ç
:D:\dev\Battleships\Battleships\Services\Bridge\OffState.cs
	namespace 	
Battleships
 
. 
Services 
. 
Bridge %
{ 
public 

class 
OffState 
: 

IShipState &
{ 
private 
Ship 
ship 
; 
public		 
void		 
ChangeState		 
(		  
)		  !
{

 	
ship 
. 
Name 
= 
$str 3
;3 4
ship 
. 
Description 
= 
$str A
;A B
} 	
public 
string 
GetState 
( 
)  
{ 	
return 
$str 
; 
} 	
} 
} ñ	
9D:\dev\Battleships\Battleships\Services\Bridge\OnState.cs
	namespace 	
Battleships
 
. 
Services 
. 
Bridge %
{ 
public 

class 
OnState 
: 

IShipState %
{ 
private 
Ship 
ship 
; 
public		 
void		 
ChangeState		 
(		  
)		  !
{

 	
ship 
. 
Name 
= 
$str 2
;2 3
ship 
. 
Description 
= 
$str @
;@ A
} 	
public 
string 
GetState 
( 
)  
{ 	
return 
$str 
; 
} 	
public 
void 
ni 
( 
) 
{ 	
throw 
new 
System 
. #
NotImplementedException 4
(4 5
)5 6
;6 7
} 	
} 
} Õ+
FD:\dev\Battleships\Battleships\Services\Builders\GameSessionBuilder.cs
	namespace 	
Battleships
 
. 
Services 
. 
Builders '
;' (
public 
class 
GameSessionBuilder 
:  !
IGameSessionBuilder" 5
{		 
private

 
Models

 
.

 
GameSession

 
session

 &
=

' (
new

) ,
Models

- 3
.

3 4
GameSession

4 ?
(

? @
)

@ A
;

A B
public 

GameSessionBuilder 
WithIcon &
(& '
string' -
icon. 2
)2 3
{ 
session 
. 
Icon 
= 
icon 
; 
return 
this 
; 
} 
public 

GameSessionBuilder 
WithName &
(& '
string' -
name. 2
)2 3
{ 
session 
. 
Name 
= 
name 
; 
return 
this 
; 
} 
public 

GameSessionBuilder 
WithDateCreated -
(- .
DateTime. 6
dateCreated7 B
)B C
{ 
session 
. 
DateCreated 
= 
dateCreated )
;) *
return 
this 
; 
} 
public 

GameSessionBuilder 
WithGameLength ,
(, -
TimeSpan- 5

gameLength6 @
)@ A
{ 
session   
.   

GameLength   
=   

gameLength   '
;  ' (
return!! 
this!! 
;!! 
}"" 
public$$ 

GameSessionBuilder$$ 
WithPlayers$$ )
($$) *
List$$* .
<$$. /
Player$$/ 5
>$$5 6
players$$7 >
)$$> ?
{%% 
session&& 
.&& 
Players&& 
=&& 
players&& !
;&&! "
return'' 
this'' 
;'' 
}(( 
public** 

GameSessionBuilder** 
WithSessionSettings** 1
(**1 2
GameSessionSettings**2 E
settings**F N
)**N O
{++ 
session,, 
.,, 
Settings,, 
=,, 
settings,, #
;,,# $
session-- 
.-- 
EndgameStrategy-- 
=--  !$
GetEndgameStrategyString--" :
(--: ;
settings--; C
)--C D
;--D E
return.. 
this.. 
;.. 
}// 
public11 

GameSessionBuilder11 
WithCurrentRound11 .
(11. /
int11/ 2
round113 8
)118 9
{22 
session33 
.33 
CurrentRound33 
=33 
round33 $
;33$ %
return44 
this44 
;44 
}55 
private77 
string77 $
GetEndgameStrategyString77 +
(77+ ,
GameSessionSettings77, ?
settings77@ H
)77H I
{88 
if99 

(99 
settings99 
.99 
GameType99 
==99  
	GameTypes99! *
.99* +

DeathMatch99+ 5
)995 6
{:: 	
return;; 
Data;; 
.;; 
	Constants;; !
.;;! "
EndgameStrategies;;" 3
.;;3 4

DeathMatch;;4 >
;;;> ?
}<< 	
if>> 

(>> 
settings>> 
.>> 
GameType>> 
==>>  
	GameTypes>>! *
.>>* +
Classic>>+ 2
)>>2 3
{?? 	
return@@ 
Data@@ 
.@@ 
	Constants@@ !
.@@! "
EndgameStrategies@@" 3
.@@3 4
Classic@@4 ;
;@@; <
}AA 	
ifCC 

(CC 
settingsCC 
.CC (
DestroyedShipCountForEndgameCC 1
>CC2 3
$numCC4 5
)CC5 6
{DD 	
returnEE 
DataEE 
.EE 
	ConstantsEE !
.EE! "
EndgameStrategiesEE" 3
.EE3 4
DestroyedShipCountEE4 F
;EEF G
}FF 	
ifHH 

(HH 
settingsHH 
.HH %
RoundCountLimitForEndgameHH .
>HH/ 0
$numHH1 2
)HH2 3
{II 	
returnJJ 
DataJJ 
.JJ 
	ConstantsJJ !
.JJ! "
EndgameStrategiesJJ" 3
.JJ3 4
RoundCountLimitJJ4 C
;JJC D
}KK 	
returnMM 
nullMM 
;MM 
}NN 
publicPP 

GameSessionBuilderPP 

WithStatusPP (
(PP( )
GameSessionStatusPP) :
statusPP; A
)PPA B
{QQ 
sessionRR 
.RR 
StatusRR 
=RR 
statusRR 
;RR  
returnTT 
thisTT 
;TT 
}UU 
publicWW 

ModelsWW 
.WW 
GameSessionWW 
BuildWW #
(WW# $
)WW$ %
{XX 
returnYY 
thisYY 
.YY 
sessionYY 
;YY 
}ZZ 
}[[ ∆

FD:\dev\Battleships\Battleships\Services\Builders\GameSessionCreator.cs
	namespace 	
Battleships
 
. 
Services 
. 
Builders '
{ 
public 

class 
GameSessionCreator #
{ 
private 
readonly 
IGameSessionBuilder ,
_builder- 5
;5 6
public		 
GameSessionCreator		 !
(		! "
IGameSessionBuilder		" 5
builder		6 =
)		= >
{

 	
this 
. 
_builder 
= 
builder #
;# $
} 	
public 
void &
BuildDefaultMinimalSession .
(. /
)/ 0
{ 	
this 
. 
_builder 
. 
WithIcon "
(" #
$str# %
)% &
;& '
this 
. 
_builder 
. 
WithName "
(" #
$str# )
)) *
;* +
this 
. 
_builder 
. 
WithDateCreated )
() *
DateTime* 2
.2 3
Now3 6
)6 7
;7 8
} 	
} 
} ˆ
GD:\dev\Battleships\Battleships\Services\Builders\IGameSessionBuilder.cs
	namespace 	
Battleships
 
. 
Services 
. 
Builders '
{ 
public 

	interface 
IGameSessionBuilder (
{ 
GameSessionBuilder		 
WithIcon		 #
(		# $
string		$ *
icon		+ /
)		/ 0
;		0 1
GameSessionBuilder

 
WithName

 #
(

# $
string

$ *
name

+ /
)

/ 0
;

0 1
GameSessionBuilder 
WithDateCreated *
(* +
DateTime+ 3
dateCreated4 ?
)? @
;@ A
GameSessionBuilder 
WithGameLength )
() *
TimeSpan* 2

gameLength3 =
)= >
;> ?
GameSessionBuilder 
WithPlayers &
(& '
List' +
<+ ,
Player, 2
>2 3
players4 ;
); <
;< =
GameSessionBuilder 
WithSessionSettings .
(. /
GameSessionSettings/ B
settingsC K
)K L
;L M
GameSessionBuilder 
WithCurrentRound +
(+ ,
int, /
round0 5
)5 6
;6 7
Models 
. 
GameSession 
Build  
(  !
)! "
;" #
} 
} Ñ
DD:\dev\Battleships\Battleships\Services\Builders\IShipTileBuilder.cs
	namespace 	
Battleships
 
. 
Services 
. 
Builders '
{ 
public 

	interface 
IShipTileBuilder %
{ 
ShipTileBuilder		 
WithXCoordinate		 '
(		' (
int		( +
x		, -
)		- .
;		. /
ShipTileBuilder

 
WithYCoordinate

 '
(

' (
int

( +
y

, -
)

- .
;

. /
ShipTileBuilder 
WithIsDestroyed '
(' (
bool( ,
isDestroyed- 8
)8 9
;9 :
ShipTileBuilder 
WithPlayerShipId (
(( )
Guid) -
id. 0
)0 1
;1 2
ShipTileBuilder 
WithPlayerShip &
(& '

PlayerShip' 1

playerShip2 <
)< =
;= >
ShipTileBuilder 

WithEngine "
(" #
Engine# )
engine* 0
)0 1
;1 2
ShipTileBuilder 
WithGuns  
(  !
Gun! $
gun% (
)( )
;) *
ShipTileBuilder 

WithShield "
(" #
bool# '
shield( .
). /
;/ 0
ShipTileBuilder 
WithGunCount $
($ %
int% (
gunCount) 1
)1 2
;2 3
ShipTileBuilder 
WithIsFlagship &
(& '
bool' +

isFlagship, 6
)6 7
;7 8
ShipTile 
Build 
( 
) 
; 
} 
} Ö 
CD:\dev\Battleships\Battleships\Services\Builders\ShipTileBuilder.cs
	namespace 	
Battleships
 
. 
Services 
. 
Builders '
{ 
public 

class 
ShipTileBuilder  
:! "
IShipTileBuilder# 3
{ 
private		 
ShipTile		 
shipTile		 !
=		" #
new		$ '
ShipTile		( 0
(		0 1
)		1 2
;		2 3
public 
ShipTileBuilder 
WithXCoordinate .
(. /
int/ 2
x3 4
)4 5
{ 	
shipTile 
. 
XCoordinate  
=! "
x# $
;$ %
return 
this 
; 
} 	
public 
ShipTileBuilder 
WithYCoordinate .
(. /
int/ 2
y3 4
)4 5
{ 	
shipTile 
. 
YCoordinate  
=! "
y# $
;$ %
return 
this 
; 
} 	
public 
ShipTileBuilder 
WithIsDestroyed .
(. /
bool/ 3
isDestroyed4 ?
)? @
{ 	
shipTile 
. 
IsDestroyed  
=! "
isDestroyed# .
;. /
return 
this 
; 
} 	
public 
ShipTileBuilder 
WithPlayerShipId /
(/ 0
Guid0 4
id5 7
)7 8
{ 	
shipTile 
. 
PlayerShipId !
=" #
id$ &
;& '
return   
this   
;   
}!! 	
public## 
ShipTileBuilder## 
WithPlayerShip## -
(##- .

PlayerShip##. 8

playerShip##9 C
)##C D
{$$ 	
shipTile%% 
.%% 

PlayerShip%% 
=%%  !

playerShip%%" ,
;%%, -
return&& 
this&& 
;&& 
}'' 	
public)) 
ShipTileBuilder)) 

WithEngine)) )
())) *
Engine))* 0
engine))1 7
)))7 8
{** 	
shipTile++ 
.++ 
Engine++ 
=++ 
engine++ $
;++$ %
return,, 
this,, 
;,, 
}-- 	
public// 
ShipTileBuilder// 
WithGuns// '
(//' (
Gun//( +
gun//, /
)/// 0
{00 	
shipTile11 
.11 
Guns11 
=11 
gun11 
;11  
return22 
this22 
;22 
}33 	
public55 
ShipTileBuilder55 

WithShield55 )
(55) *
bool55* .
shield55/ 5
)555 6
{66 	
shipTile77 
.77 
Shield77 
=77 
shield77 $
;77$ %
return88 
this88 
;88 
}99 	
public;; 
ShipTileBuilder;; 
WithGunCount;; +
(;;+ ,
int;;, /
gunCount;;0 8
);;8 9
{<< 	
shipTile== 
.== 
GunCount== 
=== 
gunCount==  (
;==( )
return>> 
this>> 
;>> 
}?? 	
publicAA 
ShipTileBuilderAA 
WithIsFlagshipAA -
(AA- .
boolAA. 2

isFlagshipAA3 =
)AA= >
{BB 	
shipTileCC 
.CC 

IsFlagshipCC 
=CC  !

isFlagshipCC" ,
;CC, -
returnDD 
thisDD 
;DD 
}EE 	
publicGG 
ShipTileGG 
BuildGG 
(GG 
)GG 
{HH 	
returnII 
thisII 
.II 
shipTileII  
;II  !
}JJ 	
}KK 
}LL å

>D:\dev\Battleships\Battleships\Services\EmailSendingService.cs
	namespace 	
Battleships
 
. 
Services 
{ 
public 

class 
EmailSendingService $
{ 
public		 
void		 
FinishSendEmail		 #
(		# $
Email		$ )
email		* /
)		/ 0
{

 	
var 
provider 
= "
GetAgencyEmailProvider 1
(1 2
email2 7
.7 8
Provider8 @
)@ A
;A B
provider 
. 
	SendEmail 
( 
email $
)$ %
;% &
} 	
private 
IEmailProvider "
GetAgencyEmailProvider 5
(5 6
string6 <
provider= E
)E F
{ 	
if 
( 
provider 
== 
$str "
)" #
return 
new 
SmtpEmailProvider ,
(, -
)- .
;. /
else 
return 
new !
SendGridEmailProvider 0
(0 1
)1 2
;2 3
} 	
} 
} ‰
9D:\dev\Battleships\Battleships\Services\EndgameService.cs
	namespace 	
Battleships
 
. 
Services 
{		 
public

 

class

 
EndgameService

 
:

  !
IEndgameService

" 1
{ 
private 
readonly  
IBattleshipsDatabase - 
_battleshipsDatabase. B
;B C
private 
readonly #
IEndgameStrategyService 0#
_endgameStrategyService1 H
;H I
private 
readonly .
"IBattleshipsSynchronizationService ;.
"_battleshipsSynchronizationService< ^
;^ _
private 
readonly 
IUserManager %
_userManager& 2
;2 3
public 
EndgameService 
(  
IBattleshipsDatabase  
battleshipsDatabase! 4
,4 5#
IEndgameStrategyService #"
endgameStrategyService$ :
,: ;.
"IBattleshipsSynchronizationService .-
!battleshipsSynchronizationService/ P
,P Q
IUserManager 
userManager $
)$ %
{ 	 
_battleshipsDatabase  
=! "
battleshipsDatabase# 6
;6 7#
_endgameStrategyService #
=$ %"
endgameStrategyService& <
;< =.
"_battleshipsSynchronizationService .
=/ 0-
!battleshipsSynchronizationService1 R
;R S
_userManager 
= 
userManager &
;& '
} 	
public 
async 
Task 
< 
bool 
> 
IsEndgameReached  0
(0 1
Guid1 5
gameSessionId6 C
)C D
{ 	
var 
strategy 
= 
await  #
_endgameStrategyService! 8
.8 9
GetEndgameStrategy9 K
(K L
gameSessionIdL Y
)Y Z
;Z [
return!! 
await!! 
strategy!! !
.!!! "
IsEndgameReached!!" 2
(!!2 3
gameSessionId!!3 @
)!!@ A
;!!A B
}"" 	
public$$ 
async$$ 
Task$$ 
EndGameSession$$ (
($$( )
Guid$$) -
gameSessionId$$. ;
,$$; <
string$$= C

attackerId$$D N
)$$N O
{%% 	
var&& 
session&& 
=&& 
await&&  
_battleshipsDatabase&&  4
.&&4 5"
GameSessionsRepository&&5 K
.&&K L
GetById&&L S
(&&S T
gameSessionId&&T a
)&&a b
;&&b c
session(( 
.(( 
WinnerId(( 
=(( 

attackerId(( )
;(() *
session)) 
.)) 
Status)) 
=)) 
GameSessionStatus)) .
.)). /
EndgameReached))/ =
;))= >
await++  
_battleshipsDatabase++ &
.++& '"
GameSessionsRepository++' =
.++= >
Update++> D
(++D E
session++E L
)++L M
;++M N
var-- 

winnerName-- 
=-- 
(-- 
await-- #
_userManager--$ 0
.--0 1
GetById--1 8
(--8 9

attackerId--9 C
)--C D
)--D E
.--E F
UserName--F N
;--N O
await.. .
"_battleshipsSynchronizationService.. 4
...4 5
SendEndgameReached..5 G
(..G H
gameSessionId..H U
,..U V

winnerName..W a
)..a b
;..b c
}// 	
}00 
}11 Œ
SD:\dev\Battleships\Battleships\Services\EndgameStrategies\ClassicEndgameStrategy.cs
	namespace 	
Battleships
 
. 
Services 
. 
EndgameStrategies 0
{		 
public

 

class

 "
ClassicEndgameStrategy

 '
:

( )
IEndgameStrategy

* :
{ 
private 
readonly  
IBattleshipsDatabase - 
_battleshipsDatabase. B
;B C
public "
ClassicEndgameStrategy %
(% & 
IBattleshipsDatabase  
battleshipsDatabase! 4
) 	
{ 	 
_battleshipsDatabase  
=! "
battleshipsDatabase# 6
;6 7
} 	
public 
async 
Task 
< 
bool 
> 
IsEndgameReached  0
(0 1
Guid1 5
gameSessionId6 C
)C D
{ 	
var 
tiles 
= 
await  
_battleshipsDatabase 2
.2 3
ShipTilesRepository3 F
.F G
GetSessionShipTilesG Z
(Z [
gameSessionId[ h
)h i
;i j
var 
	playerIds 
= 
tiles !
. 
Where 
( 
tile 
=> 
tile #
.# $

PlayerShip$ .
?. /
./ 0
PlayerId0 8
is9 ;
not< ?
null@ D
)D E
. 
Select 
( 
tile 
=> 
tile  $
.$ %

PlayerShip% /
./ 0
PlayerId0 8
)8 9
. 
Distinct 
( 
) 
. 
ToList 
( 
) 
; 
var 
( 
playerOneId 
, 
playerTwoId )
)) *
=+ ,
(- .
	playerIds. 7
[7 8
$num8 9
]9 :
,: ;
	playerIds< E
[E F
$numF G
]G H
)H I
;I J
var %
isPlayerOneShipsDestroyed )
=* +%
IsAllPlayerShipsDestroyed, E
(E F
tilesF K
,K L
playerOneIdM X
)X Y
;Y Z
var   %
isPlayerTwoShipsDestroyed   )
=  * +%
IsAllPlayerShipsDestroyed  , E
(  E F
tiles  F K
,  K L
playerTwoId  M X
)  X Y
;  Y Z
return"" %
isPlayerOneShipsDestroyed"" ,
||""- /%
isPlayerTwoShipsDestroyed""0 I
;""I J
}## 	
private%% 
bool%% %
IsAllPlayerShipsDestroyed%% .
(%%. /
List%%/ 3
<%%3 4
ShipTile%%4 <
>%%< =
tiles%%> C
,%%C D
Guid%%E I
playerId%%J R
)%%R S
{&& 	
var'' 
playerTiles'' 
='' 
tiles'' #
.(( 
Where(( 
((( 
tile(( 
=>(( 
tile(( #
.((# $

PlayerShip(($ .
.((. /
PlayerId((/ 7
==((8 :
playerId((; C
)((C D
;((D E
return** 
playerTiles** 
.** 
All** "
(**" #
tile**# '
=>**( *
tile**+ /
.**/ 0
IsDestroyed**0 ;
)**; <
;**< =
}++ 	
public-- 
string-- 
StrategyType-- "
=>--# %
Data--& *
.--* +
	Constants--+ 4
.--4 5
EndgameStrategies--5 F
.--F G
Classic--G N
;--N O
}.. 
}//  
VD:\dev\Battleships\Battleships\Services\EndgameStrategies\DeathMatchEndgameStrategy.cs
	namespace 	
Battleships
 
. 
Services 
. 
EndgameStrategies 0
{		 
public 

class %
DeathMatchEndgameStrategy *
:+ ,
IEndgameStrategy- =
{ 
private 
readonly  
IBattleshipsDatabase - 
_battleshipsDatabase. B
;B C
public %
DeathMatchEndgameStrategy (
(( ) 
IBattleshipsDatabase) =
battleshipsDatabase> Q
)Q R
{ 	 
_battleshipsDatabase  
=! "
battleshipsDatabase# 6
;6 7
} 	
public 
async 
Task 
< 
bool 
> 
IsEndgameReached  0
(0 1
Guid1 5
gameSessionId6 C
)C D
{ 	
var 
tiles 
= 
await  
_battleshipsDatabase 2
.2 3
ShipTilesRepository3 F
.F G
GetSessionShipTilesG Z
(Z [
gameSessionId[ h
)h i
;i j
var 
playerShipIds 
= 
tiles  %
. 
Where 
( 
tile 
=> 
tile #
.# $
PlayerShipId$ 0
is1 3
not4 7
null8 <
)< =
. 
Select 
( 
tile 
=> 
tile  $
.$ %
PlayerShipId% 1
.1 2
Value2 7
)7 8
. 
Distinct 
( 
) 
. 
ToList 
( 
) 
; 
var 
isAnyShipDestroyed "
=# $
playerShipIds% 2
.2 3
Any3 6
(6 7
playerShipId7 C
=>D F
IsShipDestroyedG V
(V W
tilesW \
,\ ]
playerShipId^ j
)j k
)k l
;l m
return 
isAnyShipDestroyed %
;% &
}   	
private"" 
bool"" 
IsShipDestroyed"" $
(""$ %
List""% )
<"") *
ShipTile""* 2
>""2 3
tiles""4 9
,""9 :
Guid""; ?
playerShipId""@ L
)""L M
{## 	
return$$ 
tiles$$ 
.%% 
Where%% 
(%% 
tile%% 
=>%% 
tile%% #
.%%# $
PlayerShipId%%$ 0
==%%1 3
playerShipId%%4 @
)%%@ A
.&& 
All&& 
(&& 
tile&& 
=>&& 
tile&& !
.&&! "
IsDestroyed&&" -
)&&- .
;&&. /
}'' 	
public)) 
string)) 
StrategyType)) "
=>))# %
Data))& *
.))* +
	Constants))+ 4
.))4 5
EndgameStrategies))5 F
.))F G

DeathMatch))G Q
;))Q R
}** 
}++ 
;++ Ö)
^D:\dev\Battleships\Battleships\Services\EndgameStrategies\DestroyedShipCountEndgameStrategy.cs
	namespace 	
Battleships
 
. 
Services 
. 
EndgameStrategies 0
{		 
public 

class -
!DestroyedShipCountEndgameStrategy 2
:3 4
IEndgameStrategy5 E
{ 
private 
readonly  
IBattleshipsDatabase - 
_battleshipsDatabase. B
;B C
public -
!DestroyedShipCountEndgameStrategy 0
(0 1 
IBattleshipsDatabase1 E
battleshipsDatabaseF Y
)Y Z
{ 	 
_battleshipsDatabase  
=! "
battleshipsDatabase# 6
;6 7
} 	
public 
async 
Task 
< 
bool 
> 
IsEndgameReached  0
(0 1
Guid1 5
gameSessionId6 C
)C D
{ 	
var &
requiredDestroyedShipCount *
=+ ,
await- 2 
_battleshipsDatabase3 G
. "
GameSessionsRepository '
.' ()
GetRequiredDestroyedShipCount( E
(E F
gameSessionIdF S
)S T
;T U
var 
tiles 
= 
await  
_battleshipsDatabase 2
.2 3
ShipTilesRepository3 F
.F G
GetSessionShipTilesG Z
(Z [
gameSessionId[ h
)h i
;i j
var 
	playerIds 
= 
tiles !
.! "
Select" (
(( )
tile) -
=>. 0
tile1 5
.5 6

PlayerShip6 @
.@ A
PlayerIdA I
)I J
.J K
DistinctK S
(S T
)T U
.U V
ToListV \
(\ ]
)] ^
;^ _
var %
destroyedPlayerShipCounts )
=* +
	playerIds, 5
.5 6
Select6 <
(< =
playerId= E
=>F H'
GetDestroyedPlayerShipCountI d
(d e
tilese j
,j k
playerIdl t
)t u
)u v
;v w
return %
destroyedPlayerShipCounts ,
., -
Any- 0
(0 1
count1 6
=>7 9
count: ?
>=@ B&
requiredDestroyedShipCountC ]
)] ^
;^ _
} 	
private   
int   '
GetDestroyedPlayerShipCount   /
(  / 0
List  0 4
<  4 5
ShipTile  5 =
>  = >
tiles  ? D
,  D E
Guid  F J
playerId  K S
)  S T
{!! 	
var"" 
playerTiles"" 
="" 
tiles"" #
.""# $
Where""$ )
("") *
tile""* .
=>""/ 1
tile""2 6
.""6 7

PlayerShip""7 A
.""A B
PlayerId""B J
==""K M
playerId""N V
)""V W
.""W X
ToList""X ^
(""^ _
)""_ `
;""` a
var## 
playerShipIds## 
=## 
tiles##  %
.$$ 
Where$$ 
($$ 
tile$$ 
=>$$ 
tile$$ #
.$$# $
PlayerShipId$$$ 0
is$$1 3
not$$4 7
null$$8 <
)$$< =
.%% 
Select%% 
(%% 
tile%% 
=>%% 
tile%%  $
.%%$ %
PlayerShipId%%% 1
.%%1 2
Value%%2 7
)%%7 8
.&& 
Distinct&& 
(&& 
)&& 
.'' 
ToList'' 
('' 
)'' 
;'' 
var)) 
destroyedShipCount)) "
=))# $
playerShipIds))% 2
.))2 3
Count))3 8
())8 9
id))9 ;
=>))< >
IsShipDestroyed))? N
())N O
playerTiles))O Z
,))Z [
id))\ ^
)))^ _
)))_ `
;))` a
return++ 
destroyedShipCount++ %
;++% &
},, 	
private.. 
bool.. 
IsShipDestroyed.. $
(..$ %
List..% )
<..) *
ShipTile..* 2
>..2 3
tiles..4 9
,..9 :
Guid..; ?
playerShipId..@ L
)..L M
{// 	
return00 
tiles00 
.11 
Where11 
(11 
tile11 
=>11 
tile11 #
.11# $
PlayerShipId11$ 0
==111 3
playerShipId114 @
)11@ A
.22 
All22 
(22 
tile22 
=>22 
tile22 !
.22! "
IsDestroyed22" -
)22- .
;22. /
}33 	
public55 
string55 
StrategyType55 "
=>55# %
Data55& *
.55* +
	Constants55+ 4
.554 5
EndgameStrategies555 F
.55F G
DestroyedShipCount55G Y
;55Y Z
}66 
}77 ã
MD:\dev\Battleships\Battleships\Services\EndgameStrategies\IEndgameStrategy.cs
	namespace 	
Battleships
 
. 
Services 
. 
EndgameStrategies 0
{ 
public 

	interface 
IEndgameStrategy %
{ 
Task 
< 
bool 
> 
IsEndgameReached #
(# $
Guid$ (
gameSessionId) 6
)6 7
;7 8
public		 
string		 
StrategyType		 "
{		# $
get		% (
;		( )
}		* +
}

 
} –
[D:\dev\Battleships\Battleships\Services\EndgameStrategies\RoundCountLimitEndgameStrategy.cs
	namespace 	
Battleships
 
. 
Services 
. 
EndgameStrategies 0
{ 
public		 

class		 *
RoundCountLimitEndgameStrategy		 /
:		0 1
IEndgameStrategy		2 B
{

 
private 
readonly  
IBattleshipsDatabase - 
_battleshipsDatabase. B
;B C
public *
RoundCountLimitEndgameStrategy -
(- . 
IBattleshipsDatabase  
battleshipsDatabase! 4
) 	
{ 	 
_battleshipsDatabase  
=! "
battleshipsDatabase# 6
;6 7
} 	
public 
async 
Task 
< 
bool 
> 
IsEndgameReached  0
(0 1
Guid1 5
gameSessionId6 C
)C D
{ 	
var 
round 
= 
await  
_battleshipsDatabase 2
.2 3"
GameSessionsRepository3 I
.I J
GetCurrentRoundJ Y
(Y Z
gameSessionIdZ g
)g h
;h i
var 
settings 
= 
await   
_battleshipsDatabase! 5
.5 6)
GameSessionSettingsRepository6 S
.S T
GetBySessionIdT b
(b c
gameSessionIdc p
)p q
;q r
return 
round 
>= 
settings $
.$ %%
RoundCountLimitForEndgame% >
;> ?
} 	
public 
string 
StrategyType "
=># %
Data& *
.* +
	Constants+ 4
.4 5
EndgameStrategies5 F
.F G
RoundCountLimitG V
;V W
} 
} à
AD:\dev\Battleships\Battleships\Services\EndgameStrategyService.cs
	namespace 	
Battleships
 
. 
Services 
{		 
public

 

class

 "
EndgameStrategyService

 '
:

( )#
IEndgameStrategyService

* A
{ 
private 
readonly  
IBattleshipsDatabase - 
_battleshipsDatabase. B
;B C
private 
readonly 
IEnumerable $
<$ %
IEndgameStrategy% 5
>5 6
_endgameStrategies7 I
;I J
public "
EndgameStrategyService %
(% & 
IBattleshipsDatabase  
battleshipsDatabase! 4
,4 5
IEnumerable 
< 
IEndgameStrategy (
>( )
endgameStrategies* ;
) 	
{ 	 
_battleshipsDatabase  
=! "
battleshipsDatabase# 6
;6 7
_endgameStrategies 
=  
endgameStrategies! 2
;2 3
} 	
public 
async 
Task 
< 
IEndgameStrategy *
>* +
GetEndgameStrategy, >
(> ?
Guid? C
gameSessionIdD Q
)Q R
{ 	
var 
strategyString 
=  
await! & 
_battleshipsDatabase' ;
.; <"
GameSessionsRepository< R
.R S
GetEndgameStrategyS e
(e f
gameSessionIdf s
)s t
;t u
var 
endgameStrategy 
=  !
_endgameStrategies" 4
.4 5
First5 :
(: ;
strategy; C
=>D F
strategyG O
.O P
StrategyTypeP \
==] _
strategyString` n
)n o
;o p
return 
endgameStrategy "
;" #
} 	
} 
}   ˛N
AD:\dev\Battleships\Battleships\Services\Friends\FriendsService.cs
	namespace 	
Battleships
 
. 
Services 
. 
Friends &
{ 
public 

class 
FriendsService 
:  !
IFriendsService" 1
{ 
private 
readonly  
IBattleshipsDatabase -
_db. 1
;1 2
private 
readonly 
IUserManager %
_userManager& 2
;2 3
private 
readonly 
ICurrentUserService ,
_currentUserService- @
;@ A
public 
FriendsService 
(  
IBattleshipsDatabase 3
database4 <
,< =
IUserManager> J
userManagerK V
,V W
ICurrentUserServiceX k
currentUserServicel ~
)~ 
{ 	
_db 
= 
database 
; 
_userManager 
= 
userManager &
;& '
_currentUserService   
=    !
currentUserService  " 4
;  4 5
}!! 	
public## 
async## 
Task## 
<## 
List## 
<## 
	FriendDto## (
>##( )
>##) *
ListFriends##+ 6
(##6 7
)##7 8
{$$ 	
Random%% 
random%% 
=%% 
new%% 
Random%%  &
(%%& '
)%%' (
;%%( )
var'' 
currentUserId'' 
='' 
_currentUserService''  3
.''3 4
GetCurrentUserId''4 D
(''D E
)''E F
;''F G
var)) 

friendsIds)) 
=)) 
GetFriendsIds)) *
())* +
currentUserId))+ 8
)))8 9
.))9 :
Result)): @
;))@ A
var++ 
friendsUsers++ 
=++ 
_userManager++ +
.+++ ,
Users++, 1
.++1 2
Where++2 7
(++7 8
user++8 <
=>++= ?
user++@ D
.++D E
Id++E G
!=++H J
currentUserId++K X
&&++Y [

friendsIds++\ f
.++f g
Contains++g o
(++o p
user++p t
.++t u
Id++u w
)++w x
)++x y
;++y z
var-- 
test-- 
=-- 
new-- 
List-- 
<--  
	FriendDto--  )
>--) *
(--* +
)--+ ,
;--, -
foreach// 
(// 
var// 
user// 
in// !
friendsUsers//" .
)//. /
{00 
var11 
Friend11 
=11 
new11  
	FriendDto11! *
(11* +
)11+ ,
{22 
Name33 
=33 
user33 
.33  
UserName33  (
,33( )
GamesPlayedCount44 $
=44% &
random44' -
.44- .
Next44. 2
(442 3
$num443 5
,445 6
$num446 8
)448 9
,449 :
GamesWonCount55 !
=55" #
random55$ *
.55* +
Next55+ /
(55/ 0
$num550 1
,551 2
$num553 5
)555 6
,556 7
UserId66 
=66 
user66 !
.66! "
Id66" $
}77 
;77 
test99 
.99 
Add99 
(99 
Friend99 
)99  
;99  !
}:: 
return<< 
test<< 
;<< 
}== 	
public?? 
async?? 
Task?? 
<?? 
List?? 
<?? 
string?? %
>??% &
>??& '
GetFriendsIds??( 5
(??5 6
string??6 <
currentUserId??= J
)??J K
{@@ 	
varAA 
friendsAA 
=AA 
awaitAA 
_dbAA  #
.AA# $
FriendsRepositoryAA$ 5
.AA5 6
GetWhereAA6 >
(AA> ?
userBB 
=>BB 
userBB 
.BB 
User1BB "
.BB" #
ToStringBB# +
(BB+ ,
)BB, -
==BB. 0
currentUserIdBB1 >
||BB? A
userBBB F
.BBF G
User2BBG L
.BBL M
ToStringBBM U
(BBU V
)BBV W
==BBX Z
currentUserIdBB[ h
)BBh i
;BBi j
varDD 

friendsIdsDD 
=DD 
newDD  
ListDD! %
<DD% &
stringDD& ,
>DD, -
(DD- .
)DD. /
;DD/ 0
foreachFF 
(FF 
varFF 
friendFF 
inFF  "
friendsFF# *
)FF* +
{GG 
ifHH 
(HH 
friendHH 
.HH 
User1HH  
.HH  !
ToStringHH! )
(HH) *
)HH* +
==HH, .
currentUserIdHH/ <
||HH= ?
friendHH@ F
.HHF G
User2HHG L
.HHL M
ToStringHHM U
(HHU V
)HHV W
==HHX Z
currentUserIdHH[ h
)HHh i
{II 
ifJJ 
(JJ 
friendJJ 
.JJ 
User1JJ $
.JJ$ %
ToStringJJ% -
(JJ- .
)JJ. /
==JJ0 2
currentUserIdJJ3 @
)JJ@ A
{KK 

friendsIdsLL "
.LL" #
AddLL# &
(LL& '
friendLL' -
.LL- .
User2LL. 3
.LL3 4
ToStringLL4 <
(LL< =
)LL= >
)LL> ?
;LL? @
}MM 
elseNN 
ifNN 
(NN 
friendNN #
.NN# $
User2NN$ )
.NN) *
ToStringNN* 2
(NN2 3
)NN3 4
==NN5 7
currentUserIdNN8 E
)NNE F
{OO 

friendsIdsPP "
.PP" #
AddPP# &
(PP& '
friendPP' -
.PP- .
User1PP. 3
.PP3 4
ToStringPP4 <
(PP< =
)PP= >
)PP> ?
;PP? @
}QQ 
}RR 
}SS 
returnUU 

friendsIdsUU 
;UU 
}VV 	
publicXX 
asyncXX 
TaskXX 
<XX 
boolXX 
>XX 
	AddFriendXX  )
(XX) *
stringXX* 0
userIdXX1 7
)XX7 8
{YY 	
varZZ 
currentUserIdZZ 
=ZZ 
_currentUserServiceZZ  3
.ZZ3 4
GetCurrentUserIdZZ4 D
(ZZD E
)ZZE F
;ZZF G
var[[ 

friendsIds[[ 
=[[ 
GetFriendsIds[[ *
([[* +
currentUserId[[+ 8
)[[8 9
.[[9 :
Result[[: @
;[[@ A
if]] 
(]] 
userId]] 
!=]] 
null]] 
&&]] !
userId]]" (
!=]]) +
currentUserId]], 9
&&]]: <
!]]= >

friendsIds]]> H
.]]H I
Contains]]I Q
(]]Q R
userId]]R X
.]]X Y
ToString]]Y a
(]]a b
)]]b c
)]]c d
)]]d e
{^^ 
var__ 
	newFriend__ 
=__ 
new__  #
Friend__$ *
(__* +
)__+ ,
{`` 
User1aa 
=aa 
Guidaa  
.aa  !
Parseaa! &
(aa& '
currentUserIdaa' 4
)aa4 5
,aa5 6
User2bb 
=bb 
Guidbb  
.bb  !
Parsebb! &
(bb& '
userIdbb' -
)bb- .
}cc 
;cc 
awaitdd 
_dbdd 
.dd 
FriendsRepositorydd +
.dd+ ,
Createdd, 2
(dd2 3
	newFrienddd3 <
)dd< =
;dd= >
returnff 
trueff 
;ff 
}gg 
elsehh 
{ii 
returnjj 
falsejj 
;jj 
}kk 
}ll 	
publicnn 
asyncnn 
Tasknn 
<nn 
boolnn 
>nn 
RemoveFriendnn  ,
(nn, -
	FriendDtonn- 6
	friendObjnn7 @
)nn@ A
{oo 	
varpp 
currentUserIdpp 
=pp 
_currentUserServicepp  3
.pp3 4
GetCurrentUserIdpp4 D
(ppD E
)ppE F
;ppF G
varqq 

friendsIdsqq 
=qq 
GetFriendsIdsqq *
(qq* +
currentUserIdqq+ 8
)qq8 9
.qq9 :
Resultqq: @
;qq@ A
varss 
friendsss 
=ss 
awaitss 
_dbss  #
.ss# $
FriendsRepositoryss$ 5
.ss5 6
GetWheress6 >
(ss> ?
usertt 
=>tt 
(tt 
usertt 
.tt 
User1tt 
.tt  
ToStringtt  (
(tt( )
)tt) *
==tt+ -
currentUserIdtt. ;
&&tt< >
usertt? C
.ttC D
User2ttD I
.ttI J
ToStringttJ R
(ttR S
)ttS T
==ttU W
	friendObjttX a
.tta b
UserIdttb h
)tth i
||uu 
(uu 
useruu 
.uu 
User1uu 
.uu 
ToStringuu #
(uu# $
)uu$ %
==uu& (
	friendObjuu) 2
.uu2 3
UserIduu3 9
&&uu: <
useruu= A
.uuA B
User2uuB G
.uuG H
ToStringuuH P
(uuP Q
)uuQ R
==uuS U
currentUserIduuV c
)uuc d
)uud e
;uue f
awaitww 
_dbww 
.ww 
FriendsRepositoryww '
.ww' (

DeleteManyww( 2
(ww2 3
friendsww3 :
)ww: ;
;ww; <
returnyy 
falseyy 
;yy 
}zz 	
}{{ 
}|| å
MD:\dev\Battleships\Battleships\Services\Friends\Interfaces\IFriendsService.cs
	namespace 	
Battleships
 
. 
Services 
. 
Friends &
.& '

Interfaces' 1
{ 
public 

	interface 
IFriendsService $
{		 
Task

 
<

 
List

 
<

 
	FriendDto

 
>

 
>

 
ListFriends

 )
(

) *
)

* +
;

+ ,
Task 
< 
bool 
> 
	AddFriend 
( 
string #
userId$ *
)* +
;+ ,
Task 
< 
bool 
> 
RemoveFriend 
(  
	FriendDto  )
friend* 0
)0 1
;1 2
} 
} ü$
HD:\dev\Battleships\Battleships\Services\GameSession\GameLaunchService.cs
	namespace 	
Battleships
 
. 
Services 
. 
GameSession *
{ 
public		 

class		 
GameLaunchService		 "
:		# $
IGameLaunchService		% 7
{

 
private 
readonly  
IBattleshipsDatabase - 
_battleshipsDatabase. B
;B C
private 
readonly (
IPlayerShipGenerationService 5(
_playerShipGenerationService6 R
;R S
public 
GameLaunchService  
(  ! 
IBattleshipsDatabase  
battleshipsDatabase! 4
,4 5(
IPlayerShipGenerationService ('
playerShipGenerationService) D
)D E
{ 	 
_battleshipsDatabase  
=! "
battleshipsDatabase# 6
;6 7(
_playerShipGenerationService (
=) *'
playerShipGenerationService+ F
;F G
} 	
public 
async 
Task 

LaunchGame $
($ %
Guid% )
gameSessionId* 7
,7 8
bool9 =
rematch> E
)E F
{ 	
if 
( 
rematch 
) 
{ 
await 
LaunchRematch #
(# $
gameSessionId$ 1
)1 2
;2 3
} 
else 
{ 
await 

LaunchGame  
(  !
gameSessionId! .
). /
;/ 0
} 
}   	
private"" 
async"" 
Task"" 
LaunchRematch"" (
(""( )
Guid"") -
gameSessionId"". ;
)""; <
{## 	
var$$ 
gameSession$$ 
=$$ 
await$$ # 
_battleshipsDatabase$$$ 8
.$$8 9"
GameSessionsRepository$$9 O
.$$O P%
GetWithPlayersAndSettings$$P i
($$i j
gameSessionId$$j w
)$$w x
;$$x y
var%% 
deepCopy%% 
=%% 
gameSession%% &
.%%& '
	DeepClone%%' 0
(%%0 1
gameSession%%1 <
)%%< =
as%%> @
Models%%A G
.%%G H
GameSession%%H S
;%%S T
var'' 
playerShips'' 
='' 
await'' #(
_playerShipGenerationService''$ @
.''@ A
GeneratePlayerShips''A T
(''T U
gameSession''U `
.''` a
Settings''a i
)''i j
;''j k
deepCopy)) 
.)) 
Status)) 
=)) 
GameSessionStatus)) /
.))/ 0

InProgress))0 :
;)): ;
await++  
_battleshipsDatabase++ &
.++& '!
PlayerShipsRepository++' <
.++< =

CreateMany++= G
(++G H
playerShips++H S
)++S T
;++T U
await,,  
_battleshipsDatabase,, &
.,,& '"
GameSessionsRepository,,' =
.,,= >
Update,,> D
(,,D E
deepCopy,,E M
),,M N
;,,N O
}-- 	
public// 
async// 
Task// 

LaunchGame// $
(//$ %
Guid//% )
gameSessionId//* 7
)//7 8
{00 	
var11 
gameSession11 
=11 
await11 # 
_battleshipsDatabase11$ 8
.118 9"
GameSessionsRepository119 O
.11O P
GetById11P W
(11W X
gameSessionId11X e
)11e f
;11f g
var22 
playerShips22 
=22 
await22 #(
_playerShipGenerationService22$ @
.22@ A
GeneratePlayerShips22A T
(22T U
gameSession22U `
.22` a
Settings22a i
)22i j
;22j k
gameSession44 
.44 
Status44 
=44  
GameSessionStatus44! 2
.442 3

InProgress443 =
;44= >
await66  
_battleshipsDatabase66 &
.66& '!
PlayerShipsRepository66' <
.66< =

CreateMany66= G
(66G H
playerShips66H S
)66S T
;66T U
await77  
_battleshipsDatabase77 &
.77& '"
GameSessionsRepository77' =
.77= >
Update77> D
(77D E
gameSession77E P
)77P Q
;77Q R
}88 	
}99 
}:: Êj
ID:\dev\Battleships\Battleships\Services\GameSession\GameSessionService.cs
	namespace 	
Battleships
 
. 
Services 
. 
GameSession *
{ 
public 

class 
GameSessionService #
:$ %
IGameSessionService& 9
{ 
private 
readonly  
IBattleshipsDatabase - 
_battleshipsDatabase. B
;B C
private 
readonly 
ICurrentUserService ,
_currentUserService- @
;@ A
private 
readonly '
IInGameSessionHelperService 4'
_inGameSessionHelperService5 P
;P Q
public 
GameSessionService !
(! " 
IBattleshipsDatabase  
battleshipsDatabase! 4
,4 5
ICurrentUserService 
userService  +
,+ ,'
IInGameSessionHelperService '&
inGameSessionHelperService( B
) 	
{ 	 
_battleshipsDatabase  
=! "
battleshipsDatabase# 6
;6 7
_currentUserService 
=  !
userService" -
;- .'
_inGameSessionHelperService   '
=  ( )&
inGameSessionHelperService  * D
;  D E
}!! 	
public## 
async## 
Task## 
<## 
Guid## 
>## 
CreateSession##  -
(##- .!
GameSessionRequestDto##. C
dto##D G
)##G H
{$$ 	
var%% 
facade%% 
=%% 
new%% 
GameSessionFacade%% .
(%%. / 
_battleshipsDatabase%%/ C
,%%C D
_currentUserService%%E X
,%%X Y
dto%%Z ]
)%%] ^
;%%^ _
var&& 
guid&& 
=&& 
await&& 
facade&& #
.&&# $
CreateGameSession&&$ 5
(&&5 6
)&&6 7
;&&7 8
return'' 
guid'' 
;'' 
})) 	
public++ 
async++ 
Task++ 
<++ 
List++ 
<++ 
GameSessionDto++ -
>++- .
>++. /
ListAllSessions++0 ?
(++? @
)++@ A
{,, 	
var-- 
models-- 
=-- 
await--  
_battleshipsDatabase-- 3
.--3 4"
GameSessionsRepository--4 J
.--J K
GetAll--K Q
(--Q R
)--R S
;--S T
if.. 
(.. 
models.. 
is.. 
null.. 
).. 
return// 
new// 
List// 
<//  
GameSessionDto//  .
>//. /
(/// 0
)//0 1
;//1 2
return00 
models00 
.00 
Select00  
(00  !
x00! "
=>00# %
x00& '
.00' (
toDto00( -
(00- .
)00. /
)00/ 0
.000 1
ToList001 7
(007 8
)008 9
;009 :
}11 	
public33 
async33 
Task33 
<33 
GameSessionDto33 (
>33( )

GetSession33* 4
(334 5
Guid335 9
id33: <
)33< =
{44 	
return55 
await55  
_battleshipsDatabase55 -
.55- ."
GameSessionsRepository55. D
.55D E
GetDtoWithPlayers55E V
(55V W
id55W Y
)55Y Z
;55Z [
}66 	
public88 
async88 
Task88 
<88 
InGameSessionDto88 *
>88* +
GetInGameSession88, <
(88< =
Guid88= A
gameSessionId88B O
)88O P
{99 	
var:: 
currentUserId:: 
=:: 
_currentUserService::  3
.::3 4
GetCurrentUserId::4 D
(::D E
)::E F
;::F G
var<< 
(<< 
ownPlayerId<< 
,<< 
opponentPlayerId<< .
)<<. /
=<<0 1
await<<2 7 
_battleshipsDatabase<<8 L
.<<L M"
GameSessionsRepository<<M c
.<<c d
GetPlayerIds<<d p
(<<p q
gameSessionId<<q ~
,<<~ 
currentUserId
<<Ä ç
)
<<ç é
;
<<é è
var== 
ownTiles== 
=== 
await==   
_battleshipsDatabase==! 5
.==5 6
ShipTilesRepository==6 I
.==I J
GetPlayerTiles==J X
(==X Y
ownPlayerId==Y d
)==d e
;==e f
var>> 
opponentTiles>> 
=>> 
await>>  % 
_battleshipsDatabase>>& :
.>>: ;
ShipTilesRepository>>; N
.>>N O
GetPlayerTiles>>O ]
(>>] ^
opponentPlayerId>>^ n
)>>n o
;>>o p
var@@ 
dto@@ 
=@@ 
await@@  
_battleshipsDatabase@@ 0
.@@0 1"
GameSessionsRepository@@1 G
.@@G H
GetInGameSession@@H X
(@@X Y
gameSessionId@@Y f
,@@f g
currentUserId@@h u
)@@u v
;@@v w
dtoAA 
.AA 
OwnTilesAA 
=AA 
GetTileDtosAA &
(AA& '
ownTilesAA' /
,AA/ 0
dtoAA1 4
.AA4 5
ColumnCountAA5 @
,AA@ A
dtoAAB E
.AAE F
RowCountAAF N
)AAN O
;AAO P
dtoBB 
.BB 
OpponentTilesBB 
=BB 
GetTileDtosBB  +
(BB+ ,
opponentTilesBB, 9
,BB9 :
dtoBB; >
.BB> ?
ColumnCountBB? J
,BBJ K
dtoBBL O
.BBO P
RowCountBBP X
)BBX Y
;BBY Z
returnDD 
dtoDD 
;DD 
}EE 	
publicGG 
ListGG 
<GG 
GameTileGG 
>GG 
GetTileDtosGG )
(GG) *
ListGG* .
<GG. /
ShipTileGG/ 7
>GG7 8
tilesGG9 >
,GG> ?
intGG@ C
columnCountGGD O
,GGO P
intGGQ T
rowCountGGU ]
)GG] ^
{HH 	
varII 
	shipTilesII 
=II 
tilesII !
.II! "
WhereII" '
(II' (
tII( )
=>II* ,
tII- .
.II. /
PlayerShipIdII/ ;
isII< >
notII? B
nullIIC G
)IIG H
.IIH I
ToListIII O
(IIO P
)IIP Q
;IIQ R
varJJ 

emptyTilesJJ 
=JJ 
tilesJJ "
.JJ" #
WhereJJ# (
(JJ( )
tJJ) *
=>JJ+ -
tJJ. /
.JJ/ 0
PlayerShipIdJJ0 <
isJJ= ?
nullJJ@ D
)JJD E
.JJE F
ToListJJF L
(JJL M
)JJM N
;JJN O
varLL 
dtosLL 
=LL 

EnumerableLL !
.LL! "
RangeLL" '
(LL' (
$numLL( )
,LL) *
columnCountLL+ 6
)LL6 7
.LL7 8

SelectManyLL8 B
(LLB C
columnCoordinateLLC S
=>LLT V
{MM 
returnNN 

EnumerableNN !
.NN! "
RangeNN" '
(NN' (
$numNN( )
,NN) *
rowCountNN+ 3
)NN3 4
.NN4 5
SelectNN5 ;
(NN; <
rowCoordinateNN< I
=>NNJ L
{OO 
varPP 
shipTilePP  
=PP! "
	shipTilesPP# ,
.PP, -
FirstOrDefaultPP- ;
(PP; <
stPP< >
=>PP? A
stQQ 
.QQ 
XCoordinateQQ &
==QQ' )
columnCoordinateQQ* :
&&QQ; =
stQQ> @
.QQ@ A
YCoordinateQQA L
==QQM O
rowCoordinateQQP ]
)RR 
;RR 
varTT 
	emptyTileTT !
=TT" #

emptyTilesTT$ .
.TT. /
FirstOrDefaultTT/ =
(TT= >
stTT> @
=>TTA C
stUU 
.UU 
XCoordinateUU &
==UU' )
columnCoordinateUU* :
&&UU; =
stUU> @
.UU@ A
YCoordinateUUA L
==UUM O
rowCoordinateUUP ]
)VV 
;VV 
var\\ 
tile\\ 
=\\ 
new\\ "
GameTile\\# +
{]] 
ColumnCoordinate^^ (
=^^) *
columnCoordinate^^+ ;
,^^; <
RowCoordinate__ %
=__& '
rowCoordinate__( 5
,__5 6
IsShip`` 
=``  
shipTile``! )
?``) *
.``* +
PlayerShipId``+ 7
is``8 :
not``; >
null``? C
,``C D
IsDestroyedaa #
=aa$ %
(aa& '
shipTileaa' /
?aa/ 0
.aa0 1
IsDestroyedaa1 <
??aa= ?
falseaa@ E
)aaE F
||aaG I
(aaJ K
	emptyTileaaK T
?aaT U
.aaU V
IsDestroyedaaV a
??aab d
falseaae j
)aaj k
,aak l
ShipIdbb 
=bb  
shipTilebb! )
!=bb* ,
nullbb- 1
?bb2 3
shipTilebb4 <
.bb< =
PlayerShipIdbb= I
:bbJ K
nullbbL P
,bbP Q
}ee 
;ee 
returngg 
tilegg 
;gg  
}hh 
)hh 
;hh 
}ii 
)ii 
;ii 
returnkk 
dtoskk 
.kk 
ToListkk 
(kk 
)kk  
;kk  !
}ll 	
publicnn 
asyncnn 
Tasknn 
<nn 
InGameSessionDtonn *
>nn* +
MoveShipInSessionnn, =
(nn> ?
Guidnn? C
gameSessionIdnnD Q
,nnQ R
GuidnnS W
shipIdnnX ^
,nn^ _
stringnn` f
	directionnng p
)nnp q
{oo 	

PlayerShipqq 

playerShipqq !
=qq" #
awaitqq$ ) 
_battleshipsDatabaseqq* >
.qq> ?!
PlayerShipsRepositoryqq? T
.qqT U
GetByIdqqU \
(qq\ ]
shipIdqq] c
)qqc d
;qqd e
varss 
playerTilesss 
=ss 
awaitss # 
_battleshipsDatabasess$ 8
.ss8 9
ShipTilesRepositoryss9 L
.ssL M
GetPlayerTilesssM [
(ss[ \

playerShipss\ f
.ssf g
PlayerIdssg o
)sso p
;ssp q
switchuu 
(uu 
	directionuu 
)uu 
{vv 
caseww 
$strww 
:ww 
IShipActionCommandxx &
shipMoveUpCommandxx' 8
=xx9 :
newxx; >
ShipMoveUpCommandxx? P
(xxP Q

playerShipxxQ [
)xx[ \
;xx\ ]
shipMoveUpCommandyy %
.yy% &
Executeyy& -
(yy- .
)yy. /
;yy/ 0
breakzz 
;zz 
case{{ 
$str{{ 
:{{ 
IShipActionCommand|| &
ShipMoveDownCommand||' :
=||; <
new||= @
ShipMoveDownCommand||A T
(||T U

playerShip||U _
)||_ `
;||` a
ShipMoveDownCommand}} '
.}}' (
Execute}}( /
(}}/ 0
)}}0 1
;}}1 2
break~~ 
;~~ 
case 
$str 
:  
IShipActionCommand
ÄÄ &!
ShipMoveLeftCommand
ÄÄ' :
=
ÄÄ; <
new
ÄÄ= @!
ShipMoveLeftCommand
ÄÄA T
(
ÄÄT U

playerShip
ÄÄU _
)
ÄÄ_ `
;
ÄÄ` a!
ShipMoveLeftCommand
ÅÅ '
.
ÅÅ' (
Execute
ÅÅ( /
(
ÅÅ/ 0
)
ÅÅ0 1
;
ÅÅ1 2
break
ÇÇ 
;
ÇÇ 
case
ÉÉ 
$str
ÉÉ 
:
ÉÉ  
IShipActionCommand
ÑÑ &"
ShipMoveRightCommand
ÑÑ' ;
=
ÑÑ< =
new
ÑÑ> A"
ShipMoveRightCommand
ÑÑB V
(
ÑÑV W

playerShip
ÑÑW a
)
ÑÑa b
;
ÑÑb c"
ShipMoveRightCommand
ÖÖ (
.
ÖÖ( )
Execute
ÖÖ) 0
(
ÖÖ0 1
)
ÖÖ1 2
;
ÖÖ2 3
break
ÜÜ 
;
ÜÜ 
}
áá 
await
ââ "
_battleshipsDatabase
ââ &
.
ââ& '!
ShipTilesRepository
ââ' :
.
ââ: ;

UpdateMany
ââ; E
(
ââE F

playerShip
ââF P
.
ââP Q
Tiles
ââQ V
)
ââV W
;
ââW X
var
ãã 
gameSessionDto
ãã 
=
ãã  
await
ãã! &)
_inGameSessionHelperService
ãã' B
.
ããB C
GetInGameSession
ããC S
(
ããS T
gameSessionId
ããT a
)
ããa b
;
ããb c
var
åå 
updatedPosTiles
åå 
=
åå  !)
_inGameSessionHelperService
åå" =
.
åå= >
GetTileDtos
åå> I
(
ååI J
playerTiles
ååJ U
,
ååU V
gameSessionDto
ååW e
.
ååe f
ColumnCount
ååf q
,
ååq r
gameSessionDtoåås Å
.ååÅ Ç
RowCountååÇ ä
)ååä ã
;ååã å
gameSessionDto
çç 
.
çç 
OwnTiles
çç #
=
çç$ %
updatedPosTiles
çç& 5
;
çç5 6
return
èè 
gameSessionDto
èè !
;
èè! "
}
êê 	
}
ëë 
}íí Ä7
QD:\dev\Battleships\Battleships\Services\GameSession\InGameSessionHelperService.cs
	namespace 	
Battleships
 
. 
Services 
. 
GameSession *
;* +
public 
class &
InGameSessionHelperService '
:( )'
IInGameSessionHelperService* E
{ 
private 
readonly  
IBattleshipsDatabase ) 
_battleshipsDatabase* >
;> ?
private 
readonly 
ICurrentUserService (
_currentUserService) <
;< =
public 
&
InGameSessionHelperService %
(% & 
IBattleshipsDatabase 
battleshipsDatabase 0
,0 1
ICurrentUserService 
userService '
) 
{  
_battleshipsDatabase 
= 
battleshipsDatabase 2
;2 3
_currentUserService 
= 
userService )
;) *
} 
public 

async 
Task 
< 
InGameSessionDto &
>& '
GetInGameSession( 8
(8 9
Guid9 =
gameSessionId> K
)K L
{ 
var 
currentUserId 
= 
_currentUserService /
./ 0
GetCurrentUserId0 @
(@ A
)A B
;B C
var 
( 
ownPlayerId 
, 
opponentPlayerId *
)* +
=, -
await. 3 
_battleshipsDatabase4 H
.H I"
GameSessionsRepositoryI _
._ `
GetPlayerIds` l
(l m
gameSessionIdm z
,z {
currentUserId	| â
)
â ä
;
ä ã
var   
ownTiles   
=   
await    
_battleshipsDatabase   1
.  1 2
ShipTilesRepository  2 E
.  E F
GetPlayerTiles  F T
(  T U
ownPlayerId  U `
)  ` a
;  a b
var!! 
opponentTiles!! 
=!! 
await!! ! 
_battleshipsDatabase!!" 6
.!!6 7
ShipTilesRepository!!7 J
.!!J K
GetPlayerTiles!!K Y
(!!Y Z
opponentPlayerId!!Z j
)!!j k
;!!k l
var## 
dto## 
=## 
await##  
_battleshipsDatabase## ,
.##, -"
GameSessionsRepository##- C
.##C D
GetInGameSession##D T
(##T U
gameSessionId##U b
,##b c
currentUserId##d q
)##q r
;##r s
dto$$ 
.$$ 
OwnTiles$$ 
=$$ 
GetTileDtos$$ "
($$" #
ownTiles$$# +
,$$+ ,
dto$$- 0
.$$0 1
ColumnCount$$1 <
,$$< =
dto$$> A
.$$A B
RowCount$$B J
)$$J K
;$$K L
dto%% 
.%% 
OpponentTiles%% 
=%% 
GetTileDtos%% '
(%%' (
opponentTiles%%( 5
,%%5 6
dto%%7 :
.%%: ;
ColumnCount%%; F
,%%F G
dto%%H K
.%%K L
RowCount%%L T
)%%T U
;%%U V
return'' 
dto'' 
;'' 
}(( 
public** 

List** 
<** 
GameTile** 
>** 
GetTileDtos** %
(**% &
List**& *
<*** +
ShipTile**+ 3
>**3 4
	shipTiles**5 >
,**> ?
int**@ C
columnCount**D O
,**O P
int**Q T
rowCount**U ]
)**] ^
{++ 
var,, 
tiles,, 
=,, 

Enumerable,, 
.,, 
Range,, $
(,,$ %
$num,,% &
,,,& '
columnCount,,( 3
),,3 4
.,,4 5

SelectMany,,5 ?
(,,? @
columnCoordinate,,@ P
=>,,Q S
{-- 	
return.. 

Enumerable.. 
... 
Range.. #
(..# $
$num..$ %
,..% &
rowCount..' /
)../ 0
...0 1
Select..1 7
(..7 8
rowCoordinate..8 E
=>..F H
{// 
var00 
shipTile00 
=00 
	shipTiles00 (
.00( )
FirstOrDefault00) 7
(007 8
st008 :
=>00; =
st11 
.11 
XCoordinate11 "
==11# %
columnCoordinate11& 6
&&117 9
st11: <
.11< =
YCoordinate11= H
==11I K
rowCoordinate11L Y
)22 
;22 
IShipAppearance44 
shipAppearance44  .
=44/ 0
new441 4
ShipAppearance445 C
(44C D
)44D E
;44E F
IShipAppearance55 
skinDecorator55  -
=55. /
new550 3
SkinDecorator554 A
(55A B
shipAppearance55B P
)55P Q
.55Q R
Draw55R V
(55V W
)55W X
;55X Y
IShipAppearance66 
labelDecorator66  .
=66/ 0
new661 4
LabelDecorator665 C
(66C D
skinDecorator66D Q
)66Q R
.66R S
Draw66S W
(66W X
)66X Y
;66Y Z
var88 
tile88 
=88 
new88 
GameTile88 '
{99 
ColumnCoordinate:: $
=::% &
columnCoordinate::' 7
,::7 8
RowCoordinate;; !
=;;" #
rowCoordinate;;$ 1
,;;1 2
IsShip<< 
=<< 
shipTile<< %
is<<& (
not<<) ,
null<<- 1
,<<1 2
IsDestroyed== 
===  !
shipTile==" *
is==+ -
not==. 1
null==2 6
?>> 
shipTile>> "
.>>" #
IsDestroyed>># .
:?? 
false?? 
,??  
ShipId@@ 
=@@ 
shipTile@@ %
!=@@& (
null@@) -
?@@. /
shipTile@@0 8
.@@8 9
PlayerShipId@@9 E
:@@F G
null@@H L
,@@L M
SkinNameAA 
=AA 
shipTileAA '
!=AA( *
nullAA+ /
?AA0 1
labelDecoratorAA2 @
.AA@ A
SkinNameAAA I
:AAJ K
$strAAL N
,AAN O
LabelBB 
=BB 
shipTileBB $
!=BB% '
nullBB( ,
?BB- .
labelDecoratorBB/ =
.BB= >
LabelBB> C
:BBD E
$strBBF H
}CC 
;CC 
returnEE 
tileEE 
;EE 
}FF 
)FF 
;FF 
}GG 	
)GG	 

;GG
 
returnII 
tilesII 
.II 
ToListII 
(II 
)II 
;II 
}KK 
}LL π
TD:\dev\Battleships\Battleships\Services\GameSession\Interfaces\IGameLaunchService.cs
	namespace 	
Battleships
 
. 
Services 
. 
GameSession *
.* +

Interfaces+ 5
{ 
public 

	interface 
IGameLaunchService '
{ 
Task 

LaunchGame 
( 
Guid 
gameSessionId *
)* +
;+ ,
Task		 

LaunchGame		 
(		 
Guid		 
gameSessionId		 *
,		* +
bool		, 0
rematch		1 8
)		8 9
;		9 :
}

 
} ª
UD:\dev\Battleships\Battleships\Services\GameSession\Interfaces\IGameSessionService.cs
	namespace 	
Battleships
 
. 
Services 
. 
GameSession *
.* +

Interfaces+ 5
{ 
public		 

	interface		 
IGameSessionService		 (
{

 
Task 
< 
List 
< 
GameSessionDto  
>  !
>! "
ListAllSessions# 2
(2 3
)3 4
;4 5
Task 
< 
Guid 
> 
CreateSession  
(  !!
GameSessionRequestDto! 6
gameSessionDto7 E
)E F
;F G
Task 
< 
GameSessionDto 
> 

GetSession '
(' (
Guid( ,
id- /
)/ 0
;0 1
Task 
< 
InGameSessionDto 
> 
GetInGameSession /
(/ 0
Guid0 4
gameSessionId5 B
)B C
;C D
Task 
< 
InGameSessionDto 
> 
MoveShipInSession 0
(0 1
Guid1 5
gameSessionId6 C
,C D
GuidE I
shipIdJ P
,P Q
stringR X
	directionY b
)b c
;c d
} 
} õ
]D:\dev\Battleships\Battleships\Services\GameSession\Interfaces\IInGameSessionHelperService.cs
	namespace 	
Battleships
 
. 
Services 
. 
GameSession *
;* +
public		 
	interface		 '
IInGameSessionHelperService		 ,
{

 
public 

Task 
< 
InGameSessionDto  
>  !
GetInGameSession" 2
(2 3
Guid3 7
gameSessionId8 E
)E F
;F G
public 

List 
< 
GameTile 
> 
GetTileDtos %
(% &
List& *
<* +
ShipTile+ 3
>3 4
	shipTiles5 >
,> ?
int@ C
columnCountD O
,O P
intQ T
rowCountU ]
)] ^
;^ _
} å
^D:\dev\Battleships\Battleships\Services\GameSession\Interfaces\IPlayerShipGenerationService.cs
	namespace 	
Battleships
 
. 
Services 
. 
GameSession *
.* +

Interfaces+ 5
{ 
public 

	interface (
IPlayerShipGenerationService 1
{		 
Task

 
<

 
List

 
<

 

PlayerShip

 
>

 
>

 
GeneratePlayerShips

 2
(

2 3
GameSessionSettings

3 F
settings

G O
)

O P
;

P Q
} 
} óF
RD:\dev\Battleships\Battleships\Services\GameSession\PlayerShipGenerationService.cs
	namespace 	
Battleships
 
. 
Services 
. 
GameSession *
{ 
public 

class '
PlayerShipGenerationService ,
:- .(
IPlayerShipGenerationService/ K
{ 
private 
readonly  
IBattleshipsDatabase - 
_battleshipsDatabase. B
;B C
private 
readonly 
ICurrentUserService ,
_currentUserService- @
;@ A
private 
readonly "
NumberGeneratorFactory /#
_numberGeneratorFactory0 G
;G H
public '
PlayerShipGenerationService *
(* + 
IBattleshipsDatabase  
battleshipsDatabase! 4
,4 5
ICurrentUserService 
currentUserService  2
,2 3"
NumberGeneratorFactory ""
numberGeneratorFactory# 9
)9 :
{ 	 
_battleshipsDatabase  
=! "
battleshipsDatabase# 6
;6 7
_currentUserService 
=  !
currentUserService" 4
;4 5#
_numberGeneratorFactory #
=$ %"
numberGeneratorFactory& <
;< =
} 	
public 
async 
Task 
< 
List 
< 

PlayerShip )
>) *
>* +
GeneratePlayerShips, ?
(? @
GameSessionSettings@ S
settingsT \
)\ ]
{   	
var!! 
currentUserId!! 
=!! 
_currentUserService!!  3
.!!3 4
GetCurrentUserId!!4 D
(!!D E
)!!E F
;!!F G
var"" 
("" 
ownPlayerId"" 
,"" 
opponentPlayerId"" .
)"". /
=""0 1
await##  
_battleshipsDatabase## *
.##* +"
GameSessionsRepository##+ A
.##A B
GetPlayerIds##B N
(##N O
settings##O W
.##W X
GameSessionId##X e
,##e f
currentUserId##g t
)##t u
;##u v
var%% 
playerShips%% 
=%% 

Enumerable%% (
.%%( )
Empty%%) .
<%%. /

PlayerShip%%/ 9
>%%9 :
(%%: ;
)%%; <
.&& 
Concat&& 
(&& 
await&& 
GenerateShips&& +
(&&+ ,
ownPlayerId&&, 7
,&&7 8
settings&&9 A
)&&A B
)&&B C
.'' 
Concat'' 
('' 
await'' 
GenerateShips'' +
(''+ ,
opponentPlayerId'', <
,''< =
settings''> F
)''F G
)''G H
.(( 
ToList(( 
((( 
)(( 
;(( 
return** 
playerShips** 
;** 
}++ 	
private-- 
async-- 
Task-- 
<-- 
List-- 
<--  

PlayerShip--  *
>--* +
>--+ ,
GenerateShips--- :
(--: ;
Guid--; ?
playerId--@ H
,--H I
GameSessionSettings--J ]
settings--^ f
)--f g
{.. 	
var// 
columnCount// 
=// 
settings// &
.//& '
ColumnCount//' 2
;//2 3
var00 
rowCount00 
=00 
settings00 #
.00# $
RowCount00$ ,
;00, -
var22 
rowStartGenerator22 !
=22" ##
_numberGeneratorFactory22$ ;
.22; <
GetNumberGenerator22< N
(22N O
rowCount22O W
)22W X
;22X Y
var33  
columnStartGenerator33 $
=33% &#
_numberGeneratorFactory33' >
.33> ?
GetNumberGenerator33? Q
(33Q R
columnCount33R ]
)33] ^
;33^ _
var55 
shipTypeTuples55 
=55  
new55! $
List55% )
<55) *
(55* +
string55+ 1
,551 2
int553 6
)556 7
>557 8
(558 9
)559 :
{66 	
(77 
	ShipTypes77 
.77 
Carrier77 
,77 
$num77  !
)77! "
,77" #
(88 
	ShipTypes88 
.88 

Battleship88 !
,88! "
$num88# $
)88$ %
,88% &
(99 
	ShipTypes99 
.99 
Cruiser99 
,99 
$num99  !
)99! "
,99" #
(:: 
	ShipTypes:: 
.:: 
	Destroyer::  
,::  !
$num::" #
)::# $
,::$ %
(;; 
	ShipTypes;; 
.;; 
	Destroyer;;  
,;;  !
$num;;" #
);;# $
,;;$ %
(<< 
	ShipTypes<< 
.<< 
	Submarine<<  
,<<  !
$num<<" #
)<<# $
,<<$ %
(== 
	ShipTypes== 
.== 
	Submarine==  
,==  !
$num==" #
)==# $
}>> 	
;>>	 

var@@ 
playerShips@@ 
=@@ 
new@@ !
List@@" &
<@@& '

PlayerShip@@' 1
>@@1 2
(@@2 3
)@@3 4
;@@4 5
whileBB 
(BB 
playerShipsBB 
.BB 
CountBB $
<BB% &
$numBB' (
)BB( )
{CC 
varDD 
columnDD 
=DD  
columnStartGeneratorDD 1
.DD1 2
GenerateNumberDD2 @
(DD@ A
)DDA B
;DDB C
ifFF 
(FF 
playerShipsFF 
.FF  
AnyFF  #
(FF# $
shipFF$ (
=>FF) +
shipFF, 0
.FF0 1
TilesFF1 6
.FF6 7
AnyFF7 :
(FF: ;
tileFF; ?
=>FF@ B
tileFFC G
.FFG H
XCoordinateFFH S
==FFT V
columnFFW ]
)FF] ^
)FF^ _
)FF_ `
{GG 
continueHH 
;HH 
}II 
varKK 
rowKK 
=KK 
rowStartGeneratorKK +
.KK+ ,
GenerateNumberKK, :
(KK: ;
)KK; <
;KK< =
varMM 
	directionMM 
=MM 
rowMM  #
<MM$ %
(MM& '
rowCountMM' /
/MM0 1
$numMM2 3
)MM3 4
?MM5 6
$strMM7 =
:MM> ?
$strMM@ D
;MMD E
varNN 
shipTypeTupleNN !
=NN" #
shipTypeTuplesNN$ 2
[NN2 3
playerShipsNN3 >
.NN> ?
CountNN? D
]NND E
;NNE F
varPP 
	shipTilesPP 
=PP 

EnumerablePP  *
.PP* +
RangePP+ 0
(PP0 1
rowPP1 4
,PP4 5
shipTypeTuplePP6 C
.PPC D
Item2PPD I
)PPI J
.PPJ K
SelectPPK Q
(PPQ R
rawRowNumberPPR ^
=>PP_ a
{QQ 
varRR 
	rowNumberRR !
=RR" #
	directionRR$ -
==RR. 0
$strRR1 7
?RR8 9
rawRowNumberRR: F
:RRG H
rowRRI L
-RRM N
(RRO P
rawRowNumberRRP \
-RR] ^
rowRR_ b
)RRb c
;RRc d
returnTT 
newTT 
ShipTileBuilderTT .
(TT. /
)TT/ 0
.UU 
WithXCoordinateUU (
(UU( )
columnUU) /
)UU/ 0
.VV 
WithYCoordinateVV (
(VV( )
	rowNumberVV) 2
)VV2 3
.WW 
BuildWW 
(WW 
)WW  
;WW  !
}YY 
)YY 
.YY 
ToListYY 
(YY 
)YY 
;YY 
var[[ 
ship[[ 
=[[ 
await[[   
_battleshipsDatabase[[! 5
.[[5 6
ShipsRepository[[6 E
.[[E F
	GetByType[[F O
([[O P
shipTypeTuple[[P ]
.[[] ^
Item1[[^ c
)[[c d
;[[d e
var]] 

playerShip]] 
=]]  
new]]! $

PlayerShip]]% /
{^^ 
PlayerId__ 
=__ 
playerId__ '
,__' (
Tiles`` 
=`` 
	shipTiles`` %
,``% &
ShipIdaa 
=aa 
shipaa !
.aa! "
Idaa" $
}bb 
;bb 
playerShipsdd 
.dd 
Adddd 
(dd  

playerShipdd  *
)dd* +
;dd+ ,
}ee 
returngg 
playerShipsgg 
;gg 
}hh 	
}ii 
}jj ®
BD:\dev\Battleships\Battleships\Services\IAttackExecutionService.cs
	namespace 	
Battleships
 
. 
Services 
{ 
public 

	interface #
IAttackExecutionService ,
{ 
Task 
ExecuteAttack 
( 
AttackPayload (
attack) /
)/ 0
;0 1
}		 
}

 å
:D:\dev\Battleships\Battleships\Services\IEndgameService.cs
	namespace 	
Battleships
 
. 
Services 
{ 
public 

	interface 
IEndgameService $
{ 
Task 
< 
bool 
> 
IsEndgameReached #
(# $
Guid$ (
gameSessionId) 6
)6 7
;7 8
Task		 
EndGameSession		 
(		 
Guid		  
gameSessionId		! .
,		. /
string		0 6

attackerId		7 A
)		A B
;		B C
}

 
} Á
BD:\dev\Battleships\Battleships\Services\IEndgameStrategyService.cs
	namespace 	
Battleships
 
. 
Services 
{ 
public 

	interface #
IEndgameStrategyService ,
{ 
Task		 
<		 
IEndgameStrategy		 
>		 
GetEndgameStrategy		 1
(		1 2
Guid		2 6
gameSessionId		7 D
)		D E
;		E F
}

 
} ”
MD:\dev\Battleships\Battleships\Services\Players\Interfaces\IPlayersService.cs
	namespace 	
Battleships
 
. 
Services 
. 
Players &
.& '

Interfaces' 1
{ 
public 

	interface 
IPlayersService $
{		 
Task

 
<

 
List

 
<

 
UserDto

 
>

 
>

 
GetAllUsers

 '
(

' (
)

( )
;

) *
Task 
< 
List 
< 
UserDto 
> 
> 
GetLobbyUsers )
() *
Guid* .
gameSessionId/ <
)< =
;= >
Task 
InviteUserToGame 
( 
Guid "
gameSessionId# 0
,0 1
string2 8
userId9 ?
)? @
;@ A
} 
} Î'
AD:\dev\Battleships\Battleships\Services\Players\PlayersService.cs
	namespace 	
Battleships
 
. 
Services 
. 
Players &
{ 
public 

class 
PlayersService 
:  !
IPlayersService" 1
{ 
private 
readonly  
IBattleshipsDatabase -
_db. 1
;1 2
private 
readonly 
UserManager $
<$ %
ApplicationUser% 4
>4 5
_userManager6 B
;B C
private 
readonly 
ICurrentUserService ,
_currentUserService- @
;@ A
public 
PlayersService 
(  
IBattleshipsDatabase  
database! )
,) *
UserManager 
< 
ApplicationUser '
>' (
userManager) 4
,4 5
ICurrentUserService 
currentUserService  2
)2 3
{ 	
_db   
=   
database   
;   
_userManager!! 
=!! 
userManager!! &
;!!& '
_currentUserService"" 
=""  !
currentUserService""" 4
;""4 5
}## 	
public%% 
async%% 
Task%% 
<%% 
List%% 
<%% 
UserDto%% &
>%%& '
>%%' (
GetAllUsers%%) 4
(%%4 5
)%%5 6
{&& 	
var'' 
currentUserId'' 
='' 
_currentUserService''  3
.''3 4
GetCurrentUserId''4 D
(''D E
)''E F
;''F G
var)) 
users)) 
=)) 
await)) 
_userManager)) *
.))* +
Users))+ 0
.** 
Where** 
(** 
u** 
=>** 
u** 
.** 
Id**  
!=**! #
currentUserId**$ 1
)**1 2
.++ 
Select++ 
(++ 
u++ 
=>++ 
new++  
UserDto++! (
{,, 
Id-- 
=-- 
u-- 
.-- 
Id-- 
,-- 
Name.. 
=.. 
u.. 
... 
UserName.. %
,..% &
GamesPlayedCount// $
=//% &
u//' (
.//( )
Players//) 0
.//0 1
Count//1 6
,//6 7
GamesWonCount00 !
=00" #
u00$ %
.00% &
WonGames00& .
.00. /
Count00/ 4
}11 
)11 
.22 
ToListAsync22 
(22 
)22 
;22 
return44 
users44 
;44 
}55 	
public77 
async77 
Task77 
<77 
List77 
<77 
UserDto77 &
>77& '
>77' (
GetLobbyUsers77) 6
(776 7
Guid777 ;
gameSessionId77< I
)77I J
{88 	
var99 
users99 
=99 
await99 
_userManager99 *
.99* +
Users99+ 0
.:: 
Where:: 
(:: 
u:: 
=>:: 
u:: 
.:: 
Players:: %
.::% &
All::& )
(::) *
p::* +
=>::, .
p::/ 0
.::0 1
GameSessionId::1 >
!=::? A
gameSessionId::B O
)::O P
)::P Q
.;; 
Select;; 
(;; 
u;; 
=>;; 
new;;  
UserDto;;! (
{<< 
Id== 
=== 
u== 
.== 
Id== 
,== 
Name>> 
=>> 
u>> 
.>> 
UserName>> %
,>>% &
GamesPlayedCount?? $
=??% &
u??' (
.??( )
Players??) 0
.??0 1
Count??1 6
,??6 7
GamesWonCount@@ !
=@@" #
u@@$ %
.@@% &
WonGames@@& .
.@@. /
Count@@/ 4
}AA 
)AA 
.BB 
ToListAsyncBB 
(BB 
)BB 
;BB 
returnDD 
usersDD 
;DD 
}EE 	
publicGG 
asyncGG 
TaskGG 
InviteUserToGameGG *
(GG* +
GuidGG+ /
gameSessionIdGG0 =
,GG= >
stringGG? E
userIdGGF L
)GGL M
{HH 	
varII 
playerII 
=II 
newII 
PlayerII #
{JJ 
GameSessionIdKK 
=KK 
gameSessionIdKK  -
,KK- .
UserIdLL 
=LL 
userIdLL 
}MM 
;MM 
awaitOO 
_dbOO 
.OO 
PlayersRepositoryOO '
.OO' (
CreateOO( .
(OO. /
playerOO/ 5
)OO5 6
;OO6 7
}PP 	
}QQ 
}RR å
=D:\dev\Battleships\Battleships\Services\Users\IUserManager.cs
	namespace 	
Battleships
 
. 
Services 
. 
Users $
{ 
public 

	interface 
IUserManager !
{		 
Task

 
<

 
ApplicationUser

 
>

 
GetById

 %
(

% &
string

& ,
userId

- 3
)

3 4
;

4 5

IQueryable 
< 
ApplicationUser "
>" #
Users$ )
{* +
get, /
;/ 0
}1 2
} 
} ë
<D:\dev\Battleships\Battleships\Services\Users\UserManager.cs
	namespace 	
Battleships
 
. 
Services 
. 
Users $
{ 
public 

class 
UserManager 
: 
IUserManager +
{		 
private

 
readonly

 
UserManager

 $
<

$ %
ApplicationUser

% 4
>

4 5
_userManager

6 B
;

B C
public 
UserManager 
( 
UserManager &
<& '
ApplicationUser' 6
>6 7
userManager8 C
)C D
{ 	
_userManager 
= 
userManager &
;& '
} 	
public 

IQueryable 
< 
ApplicationUser )
>) *
Users+ 0
=>1 3
_userManager4 @
.@ A
UsersA F
;F G
public 
async 
Task 
< 
ApplicationUser )
>) *
GetById+ 2
(2 3
string3 9
userId: @
)@ A
{ 	
return 
await 
_userManager %
.% &
FindByIdAsync& 3
(3 4
userId4 :
): ;
;; <
} 	
} 
} æ
8D:\dev\Battleships\Battleships\SignalR\BattleshipsHub.cs
	namespace 	
Battleships
 
. 
SignalR 
{ 
public 

class 
BattleshipsHub 
:  !
Hub" %
{		 
private

 
readonly

 #
IAttackExecutionService

 0#
_attackExecutionService

1 H
;

H I
public 
BattleshipsHub 
( #
IAttackExecutionService 5"
attackExecutionService6 L
)L M
{ 	#
_attackExecutionService #
=$ %"
attackExecutionService& <
;< =
} 	
public 
async 
Task 
ConnectUser %
(% &
string& ,
userId- 3
)3 4
{ 	
await 
Groups 
. 
AddToGroupAsync (
(( )
Context) 0
.0 1
ConnectionId1 =
,= >
userId? E
)E F
;F G
} 	
public 
async 
Task  
ConnectToGameSession .
(. /
string/ 5
gameSessionIdString6 I
)I J
{ 	
await 
Groups 
. 
AddToGroupAsync (
(( )
Context) 0
.0 1
ConnectionId1 =
,= >
gameSessionIdString? R
)R S
;S T
} 	
public 
async 
Task %
DisconnectFromGameSession 3
(3 4
string4 :
gameSessionIdString; N
)N O
{ 	
await 
Groups 
.  
RemoveFromGroupAsync -
(- .
Context. 5
.5 6
ConnectionId6 B
,B C
gameSessionIdStringD W
)W X
;X Y
} 	
public   
async   
Task   
PublishAttack   '
(  ' (
AttackPayload  ( 5
attack  6 <
)  < =
{!! 	
await"" #
_attackExecutionService"" )
."") *
ExecuteAttack""* 7
(""7 8
attack""8 >
)""> ?
;""? @
}## 	
}$$ 
}%% Ë
KD:\dev\Battleships\Battleships\SignalR\BattleshipsSynchronizationService.cs
	namespace 	
Battleships
 
. 
SignalR 
{ 
public		 

class		 -
!BattleshipsSynchronizationService		 2
:		3 4.
"IBattleshipsSynchronizationService		5 W
{

 
private 
readonly 
IHubContext $
<$ %
BattleshipsHub% 3
>3 4
_battleshipsHub5 D
;D E
public -
!BattleshipsSynchronizationService 0
(0 1
IHubContext1 <
<< =
BattleshipsHub= K
>K L
battleshipsHubM [
)[ \
{ 	
_battleshipsHub 
= 
battleshipsHub ,
;, -
} 	
public 
async 
Task 
SendEndgameReached ,
(, -
Guid- 1
gameSessionId2 ?
,? @
stringA G

winnerNameH R
)R S
{ 	
var 
payload 
= 
new 
{ 
gameSessionId  -
,- .

winnerName/ 9
}: ;
;; <
await 
_battleshipsHub !
.! "
Clients" )
.) *
Group* /
(/ 0
gameSessionId0 =
.= >
ToString> F
(F G
)G H
)H I
.I J
	SendAsyncJ S
(S T
$strT d
,d e
payloadf m
)m n
;n o
} 	
public 
async 
Task 
SendAttackMessage +
(+ ,
Guid, 0
gameSessionId1 >
,> ?
BattleshipsMessage@ R
<R S
AttackPayloadS `
>` a
messageb i
)i j
{ 	
await 
_battleshipsHub !
.! "
Clients" )
.) *
Group* /
(/ 0
gameSessionId0 =
.= >
ToString> F
(F G
)G H
)H I
.I J
	SendAsyncJ S
(S T
$strT a
,a b
messagec j
)j k
;k l
} 	
public 
async 
Task !
SendLaunchGameMessage /
(/ 0
Guid0 4
gameSessionId5 B
)B C
{ 	
await 
_battleshipsHub !
.! "
Clients" )
.) *
Group* /
(/ 0
gameSessionId0 =
.= >
ToString> F
(F G
)G H
)H I
.I J
	SendAsyncJ S
(S T
$strT b
,b c
newd g
{h i
gameSessionIdj w
}x y
)y z
;z {
}   	
public"" 
async"" 
Task"" 
InviteUserToGame"" *
(""* +
Guid""+ /
gameSessionId""0 =
,""= >
string""? E
userId""F L
)""L M
{## 	
var$$ 
group$$ 
=$$ 
_battleshipsHub$$ (
.$$( )
Clients$$) 0
.$$0 1
Group$$1 6
($$6 7
userId$$7 =
)$$= >
;$$> ?
await%% 
group%% 
.%% 
	SendAsync%% !
(%%! "
$str%%" +
,%%+ ,
new%%- 0
{%%1 2
gameSessionId%%3 @
}%%A B
)%%B C
;%%C D
}&& 	
}'' 
}(( Ñ	
WD:\dev\Battleships\Battleships\SignalR\Interfaces\IBattleshipsSynchronizationService.cs
	namespace 	
Battleships
 
. 
SignalR 
. 

Interfaces (
{ 
public 

	interface .
"IBattleshipsSynchronizationService 7
{ 
Task		 
SendEndgameReached		 
(		  
Guid		  $
gameSessionId		% 2
,		2 3
string		4 :

winnerName		; E
)		E F
;		F G
Task

 
SendAttackMessage

 
(

 
Guid

 #
gameSessionId

$ 1
,

1 2
BattleshipsMessage

3 E
<

E F
AttackPayload

F S
>

S T
message

U \
)

\ ]
;

] ^
Task !
SendLaunchGameMessage "
(" #
Guid# '
gameSessionId( 5
)5 6
;6 7
Task 
InviteUserToGame 
( 
Guid "
gameSessionId# 0
,0 1
string2 8
userId9 ?
)? @
;@ A
} 
} µ
>D:\dev\Battleships\Battleships\SignalR\Models\AttackPayload.cs
	namespace 	
Battleships
 
. 
SignalR 
. 
Models $
{ 
public 

class 
AttackPayload 
{ 
public 
Guid 
GameSessionId !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string 
AttackingUserId %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public		 
int		 
TargetXCoordinate		 $
{		% &
get		' *
;		* +
set		, /
;		/ 0
}		1 2
public

 
int

 
TargetYCoordinate

 $
{

% &
get

' *
;

* +
set

, /
;

/ 0
}

1 2
} 
} ™
CD:\dev\Battleships\Battleships\SignalR\Models\BattleshipsMessage.cs
	namespace 	
Battleships
 
. 
SignalR 
. 
Models $
{ 
public 

class 
BattleshipsMessage #
<# $
TPayload$ ,
>, -
{ 
public 
string 
CallerUserId "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
TPayload 
Payload 
{  !
get" %
;% &
set' *
;* +
}, -
} 
} ∑i
)D:\dev\Battleships\Battleships\Startup.cs
	namespace 	
Battleships
 
{   
public!! 

class!! 
Startup!! 
{"" 
public## 
Startup## 
(## 
IConfiguration## %
configuration##& 3
)##3 4
{$$ 	
Configuration%% 
=%% 
configuration%% )
;%%) *
}&& 	
public(( 
IConfiguration(( 
Configuration(( +
{((, -
get((. 1
;((1 2
}((3 4
public++ 
void++ 
ConfigureServices++ %
(++% &
IServiceCollection++& 8
services++9 A
)++A B
{,, 	
services-- 
.-- 
AddDbContext-- !
<--! " 
ApplicationDbContext--" 6
>--6 7
(--7 8
options--8 ?
=>--@ B
options.. 
... 
	UseNpgsql.. !
(..! "
Configuration.." /
.../ 0
GetConnectionString..0 C
(..C D
$str..D W
)..W X
)..X Y
)..Y Z
;..Z [
services00 
.00 3
'AddDatabaseDeveloperPageExceptionFilter00 <
(00< =
)00= >
;00> ?
services22 
.22 
AddDefaultIdentity22 '
<22' (
ApplicationUser22( 7
>227 8
(228 9
options229 @
=>22A C
{33 
options44 
.44 
SignIn44 "
.44" ##
RequireConfirmedAccount44# :
=44; <
true44= A
;44A B
options55 
.55 
Password55 $
.55$ %
RequireDigit55% 1
=552 3
false554 9
;559 :
options66 
.66 
Password66 $
.66$ %
RequiredLength66% 3
=664 5
$num666 7
;667 8
options77 
.77 
Password77 $
.77$ %
RequireLowercase77% 5
=776 7
false778 =
;77= >
options88 
.88 
Password88 $
.88$ %
RequireUppercase88% 5
=886 7
false888 =
;88= >
options99 
.99 
Password99 $
.99$ %
RequiredUniqueChars99% 8
=999 :
$num99; <
;99< =
options:: 
.:: 
Password:: $
.::$ %"
RequireNonAlphanumeric::% ;
=::< =
false::> C
;::C D
};; 
);; 
.<< $
AddEntityFrameworkStores<< )
<<<) * 
ApplicationDbContext<<* >
><<> ?
(<<? @
)<<@ A
;<<A B
servicesAA 
.AA 
AddAuthenticationAA &
(AA& '
optionsAA' .
=>AA/ 1
{BB 
optionsCC 
.CC %
DefaultAuthenticateSchemeCC 5
=CC6 7
JwtBearerDefaultsCC8 I
.CCI J 
AuthenticationSchemeCCJ ^
;CC^ _
optionsDD 
.DD "
DefaultChallengeSchemeDD 2
=DD3 4
JwtBearerDefaultsDD5 F
.DDF G 
AuthenticationSchemeDDG [
;DD[ \
optionsEE 
.EE 
DefaultSchemeEE )
=EE* +
JwtBearerDefaultsEE, =
.EE= > 
AuthenticationSchemeEE> R
;EER S
}FF 
)FF 
.GG 
AddJwtBearerGG 
(GG 
optionsGG %
=>GG& (
{HH 
optionsII 
.II  
RequireHttpsMetadataII 0
=II1 2
falseII3 8
;II8 9
optionsJJ 
.JJ 
	SaveTokenJJ %
=JJ& '
falseJJ( -
;JJ- .
optionsKK 
.KK %
TokenValidationParametersKK 5
=KK6 7
newKK8 ;%
TokenValidationParametersKK< U
{LL $
ValidateIssuerSigningKeyMM 0
=MM1 2
trueMM3 7
,MM7 8
IssuerSigningKeyNN (
=NN) *!
AuthenticationUtilityNN+ @
.NN@ A#
GetSymmetricSecurityKeyNNA X
(NNX Y
)NNY Z
,NNZ [
ValidateIssuerOO &
=OO' (
falseOO) .
,OO. /
ValidateAudiencePP (
=PP) *
falsePP+ 0
,PP0 1
	ClockSkewQQ !
=QQ" #
TimeSpanQQ$ ,
.QQ, -
ZeroQQ- 1
}RR 
;RR 
}SS 
)SS 
;SS 
servicesUU 
.UU #
AddControllersWithViewsUU ,
(UU, -
)UU- .
;UU. /
servicesXX 
.XX 

AddSignalRXX 
(XX  
)XX  !
;XX! "
servicesYY 
.YY 
AddSpaStaticFilesYY &
(YY& '
configurationYY' 4
=>YY5 7
{YY8 9
configurationYY: G
.YYG H
RootPathYYH P
=YYQ R
$strYYS c
;YYc d
}YYe f
)YYf g
;YYg h
services[[ 
.\\ "
AddHttpContextAccessor\\ '
(\\' (
)\\( )
.]] 
	AddScoped]] 
(]] 
typeof]] !
(]]! "
IRepository]]" -
<]]- .
>]]. /
)]]/ 0
,]]0 1
typeof]]2 8
(]]8 9
BaseRepository]]9 G
<]]G H
>]]H I
)]]I J
)]]J K
.^^ 
	AddScoped^^ 
<^^ *
IGameSessionSettingsRepository^^ 9
,^^9 :)
GameSessionSettingsRepository^^; X
>^^X Y
(^^Y Z
)^^Z [
.__ 
	AddScoped__ 
<__  
IBattleshipsDatabase__ /
,__/ 0
BattleshipsDatabase__1 D
>__D E
(__E F
)__F G
.`` 
	AddScoped`` 
<`` 
IShipsRepository`` +
,``+ ,
ShipsRepository``- <
>``< =
(``= >
)``> ?
.aa 
	AddScopedaa 
<aa "
IAuthenticationServiceaa 1
,aa1 2!
AuthenticationServiceaa3 H
>aaH I
(aaI J
)aaJ K
.bb 
	AddScopedbb 
<bb 
ICurrentUserServicebb .
,bb. /
CurrentUserServicebb0 B
>bbB C
(bbC D
)bbD E
.cc 
	AddScopedcc 
<cc 
IGameSessionServicecc .
,cc. /
GameSessionServicecc0 B
>ccB C
(ccC D
)ccD E
.dd 
	AddScopeddd 
<dd .
"IBattleshipsSynchronizationServicedd =
,dd= >-
!BattleshipsSynchronizationServicedd? `
>dd` a
(dda b
)ddb c
.ee 
	AddScopedee 
<ee #
IGameSessionsRepositoryee 2
,ee2 3"
GameSessionsRepositoryee4 J
>eeJ K
(eeK L
)eeL M
.ff 
	AddScopedff 
<ff 
IPlayersRepositoryff -
,ff- .
PlayersRepositoryff/ @
>ff@ A
(ffA B
)ffB C
.gg 
	AddScopedgg 
<gg 
IPlayersServicegg *
,gg* +
PlayersServicegg, :
>gg: ;
(gg; <
)gg< =
.hh 
	AddScopedhh 
<hh  
IShipTilesRepositoryhh /
,hh/ 0
ShipTilesRepositoryhh1 D
>hhD E
(hhE F
)hhF G
.ii 
	AddScopedii 
<ii #
IAttackExecutionServiceii 2
,ii2 3"
AttackExecutionServiceii4 J
>iiJ K
(iiK L
)iiL M
.jj 
	AddScopedjj 
<jj 
IEndgameServicejj *
,jj* +
EndgameServicejj, :
>jj: ;
(jj; <
)jj< =
.kk 
	AddScopedkk 
<kk #
IEndgameStrategyServicekk 2
,kk2 3"
EndgameStrategyServicekk4 J
>kkJ K
(kkK L
)kkL M
.ll 
	AddScopedll 
<ll 
IEndgameStrategyll +
,ll+ ,"
ClassicEndgameStrategyll- C
>llC D
(llD E
)llE F
.mm 
	AddScopedmm 
<mm 
IEndgameStrategymm +
,mm+ ,%
DeathMatchEndgameStrategymm- F
>mmF G
(mmG H
)mmH I
.nn 
	AddScopednn 
<nn 
IEndgameStrategynn +
,nn+ ,-
!DestroyedShipCountEndgameStrategynn- N
>nnN O
(nnO P
)nnP Q
.oo 
	AddScopedoo 
<oo 
IEndgameStrategyoo +
,oo+ ,*
RoundCountLimitEndgameStrategyoo- K
>ooK L
(ooL M
)ooM N
.pp 
	AddScopedpp 
<pp 
IAchievementServicepp .
,pp. /
AchievementServicepp0 B
>ppB C
(ppC D
)ppD E
.qq 
	AddScopedqq 
<qq 
IGameLaunchServiceqq -
,qq- .
GameLaunchServiceqq/ @
>qq@ A
(qqA B
)qqB C
.rr 
	AddScopedrr 
<rr (
IPlayerShipGenerationServicerr 7
,rr7 8'
PlayerShipGenerationServicerr9 T
>rrT U
(rrU V
)rrV W
.ss 
AddSingletonss 
<ss "
NumberGeneratorFactoryss 4
>ss4 5
(ss5 6
)ss6 7
.tt 
	AddScopedtt 
<tt 
IFriendsServicett *
,tt* +
FriendsServicett, :
>tt: ;
(tt; <
)tt< =
;uu 
}vv 	
publicyy 
voidyy 
	Configureyy 
(yy 
IApplicationBuilderyy 1
appyy2 5
,yy5 6
IWebHostEnvironmentyy7 J
envyyK N
)yyN O
{zz 	
if{{ 
({{ 
env{{ 
.{{ 
IsDevelopment{{ !
({{! "
){{" #
){{# $
{|| 
app}} 
.}} %
UseDeveloperExceptionPage}} -
(}}- .
)}}. /
;}}/ 0
app~~ 
.~~ !
UseMigrationsEndPoint~~ )
(~~) *
)~~* +
;~~+ ,
} 
else
ÄÄ 
{
ÅÅ 
app
ÑÑ 
.
ÑÑ 
UseHsts
ÑÑ 
(
ÑÑ 
)
ÑÑ 
;
ÑÑ 
}
ÖÖ 
app
áá 
.
áá !
UseHttpsRedirection
áá #
(
áá# $
)
áá$ %
;
áá% &
app
àà 
.
àà 
UseStaticFiles
àà 
(
àà 
)
àà  
;
àà  !
if
ââ 
(
ââ 
!
ââ 
env
ââ 
.
ââ 
IsDevelopment
ââ "
(
ââ" #
)
ââ# $
)
ââ$ %
{
ää 
app
ãã 
.
ãã 
UseSpaStaticFiles
ãã %
(
ãã% &
)
ãã& '
;
ãã' (
}
åå 
app
éé 
.
éé 

UseRouting
éé 
(
éé 
)
éé 
;
éé 
app
êê 
.
êê 
UseAuthentication
êê !
(
êê! "
)
êê" #
;
êê# $
app
íí 
.
íí 
UseAuthorization
íí  
(
íí  !
)
íí! "
;
íí" #
app
ìì 
.
ìì 
UseEndpoints
ìì 
(
ìì 
	endpoints
ìì &
=>
ìì' )
{
îî 
	endpoints
ïï 
.
ïï  
MapControllerRoute
ïï ,
(
ïï, -
name
ññ 
:
ññ 
$str
ññ #
,
ññ# $
pattern
óó 
:
óó 
$str
óó @
)
óó@ A
;
óóA B
	endpoints
òò 
.
òò 
MapRazorPages
òò '
(
òò' (
)
òò( )
;
òò) *
	endpoints
ôô 
.
ôô 
MapHub
ôô  
<
ôô  !
BattleshipsHub
ôô! /
>
ôô/ 0
(
ôô0 1
$str
ôô1 B
,
ôôB C
options
ôôD K
=>
ôôL N
{
öö 
options
õõ 
.
õõ 

Transports
õõ &
=
õõ' (
HttpTransportType
õõ) :
.
õõ: ;

WebSockets
õõ; E
;
õõE F
}
úú 
)
úú 
;
úú 
}
ùù 
)
ùù 
;
ùù 
app
üü 
.
üü 
UseSpa
üü 
(
üü 
spa
üü 
=>
üü 
{
†† 
spa
§§ 
.
§§ 
Options
§§ 
.
§§ 

SourcePath
§§ &
=
§§' (
$str
§§) 4
;
§§4 5
if
¶¶ 
(
¶¶ 
env
¶¶ 
.
¶¶ 
IsDevelopment
¶¶ %
(
¶¶% &
)
¶¶& '
)
¶¶' (
{
ßß 
spa
®® 
.
®® !
UseAngularCliServer
®® +
(
®®+ ,
	npmScript
®®, 5
:
®®5 6
$str
®®7 >
)
®®> ?
;
®®? @
}
©© 
}
™™ 
)
™™ 
;
™™ 

ShipSeeder
¨¨ 
.
¨¨ 
	SeedShips
¨¨  
(
¨¨  !
app
¨¨! $
.
¨¨$ %!
ApplicationServices
¨¨% 8
)
¨¨8 9
;
¨¨9 :
SeedAchievements
≠≠ 
.
≠≠ 
SeedAchs
≠≠ %
(
≠≠% &
app
≠≠& )
.
≠≠) *!
ApplicationServices
≠≠* =
)
≠≠= >
;
≠≠> ?
}
ÆÆ 	
}
ØØ 
}∞∞ ‘	
7D:\dev\Battleships\Battleships\Utilities\TimeUtility.cs
	namespace 	
Battleships
 
. 
	Utilities 
{ 
public 

class 
TimeUtility 
{ 
private 
static 
TimeUtility "
timeUtilityInstance# 6
=7 8
null9 =
;= >
public		 
static		 
TimeUtility		 !
GetTimeUtility		" 0
(		0 1
)		1 2
{

 	
if 
( 
timeUtilityInstance #
is$ &
null' +
)+ ,
{ 
timeUtilityInstance #
=$ %
new& )
TimeUtility* 5
(5 6
)6 7
;7 8
} 
return 
timeUtilityInstance &
;& '
} 	
private 
TimeUtility 
( 
) 
{ 	
} 	
public 
DateTime 
GetCurrentDateTime *
(* +
)+ ,
{ 	
return 
DateTime 
. 
Now 
;  
} 	
} 
} 