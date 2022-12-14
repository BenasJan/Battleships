?
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
} ?
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
 ?
?D:\dev\Battleships\Battleships\Adapter\SendGridEmailProvider.cs
	namespace 	
Battleships
 
. 
Adapter 
{ 
public 

class !
SendGridEmailProvider &
:' (
IEmailProvider) 7
{ 
readonly		 
SendGridClient		 
_client		  '
=		( )
new		* -
(		- .
$str		. u
)		u v
;		v w
readonly

 
EmailAddress

 
_from

 #
=

$ %
new

& )
(

) *
$str

* C
,

C D
$str

E R
)

R S
;

S T
public 
async 
Task 
	SendEmail #
(# $
Email$ )
email* /
)/ 0
{ 	
var 
subject 
= 
email 
.  
Subject  '
;' (
var 
to 
= 
new 
EmailAddress %
(% &
email& +
.+ ,
To, .
,. /
email0 5
.5 6
Name6 :
): ;
;; <
var 
plainTextContent  
=! "
email# (
.( )
Body) -
;- .
var 
htmlContent 
= 
$"  
$str  (
{( )
email) .
.. /
Body/ 3
}3 4
$str4 =
"= >
;> ?
var 
msg 
= 

MailHelper  
.  !
CreateSingleEmail! 2
(2 3
_from3 8
,8 9
to: <
,< =
subject> E
,E F
plainTextContentG W
,W X
htmlContentY d
)d e
;e f
await 
_client 
. 
SendEmailAsync (
(( )
msg) ,
), -
;- .
} 	
public 
async 
Task 
SendToAllRecipients -
(- .
). /
{ 	
await 
Task 
. 
Yield 
( 
) 
; 
} 	
} 
} ?
;D:\dev\Battleships\Battleships\Adapter\SmtpEmailProvider.cs
	namespace 	
Battleships
 
. 
Adapter 
{ 
public 

class 
SmtpEmailProvider "
:# $
IEmailProvider% 3
{ 
private 
readonly 

SmtpClient #
_smtpClient$ /
=0 1
new2 5
(5 6
)6 7
{8 9
	EnableSsl: C
=D E
trueF J
}K L
;L M
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
. 
Send 
( 
$str 6
,6 7
email8 =
.= >
To> @
,@ A
emailB G
.G H
SubjectH O
,O P
emailQ V
.V W
BodyW [
)[ \
;\ ]
await 
Task 
. 
Yield 
( 
) 
; 
} 	
public 
async 
Task 
SendToAllRecipients -
(- .
). /
{ 	
await 
Task 
. 
Yield 
( 
) 
; 
} 	
} 
} ?
>D:\dev\Battleships\Battleships\Commands\FriendRemoveCommand.cs
	namespace 	
Battleships
 
. 
Commands 
{ 
public 

class 
FriendRemoveCommand $
:% &
IFriendCommand' 5
{ 
private 
readonly 
Friend 
_friend  '
;' (
public

 
FriendRemoveCommand

 "
(

" #
Friend

# )
friend

* 0
)

0 1
{ 	
_friend 
= 
friend 
; 
} 	
public 
void 
Execute 
( 
) 
{ 	
Console 
. 
	WriteLine 
( 
$"  
{  !
_friend! (
.( )
User1) .
}. /
$str/ 0
{0 1
_friend1 8
.8 9
User29 >
}> ?
"? @
)@ A
;A B
} 	
} 
} ?
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
private 
readonly 
IFriendCommand ' 
_friendRemoveCommand( <
;< =
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
{ 	 
_friendRemoveCommand  
=! "
friendRemoveCommand# 6
;6 7
} 	
public 
void 
	TryRemove 
( 
) 
{ 	 
_friendRemoveCommand  
.  !
Execute! (
(( )
)) *
;* +
} 	
} 
} ?
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
} ?
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
} ?
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
private 
readonly 

PlayerShip #
_ship$ )
;) *
public		 
ShipMoveUpCommand		  
(		  !

PlayerShip		! +
ship		, 0
)		0 1
{

 	
_ship 
= 
ship 
; 
} 	
public 
void 
Execute 
( 
) 
{ 	
_ship 
. 
MoveUp 
( 
) 
; 
} 	
} 
public 

class 
ShipMoveDownCommand $
:% &
IShipActionCommand' 9
{ 
private 
readonly 

PlayerShip #
_ship$ )
;) *
public 
ShipMoveDownCommand "
(" #

PlayerShip# -
ship. 2
)2 3
{ 	
this 
. 
_ship 
= 
ship 
; 
} 	
public 
void 
Execute 
( 
) 
{ 	
_ship 
. 
MoveDown 
( 
) 
; 
}   	
}!! 
public## 

class## 
ShipMoveLeftCommand## $
:##% &
IShipActionCommand##' 9
{$$ 
private%% 
readonly%% 

PlayerShip%% #
_ship%%$ )
;%%) *
public'' 
ShipMoveLeftCommand'' "
(''" #

PlayerShip''# -
ship''. 2
)''2 3
{(( 	
this)) 
.)) 
_ship)) 
=)) 
ship)) 
;)) 
}** 	
public,, 
void,, 
Execute,, 
(,, 
),, 
{-- 	
_ship.. 
... 
MoveLeft.. 
(.. 
).. 
;.. 
}// 	
}00 
public22 

class22  
ShipMoveRightCommand22 %
:22& '
IShipActionCommand22( :
{33 
private44 
readonly44 

PlayerShip44 #
_ship44$ )
;44) *
public66  
ShipMoveRightCommand66 #
(66# $

PlayerShip66$ .
ship66/ 3
)663 4
{77 	
_ship88 
=88 
ship88 
;88 
}99 	
public;; 
void;; 
Execute;; 
(;; 
);; 
{<< 	
_ship== 
.== 
	MoveRight== 
(== 
)== 
;== 
}>> 	
}?? 
}@@ ?
CD:\dev\Battleships\Battleships\Controllers\AchievementController.cs
	namespace 	
Battleships
 
. 
Controllers !
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public		 

class		 !
AchievementController		 &
:		' (
ControllerBase		) 7
{

 
private 
readonly 
IAchievementService ,
_achievementService- @
;@ A
public !
AchievementController $
($ %
IAchievementService% 8
achievementService9 K
)K L
{ 	
_achievementService 
=  !
achievementService" 4
;4 5
} 	
[ 	
HttpGet	 
( 
$str #
)# $
]$ %
public 
async 
Task 
< 
IActionResult '
>' (
ListPlayers) 4
(4 5
)5 6
{ 	
var 
achievements 
= 
await $
_achievementService% 8
.8 9
ListAchievements9 I
(I J
)J K
;K L
return 
Ok 
( 
achievements "
)" #
;# $
} 	
} 
} ?
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
}## ?
>D:\dev\Battleships\Battleships\Controllers\FriendController.cs
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
 
FriendController

 !
:

" #
ControllerBase

$ 2
{ 
private 
readonly 
IFriendsService (
_friendsService) 8
;8 9
public 
FriendController 
(  
IFriendsService  /
friendsService0 >
)> ?
{ 	
_friendsService 
= 
friendsService ,
;, -
} 	
[ 	
HttpGet	 
( 
$str 
) 
]  
public 
async 
Task 
< 
IActionResult '
>' (
ListFriends) 4
(4 5
)5 6
{ 	
var 
friends 
= 
await 
_friendsService  /
./ 0
ListFriends0 ;
(; <
)< =
;= >
return 
Ok 
( 
friends 
) 
; 
} 	
[ 	
HttpPost	 
( 
$str 
) 
] 
public 
async 
Task 
< 
IActionResult '
>' (
	AddFriend) 2
(2 3
[3 4
FromBody4 <
]< =
FriendAddDto> J
friendAddBodyK X
)X Y
{ 	
var 
success 
= 
await 
_friendsService  /
./ 0
	AddFriend0 9
(9 :
friendAddBody: G
.G H
UserIdH N
)N O
;O P
return   
Ok   
(   
success   
)   
;   
}!! 	
["" 	
HttpPost""	 
("" 
$str""  
)""  !
]""! "
public## 
async## 
Task## 
<## 
IActionResult## '
>##' (
RemoveFriend##) 5
(##5 6
[##6 7
FromBody##7 ?
]##? @
	FriendDto##A J
friend##K Q
)##Q R
{$$ 	
var%% 
success%% 
=%% 
await%% 
_friendsService%%  /
.%%/ 0
RemoveFriend%%0 <
(%%< =
friend%%= C
)%%C D
;%%D E
return'' 
Ok'' 
('' 
success'' 
)'' 
;'' 
}(( 	
})) 
}** ?>
CD:\dev\Battleships\Battleships\Controllers\GameSessionController.cs
	namespace

 	
Battleships


 
.

 
Controllers

 !
{ 
[ 
ApiController 
] 
[ 
Route 

(
 
$str 
) 
] 
public 

class !
GameSessionController &
:& '
ControllerBase( 6
{ 
private 
readonly 
IGameSessionService ,
_gameSessionService- @
;@ A
private 
readonly 
IPlayersService (
_playersService) 8
;8 9
private 
readonly 
IGameLaunchService +
_gameLaunchService, >
;> ?
private 
readonly .
"IBattleshipsSynchronizationService ;.
"_battleshipsSynchronizationService< ^
;^ _
private 
readonly '
IInGameSessionHelperService 4'
_inGameSessionHelperService5 P
;P Q
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
,P Q'
IInGameSessionHelperService '&
inGameSessionHelperService( B
)B C
{ 	
_gameSessionService 
=  !
gameSessionService" 4
;4 5
_playersService 
= 
playersService ,
;, -
_gameLaunchService 
=  
gameLaunchService! 2
;2 3.
"_battleshipsSynchronizationService   .
=  / 0-
!battleshipsSynchronizationService  1 R
;  R S'
_inGameSessionHelperService!! '
=!!( )&
inGameSessionHelperService!!* D
;!!D E
}"" 	
[$$ 	
HttpPost$$	 
($$ 
$str$$ !
)$$! "
]$$" #
public%% 
async%% 
Task%% 
<%% 
IActionResult%% '
>%%' (
CreateSessions%%) 7
(%%7 8
[%%8 9
FromBody%%9 A
]%%A B!
GameSessionRequestDto%%C X
gameSessionDto%%Y g
)%%g h
{&& 	
return'' 
Ok'' 
('' 
await'' 
_gameSessionService'' /
.''/ 0
CreateSession''0 =
(''= >
gameSessionDto''> L
)''L M
)''M N
;''N O
}(( 	
[** 	
HttpGet**	 
(** 
$str** 
)**  
]**  !
public++ 
async++ 
Task++ 
<++ 
IActionResult++ '
>++' (
ListSessions++) 5
(++5 6
)++6 7
{,, 	
Console-- 
.-- 
	WriteLine-- 
(-- 
$str-- )
)--) *
;--* +
var.. 
gameSessions.. 
=.. 
await.. $
_gameSessionService..% 8
...8 9
ListAllSessions..9 H
(..H I
)..I J
;..J K
return00 
Ok00 
(00 
gameSessions00 "
)00" #
;00# $
}11 	
[33 	
HttpGet33	 
(33 
$str33 
)33 
]33 
public44 
async44 
Task44 
<44 
IActionResult44 '
>44' (

GetSession44) 3
(443 4
Guid444 8
id449 ;
)44; <
{55 	
var66 
game66 
=66 
await66 
_gameSessionService66 0
.660 1

GetSession661 ;
(66; <
id66< >
)66> ?
;66? @
return77 
Ok77 
(77 
game77 
)77 
;77 
}88 	
[:: 	
HttpGet::	 
(:: 
$str:: /
)::/ 0
]::0 1
public;; 
async;; 
Task;; 
<;; 
IActionResult;; '
>;;' (
GetInGameSession;;) 9
(;;9 :
Guid;;: >
gameSessionId;;? L
);;L M
{<< 	
var== 
dto== 
=== 
await== '
_inGameSessionHelperService== 7
.==7 8
GetInGameSession==8 H
(==H I
gameSessionId==I V
)==V W
;==W X
return?? 
Ok?? 
(?? 
dto?? 
)?? 
;?? 
}@@ 	
[BB 	
HttpPostBB	 
(BB 
$strBB 4
)BB4 5
]BB5 6
publicCC 
asyncCC 
TaskCC 
<CC 
IActionResultCC '
>CC' (

LaunchGameCC) 3
(CC3 4
GuidCC4 8
gameSessionIdCC9 F
,CCF G
boolCCH L
rematchCCM T
)CCT U
{DD 	
awaitEE 
_gameLaunchServiceEE $
.EE$ %

LaunchGameEE% /
(EE/ 0
gameSessionIdEE0 =
,EE= >
rematchEE? F
)EEF G
;EEG H
ResponseGG 
.GG 
OnCompletedGG  
(GG  !
asyncGG! &
(GG' (
)GG( )
=>GG* ,
awaitHH .
"_battleshipsSynchronizationServiceHH 8
.HH8 9!
SendLaunchGameMessageHH9 N
(HHN O
gameSessionIdHHO \
)HH\ ]
)HH] ^
;HH^ _
returnJJ 
OkJJ 
(JJ 
)JJ 
;JJ 
}KK 	
[MM 	
HttpPostMM	 
(MM 
$strMM /
)MM/ 0
]MM0 1
publicNN 
asyncNN 
TaskNN 
<NN 
IActionResultNN '
>NN' (
InvitePlayerNN) 5
(NN5 6
GuidNN6 :
gameSessionIdNN; H
,NNH I
[NNJ K
FromBodyNNK S
]NNS T
UserInviteDtoNNU b
inviteNNc i
)NNi j
{OO 	
awaitPP 
_playersServicePP !
.PP! "
InviteUserToGamePP" 2
(PP2 3
gameSessionIdPP3 @
,PP@ A
invitePPB H
.PPH I
UserIdPPI O
)PPO P
;PPP Q
ResponseRR 
.RR 
OnCompletedRR  
(RR  !
asyncRR! &
(RR' (
)RR( )
=>RR* ,
awaitSS .
"_battleshipsSynchronizationServiceSS 8
.SS8 9
InviteUserToGameSS9 I
(SSI J
gameSessionIdSSJ W
,SSW X
inviteSSY _
.SS_ `
UserIdSS` f
)SSf g
)SSg h
;SSh i
returnUU 
OkUU 
(UU 
)UU 
;UU 
}VV 	
[XX 	
HttpPostXX	 
(XX 
$strXX 2
)XX2 3
]XX3 4
publicYY 
asyncYY 
TaskYY 
<YY 
IActionResultYY '
>YY' (
MoveShipYY) 1
(YY1 2
GuidYY2 6
gameSessionIdYY7 D
,YYD E
[YYF G
FromBodyYYG O
]YYO P
ShipMoveDtoYYQ \
shipMoveDtoYY] h
)YYh i
{ZZ 	
var\\ 
dto\\ 
=\\ 
await\\ 
_gameSessionService\\ /
.\\/ 0
MoveShipInSession\\0 A
(\\A B
gameSessionId\\B O
,\\O P
shipMoveDto\\Q \
.\\\ ]
ShipId\\] c
,\\c d
shipMoveDto\\e p
.\\p q
	Direction\\q z
)\\z {
;\\{ |
return^^ 
Ok^^ 
(^^ 
dto^^ 
)^^ 
;^^ 
}__ 	
}`` 
}aa ?
>D:\dev\Battleships\Battleships\Controllers\PlayerController.cs
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
 
PlayerController

 !
:

" #
ControllerBase

$ 2
{ 
private 
readonly 
IPlayersService (
_playersService) 8
;8 9
public 
PlayerController 
(  
IPlayersService  /
playersService0 >
)> ?
{ 	
_playersService 
= 
playersService ,
;, -
} 	
[ 	
HttpGet	 
( 
$str 
) 
] 
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
var 
allUsers 
= 
await  
_playersService! 0
.0 1
GetAllUsers1 <
(< =
)= >
;> ?
return 
Ok 
( 
allUsers 
) 
;  
} 	
[ 	
HttpGet	 
( 
$str 
) 
]  
public 
async 
Task 
< 
IActionResult '
>' (
ListLobbyPlayers) 9
(9 :
[: ;
	FromQuery; D
]D E
GuidF J
gameSessionIdK X
)X Y
{ 	
var 
players 
= 
await 
_playersService  /
./ 0
GetLobbyUsers0 =
(= >
gameSessionId> K
)K L
;L M
return   
Ok   
(   
players   
)   
;   
}!! 	
}"" 
}## ?
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
ModelBuilder0 <
builder= D
)D E
{ 	
builder 
. 
Entity 
< 
Ship 
>  
(  !
)! "
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
(  !
builder! (
)( )
;) *
} 	
} 
} ?
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

static 
class 
BattleshipClaims (
{ 
public 
const 
string 
UserId "
=# $
$str% .
;. /
} 
} ?
BD:\dev\Battleships\Battleships\Data\Constants\EndgameStrategies.cs
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
class 
EndgameStrategies )
{ 
public 
const 
string 

DeathMatch &
=' (
$str) 6
;6 7
public 
const 
string 
DestroyedShipCount .
=/ 0
$str1 G
;G H
public 
const 
string 
RoundCountLimit +
=, -
$str. A
;A B
public 
const 
string 
Classic #
=$ %
$str& /
;/ 0
}		 
}

 ?
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
} ?
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
} ?
7D:\dev\Battleships\Battleships\Data\Dto\FriendAddDto.cs
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
class 
FriendAddDto 
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
} ?
4D:\dev\Battleships\Battleships\Data\Dto\FriendDto.cs
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
class 
	FriendDto 
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
public 
int 
GamesPlayedCount #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
int 
GamesWonCount  
{! "
get# &
;& '
set( +
;+ ,
}- .
public		 
string		 
UserId		 
{		 
get		 "
;		" #
set		$ '
;		' (
}		) *
} 
} ?
9D:\dev\Battleships\Battleships\Data\Dto\GameSessionDto.cs
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
class 
GameSessionDto 
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
Icon
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
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
GridSize 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
	GameTypes 
GameType !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string 
HostName 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
Guid 
HostId 
{ 
get  
;  !
set" %
;% &
}' (
public 
List 
< 
PlayerLobbyDto "
>" #
LobbyPlayers$ 0
{1 2
get3 6
;6 7
set8 ;
;; <
}= >
public 
override 
string 
ToString '
(' (
)( )
{ 	
foreach 
( 
var 
x 
in 
LobbyPlayers *
)* +
{ 
Console 
. 
	WriteLine !
(! "
x" #
.# $
Name$ (
)( )
;) *
} 
return 
$" 
{ 
nameof 
( 
Id 
)  
}  !
$str! #
{# $
Id$ &
}& '
$str' )
{) *
nameof* 0
(0 1
Icon1 5
)5 6
}6 7
$str7 9
{9 :
Icon: >
}> ?
$str? A
{A B
nameofB H
(H I
NameI M
)M N
}N O
$strO Q
{Q R
NameR V
}V W
$strW Y
{Y Z
nameofZ `
(` a
GridSizea i
)i j
}j k
$strk m
{m n
GridSizen v
}v w
$strw y
{y z
nameof	z ?
(
? ?
GameType
? ?
)
? ?
}
? ?
$str
? ?
{
? ?
GameType
? ?
}
? ?
$str
? ?
{
? ?
nameof
? ?
(
? ?
HostName
? ?
)
? ?
}
? ?
$str
? ?
{
? ?
HostName
? ?
}
? ?
$str
? ?
{
? ?
nameof
? ?
(
? ?
HostId
? ?
)
? ?
}
? ?
$str
? ?
{
? ?
HostId
? ?
}
? ?
$str
? ?
{
? ?
nameof
? ?
(
? ?
LobbyPlayers
? ?
)
? ?
}
? ?
$str
? ?
{
? ?
LobbyPlayers
? ?
.
? ?
ToString
? ?
(
? ?
)
? ?
}
? ?
"
? ?
;
? ?
} 	
} 
} ?
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
}		 ?
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
} ?
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
} ?
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
} ?
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
} ?
4D:\dev\Battleships\Battleships\Data\Dto\PlayerDto.cs
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
class 
	PlayerDto 
{ 
public 
Guid 
Id 
{ 
get 
; 
set !
;! "
}# $
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
public		 
int		 
GamesPlayedCount		 #
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
GamesWonCount
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
public 
string 
UserId 
{ 
get "
;" #
set$ '
;' (
}) *
} 
} ?
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
}		 ?
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
} ?
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
} ?
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
 ?
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
} ?
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
} ?
8D:\dev\Battleships\Battleships\Data\PasswordException.cs
	namespace 	
Battleships
 
. 
Data 
{ 
[ 
Serializable 
] 
public 

class 
PasswordException "
:# $
	Exception% .
{ 
public 
PasswordException  
(  !
string! '
message( /
)/ 0
:1 2
base3 7
(7 8
message8 ?
)? @
{		 	
} 	
} 
} ?Y
7D:\dev\Battleships\Battleships\Data\SeedAchievements.cs
	namespace 	
Battleships
 
. 
Data 
{		 
public

 

static

 
class

 
SeedAchievements

 (
{ 
public 
static 
void 
SeedAchs #
(# $
IServiceProvider$ 4
serviceProvider5 D
)D E
{ 	
using 
var 
serviceScope "
=# $
serviceProvider% 4
.4 5
CreateScope5 @
(@ A
)A B
;B C
var 
battleshipsDatabase #
=$ %
serviceScope& 2
.2 3
ServiceProvider3 B
.B C
GetRequiredServiceC U
<U V 
IBattleshipsDatabaseV j
>j k
(k l
)l m
;m n
var 
isEmpty 
= 
battleshipsDatabase -
.- ."
AchievementsRepository. D
.D E
IsEmptyE L
(L M
)M N
;N O
if 
( 
isEmpty 
) 
{ 
var 
achievementManager &
=' (
new) ,
AchievementManager- ?
(? @
)@ A
;A B
CloneAchievements !
(! "
achievementManager" 4
)4 5
;5 6
var 
achievements  
=! "
new# &
List' +
<+ ,
Achievement, 7
>7 8
(8 9
)9 :
{ 
achievementManager &
[& '
$str' +
]+ ,
as- /
Achievement0 ;
,; <
achievementManager &
[& '
$str' +
]+ ,
as- /
Achievement0 ;
,; <
achievementManager &
[& '
$str' +
]+ ,
as- /
Achievement0 ;
,; <
achievementManager &
[& '
$str' *
]* +
as, .
Achievement/ :
,: ;
achievementManager &
[& '
$str' ,
], -
as. 0
Achievement1 <
,< =
achievementManager &
[& '
$str' *
]* +
as, .
Achievement/ :
,: ;
achievementManager &
[& '
$str' +
]+ ,
as- /
Achievement0 ;
,; <
achievementManager   &
[  & '
$str  ' +
]  + ,
as  - /
Achievement  0 ;
,  ; <
achievementManager!! &
[!!& '
$str!!' *
]!!* +
as!!, .
Achievement!!/ :
,!!: ;
achievementManager"" &
[""& '
$str""' +
]""+ ,
as""- /
Achievement""0 ;
}## 
;## 
battleshipsDatabase%% #
.%%# $"
AchievementsRepository%%$ :
.%%: ;

CreateMany%%; E
(%%E F
achievements%%F R
)%%R S
.%%S T
Wait%%T X
(%%X Y
)%%Y Z
;%%Z [
}&& 
}'' 	
private)) 
static)) 
void)) 
CloneAchievements)) -
())- .
AchievementManager)). @
achievementManager))A S
)))S T
{** 	
achievementManager++ 
[++ 
$str++ #
]++# $
=++% &
new++' *
Achievement+++ 6
{,, 
Id-- 
=-- 
Guid-- 
.-- 
Parse-- 
(--  
$str--  F
)--F G
,--G H
Name.. 
=.. 
$str.. $
,..$ %
Description// 
=// 
$str// >
,//> ?
RequiredAction00 
=00  
$str00! /
,00/ 0 
ActionPerformedCount11 $
=11% &
$num11' (
,11( )(
RequiredActionPerformedCount22 ,
=22- .
$num22/ 0
}33 
;33 
achievementManager55 
[55 
$str55 #
]55# $
=55% &
new55' *
Achievement55+ 6
{66 
Id77 
=77 
Guid77 
.77 
Parse77 
(77  
$str77  F
)77F G
,77G H
Name88 
=88 
$str88 "
,88" #
Description99 
=99 
$str99 4
,994 5
RequiredAction:: 
=::  
$str::! ,
,::, - 
ActionPerformedCount;; $
=;;% &
$num;;' (
,;;( )(
RequiredActionPerformedCount<< ,
=<<- .
$num<</ 0
}== 
;== 
achievementManager?? 
[?? 
$str?? #
]??# $
=??% &
new??' *
Achievement??+ 6
{@@ 
IdAA 
=AA 
GuidAA 
.AA 
ParseAA 
(AA  
$strAA  F
)AAF G
,AAG H
NameBB 
=BB 
$strBB  
,BB  !
DescriptionCC 
=CC 
$strCC M
,CCM N
RequiredActionDD 
=DD  
$strDD! @
,DD@ A 
ActionPerformedCountEE $
=EE% &
$numEE' (
,EE( )(
RequiredActionPerformedCountFF ,
=FF- .
$numFF/ 0
}GG 
;GG 
achievementManagerII 
[II 
$strII "
]II" #
=II$ %
newII& )
AchievementII* 5
{JJ 
IdKK 
=KK 
GuidKK 
.KK 
ParseKK 
(KK  
$strKK  F
)KKF G
,KKG H
NameLL 
=LL 
$strLL 
,LL 
DescriptionMM 
=MM 
$strMM B
,MMB C
RequiredActionNN 
=NN  
$strNN! 6
,NN6 7 
ActionPerformedCountOO $
=OO% &
$numOO' (
,OO( )(
RequiredActionPerformedCountPP ,
=PP- .
$numPP/ 0
}QQ 
;QQ 
achievementManagerSS 
[SS 
$strSS $
]SS$ %
=SS& '
newSS( +
AchievementSS, 7
{TT 
IdUU 
=UU 
GuidUU 
.UU 
ParseUU 
(UU  
$strUU  F
)UUF G
,UUG H
NameVV 
=VV 
$strVV "
,VV" #
DescriptionWW 
=WW 
$strWW F
,WWF G
RequiredActionXX 
=XX  
$strXX! .
,XX. / 
ActionPerformedCountYY $
=YY% &
$numYY' (
,YY( )(
RequiredActionPerformedCountZZ ,
=ZZ- .
$numZZ/ 0
}[[ 
;[[ 
achievementManager]] 
[]] 
$str]] "
]]]" #
=]]$ %
new]]& )
Achievement]]* 5
{^^ 
Id__ 
=__ 
Guid__ 
.__ 
Parse__ 
(__  
$str__  F
)__F G
,__G H
Name`` 
=`` 
$str`` 
,`` 
Descriptionaa 
=aa 
$straa G
,aaG H
RequiredActionbb 
=bb  
$strbb! /
,bb/ 0 
ActionPerformedCountcc $
=cc% &
$numcc' (
,cc( )(
RequiredActionPerformedCountdd ,
=dd- .
$numdd/ 0
}ee 
;ee 
achievementManagergg 
[gg 
$strgg #
]gg# $
=gg% &
newgg' *
Achievementgg+ 6
{hh 
Idii 
=ii 
Guidii 
.ii 
Parseii 
(ii  
$strii  F
)iiF G
,iiG H
Namejj 
=jj 
$strjj !
,jj! "
Descriptionkk 
=kk 
$strkk <
,kk< =
RequiredActionll 
=ll  
$strll! -
,ll- . 
ActionPerformedCountmm $
=mm% &
$nummm' (
,mm( )(
RequiredActionPerformedCountnn ,
=nn- .
$numnn/ 0
}oo 
;oo 
achievementManagerqq 
[qq 
$strqq #
]qq# $
=qq% &
newqq' *
Achievementqq+ 6
{rr 
Idss 
=ss 
Guidss 
.ss 
Parsess 
(ss  
$strss  F
)ssF G
,ssG H
Namett 
=tt 
$strtt  
,tt  !
Descriptionuu 
=uu 
$struu 6
,uu6 7
RequiredActionvv 
=vv  
$strvv! .
,vv. / 
ActionPerformedCountww $
=ww% &
$numww' (
,ww( )(
RequiredActionPerformedCountxx ,
=xx- .
$numxx/ 0
}yy 
;yy 
achievementManager{{ 
[{{ 
$str{{ "
]{{" #
={{$ %
new{{& )
Achievement{{* 5
{|| 
Id}} 
=}} 
Guid}} 
.}} 
Parse}} 
(}}  
$str}}  F
)}}F G
,}}G H
Name~~ 
=~~ 
$str~~  
,~~  !
Description 
= 
$str :
,: ;
RequiredAction
?? 
=
??  
$str
??! /
,
??/ 0"
ActionPerformedCount
?? $
=
??% &
$num
??' (
,
??( )*
RequiredActionPerformedCount
?? ,
=
??- .
$num
??/ 0
}
?? 
;
??  
achievementManager
?? 
[
?? 
$str
?? #
]
??# $
=
??% &
new
??' *
Achievement
??+ 6
{
?? 
Id
?? 
=
?? 
Guid
?? 
.
?? 
Parse
?? 
(
??  
$str
??  F
)
??F G
,
??G H
Name
?? 
=
?? 
$str
?? $
,
??$ %
Description
?? 
=
?? 
$str
?? .
,
??. /
RequiredAction
?? 
=
??  
$str
??! 1
,
??1 2"
ActionPerformedCount
?? $
=
??% &
$num
??' (
,
??( )*
RequiredActionPerformedCount
?? ,
=
??- .
$num
??/ 1
}
?? 
;
??  
achievementManager
?? 
[
?? 
$str
?? %
]
??% &
=
??' (
new
??) ,
Achievement
??- 8
{
?? 
Id
?? 
=
?? 
Guid
?? 
.
?? 
Parse
?? 
(
??  
$str
??  F
)
??F G
,
??G H
Name
?? 
=
?? 
$str
?? 
,
?? 
Description
?? 
=
?? 
$str
?? )
,
??) *
RequiredAction
?? 
=
??  
$str
??! .
,
??. /"
ActionPerformedCount
?? $
=
??% &
$num
??' +
,
??+ ,*
RequiredActionPerformedCount
?? ,
=
??- .
$num
??/ 0
}
?? 
;
?? 
}
?? 	
}
?? 
}?? ?
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

static 
class 

ShipSeeder "
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
}(( ?
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
} ?
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
} ?
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
} ?
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
} ?	
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
private 
readonly 
IShipAppearance (
_shipDecorator) 7
;7 8
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
3 4
	protected 
ShipDecorator 
(  
IShipAppearance  /
shipDecorator0 =
)= >
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
} ?
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
} ?
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
GameSessionRequestDto .
_dto/ 3
;3 4
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
dto	~ ?
)
? ?
{ 	
	_database 
= 
database  
;  !
_currentUserService 
=  !
currentUserService" 4
;4 5
this 
. 
_dto 
= 
dto 
; 
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
=   
_dto   "
.  " #
SettingsDto  # .
.  . /
ColumnCount  / :
,  : ;
RowCount!! 
=!! 
_dto!! 
.!!  
SettingsDto!!  +
.!!+ ,
RowCount!!, 4
,!!4 5
GameType"" 
="" 
_dto"" 
.""  
SettingsDto""  +
.""+ ,
GameType"", 4
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
;,, 
IGameSessionBuilder.. 
builder..  '
=..( )
new..* -
GameSessionBuilder... @
(..@ A
)..A B
;..B C
var00 
gameSession00 
=00 
builder00 %
.11 
WithIcon11 
(11 
_dto11 
.11 
Icon11 #
)11# $
.22 
WithName22 
(22 
_dto22 
.22 
Name22 #
)22# $
.33 
WithDateCreated33  
(33  !
DateTime33! )
.33) *
UtcNow33* 0
)330 1
.44 
WithSessionSettings44 $
(44$ %
gameSettings44% 1
)441 2
.55 
WithPlayers55 
(55 
players55 $
)55$ %
.66 

WithStatus66 
(66 
GameSessionStatus66 -
.66- .
Created66. 5
)665 6
.77 
Build77 
(77 
)77 
;77 
var99 
id99 
=99 
await99 
	_database99 $
.99$ %"
GameSessionsRepository99% ;
.99; <
Create99< B
(99B C
gameSession99C N
)99N O
;99O P
return;; 
id;; 
;;; 
}<< 	
}== 
}>> ?
<D:\dev\Battleships\Battleships\Facades\IGameSessionFacade.cs
	namespace 	
Battleships
 
. 
Facades 
{ 
public 

	interface 
IGameSessionFacade '
{ 
public 
Task 
< 
Guid 
> 
CreateGameSession +
(+ ,
), -
;- .
}		 
}

 ?
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
}		 ?

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
} ?
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
} ?
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
} ?
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
}%% ?
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
} ??
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
?? 
.
?? 

PrimaryKey
?? $
(
??$ %
$str
??% :
,
??: ;
x
??< =
=>
??> @
x
??A B
.
??B C
Id
??C E
)
??E F
;
??F G
table
?? 
.
?? 

ForeignKey
?? $
(
??$ %
name
?? 
:
?? 
$str
?? F
,
??F G
column
?? 
:
?? 
x
??  !
=>
??" $
x
??% &
.
??& '
RoleId
??' -
,
??- .
principalTable
?? &
:
??& '
$str
??( 5
,
??5 6
principalColumn
?? '
:
??' (
$str
??) -
,
??- .
onDelete
??  
:
??  !
ReferentialAction
??" 3
.
??3 4
Cascade
??4 ;
)
??; <
;
??< =
}
?? 
)
?? 
;
?? 
migrationBuilder
?? 
.
?? 
CreateTable
?? (
(
??( )
name
?? 
:
?? 
$str
?? +
,
??+ ,
columns
?? 
:
?? 
table
?? 
=>
?? !
new
??" %
{
?? 
Id
?? 
=
?? 
table
?? 
.
?? 
Column
?? %
<
??% &
Guid
??& *
>
??* +
(
??+ ,
type
??, 0
:
??0 1
$str
??2 8
,
??8 9
nullable
??: B
:
??B C
false
??D I
)
??I J
,
??J K
GameSessionId
?? !
=
??" #
table
??$ )
.
??) *
Column
??* 0
<
??0 1
Guid
??1 5
>
??5 6
(
??6 7
type
??7 ;
:
??; <
$str
??= C
,
??C D
nullable
??E M
:
??M N
false
??O T
)
??T U
,
??U V
GridSize
?? 
=
?? 
table
?? $
.
??$ %
Column
??% +
<
??+ ,
string
??, 2
>
??2 3
(
??3 4
type
??4 8
:
??8 9
$str
??: @
,
??@ A
nullable
??B J
:
??J K
true
??L P
)
??P Q
,
??Q R
GameType
?? 
=
?? 
table
?? $
.
??$ %
Column
??% +
<
??+ ,
int
??, /
>
??/ 0
(
??0 1
type
??1 5
:
??5 6
$str
??7 @
,
??@ A
nullable
??B J
:
??J K
false
??L Q
)
??Q R
,
??R S

RoundCount
?? 
=
??  
table
??! &
.
??& '
Column
??' -
<
??- .
int
??. 1
>
??1 2
(
??2 3
type
??3 7
:
??7 8
$str
??9 B
,
??B C
nullable
??D L
:
??L M
false
??N S
)
??S T
,
??T U%
DestroyedShipPercentage
?? +
=
??, -
table
??. 3
.
??3 4
Column
??4 :
<
??: ;
int
??; >
>
??> ?
(
??? @
type
??@ D
:
??D E
$str
??F O
,
??O P
nullable
??Q Y
:
??Y Z
false
??[ `
)
??` a
}
?? 
,
?? 
constraints
?? 
:
?? 
table
?? "
=>
??# %
{
?? 
table
?? 
.
?? 

PrimaryKey
?? $
(
??$ %
$str
??% =
,
??= >
x
??? @
=>
??A C
x
??D E
.
??E F
Id
??F H
)
??H I
;
??I J
table
?? 
.
?? 

ForeignKey
?? $
(
??$ %
name
?? 
:
?? 
$str
?? P
,
??P Q
column
?? 
:
?? 
x
??  !
=>
??" $
x
??% &
.
??& '
GameSessionId
??' 4
,
??4 5
principalTable
?? &
:
??& '
$str
??( 5
,
??5 6
principalColumn
?? '
:
??' (
$str
??) -
,
??- .
onDelete
??  
:
??  !
ReferentialAction
??" 3
.
??3 4
Cascade
??4 ;
)
??; <
;
??< =
}
?? 
)
?? 
;
?? 
migrationBuilder
?? 
.
?? 
CreateTable
?? (
(
??( )
name
?? 
:
?? 
$str
?? (
,
??( )
columns
?? 
:
?? 
table
?? 
=>
?? !
new
??" %
{
?? 
Id
?? 
=
?? 
table
?? 
.
?? 
Column
?? %
<
??% &
int
??& )
>
??) *
(
??* +
type
??+ /
:
??/ 0
$str
??1 :
,
??: ;
nullable
??< D
:
??D E
false
??F K
)
??K L
.
?? 

Annotation
?? #
(
??# $
$str
??$ D
,
??D E+
NpgsqlValueGenerationStrategy
??F c
.
??c d%
IdentityByDefaultColumn
??d {
)
??{ |
,
??| }
UserId
?? 
=
?? 
table
?? "
.
??" #
Column
??# )
<
??) *
string
??* 0
>
??0 1
(
??1 2
type
??2 6
:
??6 7
$str
??8 >
,
??> ?
nullable
??@ H
:
??H I
false
??J O
)
??O P
,
??P Q
	ClaimType
?? 
=
?? 
table
??  %
.
??% &
Column
??& ,
<
??, -
string
??- 3
>
??3 4
(
??4 5
type
??5 9
:
??9 :
$str
??; A
,
??A B
nullable
??C K
:
??K L
true
??M Q
)
??Q R
,
??R S

ClaimValue
?? 
=
??  
table
??! &
.
??& '
Column
??' -
<
??- .
string
??. 4
>
??4 5
(
??5 6
type
??6 :
:
??: ;
$str
??< B
,
??B C
nullable
??D L
:
??L M
true
??N R
)
??R S
}
?? 
,
?? 
constraints
?? 
:
?? 
table
?? "
=>
??# %
{
?? 
table
?? 
.
?? 

PrimaryKey
?? $
(
??$ %
$str
??% :
,
??: ;
x
??< =
=>
??> @
x
??A B
.
??B C
Id
??C E
)
??E F
;
??F G
table
?? 
.
?? 

ForeignKey
?? $
(
??$ %
name
?? 
:
?? 
$str
?? F
,
??F G
column
?? 
:
?? 
x
??  !
=>
??" $
x
??% &
.
??& '
UserId
??' -
,
??- .
principalTable
?? &
:
??& '
$str
??( 5
,
??5 6
principalColumn
?? '
:
??' (
$str
??) -
,
??- .
onDelete
??  
:
??  !
ReferentialAction
??" 3
.
??3 4
Cascade
??4 ;
)
??; <
;
??< =
}
?? 
)
?? 
;
?? 
migrationBuilder
?? 
.
?? 
CreateTable
?? (
(
??( )
name
?? 
:
?? 
$str
?? (
,
??( )
columns
?? 
:
?? 
table
?? 
=>
?? !
new
??" %
{
?? 
LoginProvider
?? !
=
??" #
table
??$ )
.
??) *
Column
??* 0
<
??0 1
string
??1 7
>
??7 8
(
??8 9
type
??9 =
:
??= >
$str
??? W
,
??W X
	maxLength
??Y b
:
??b c
$num
??d g
,
??g h
nullable
??i q
:
??q r
false
??s x
)
??x y
,
??y z
ProviderKey
?? 
=
??  !
table
??" '
.
??' (
Column
??( .
<
??. /
string
??/ 5
>
??5 6
(
??6 7
type
??7 ;
:
??; <
$str
??= U
,
??U V
	maxLength
??W `
:
??` a
$num
??b e
,
??e f
nullable
??g o
:
??o p
false
??q v
)
??v w
,
??w x!
ProviderDisplayName
?? '
=
??( )
table
??* /
.
??/ 0
Column
??0 6
<
??6 7
string
??7 =
>
??= >
(
??> ?
type
??? C
:
??C D
$str
??E K
,
??K L
nullable
??M U
:
??U V
true
??W [
)
??[ \
,
??\ ]
UserId
?? 
=
?? 
table
?? "
.
??" #
Column
??# )
<
??) *
string
??* 0
>
??0 1
(
??1 2
type
??2 6
:
??6 7
$str
??8 >
,
??> ?
nullable
??@ H
:
??H I
false
??J O
)
??O P
}
?? 
,
?? 
constraints
?? 
:
?? 
table
?? "
=>
??# %
{
?? 
table
?? 
.
?? 

PrimaryKey
?? $
(
??$ %
$str
??% :
,
??: ;
x
??< =
=>
??> @
new
??A D
{
??E F
x
??G H
.
??H I
LoginProvider
??I V
,
??V W
x
??X Y
.
??Y Z
ProviderKey
??Z e
}
??f g
)
??g h
;
??h i
table
?? 
.
?? 

ForeignKey
?? $
(
??$ %
name
?? 
:
?? 
$str
?? F
,
??F G
column
?? 
:
?? 
x
??  !
=>
??" $
x
??% &
.
??& '
UserId
??' -
,
??- .
principalTable
?? &
:
??& '
$str
??( 5
,
??5 6
principalColumn
?? '
:
??' (
$str
??) -
,
??- .
onDelete
??  
:
??  !
ReferentialAction
??" 3
.
??3 4
Cascade
??4 ;
)
??; <
;
??< =
}
?? 
)
?? 
;
?? 
migrationBuilder
?? 
.
?? 
CreateTable
?? (
(
??( )
name
?? 
:
?? 
$str
?? '
,
??' (
columns
?? 
:
?? 
table
?? 
=>
?? !
new
??" %
{
?? 
UserId
?? 
=
?? 
table
?? "
.
??" #
Column
??# )
<
??) *
string
??* 0
>
??0 1
(
??1 2
type
??2 6
:
??6 7
$str
??8 >
,
??> ?
nullable
??@ H
:
??H I
false
??J O
)
??O P
,
??P Q
RoleId
?? 
=
?? 
table
?? "
.
??" #
Column
??# )
<
??) *
string
??* 0
>
??0 1
(
??1 2
type
??2 6
:
??6 7
$str
??8 >
,
??> ?
nullable
??@ H
:
??H I
false
??J O
)
??O P
}
?? 
,
?? 
constraints
?? 
:
?? 
table
?? "
=>
??# %
{
?? 
table
?? 
.
?? 

PrimaryKey
?? $
(
??$ %
$str
??% 9
,
??9 :
x
??; <
=>
??= ?
new
??@ C
{
??D E
x
??F G
.
??G H
UserId
??H N
,
??N O
x
??P Q
.
??Q R
RoleId
??R X
}
??Y Z
)
??Z [
;
??[ \
table
?? 
.
?? 

ForeignKey
?? $
(
??$ %
name
?? 
:
?? 
$str
?? E
,
??E F
column
?? 
:
?? 
x
??  !
=>
??" $
x
??% &
.
??& '
RoleId
??' -
,
??- .
principalTable
?? &
:
??& '
$str
??( 5
,
??5 6
principalColumn
?? '
:
??' (
$str
??) -
,
??- .
onDelete
??  
:
??  !
ReferentialAction
??" 3
.
??3 4
Cascade
??4 ;
)
??; <
;
??< =
table
?? 
.
?? 

ForeignKey
?? $
(
??$ %
name
?? 
:
?? 
$str
?? E
,
??E F
column
?? 
:
?? 
x
??  !
=>
??" $
x
??% &
.
??& '
UserId
??' -
,
??- .
principalTable
?? &
:
??& '
$str
??( 5
,
??5 6
principalColumn
?? '
:
??' (
$str
??) -
,
??- .
onDelete
??  
:
??  !
ReferentialAction
??" 3
.
??3 4
Cascade
??4 ;
)
??; <
;
??< =
}
?? 
)
?? 
;
?? 
migrationBuilder
?? 
.
?? 
CreateTable
?? (
(
??( )
name
?? 
:
?? 
$str
?? (
,
??( )
columns
?? 
:
?? 
table
?? 
=>
?? !
new
??" %
{
?? 
UserId
?? 
=
?? 
table
?? "
.
??" #
Column
??# )
<
??) *
string
??* 0
>
??0 1
(
??1 2
type
??2 6
:
??6 7
$str
??8 >
,
??> ?
nullable
??@ H
:
??H I
false
??J O
)
??O P
,
??P Q
LoginProvider
?? !
=
??" #
table
??$ )
.
??) *
Column
??* 0
<
??0 1
string
??1 7
>
??7 8
(
??8 9
type
??9 =
:
??= >
$str
??? W
,
??W X
	maxLength
??Y b
:
??b c
$num
??d g
,
??g h
nullable
??i q
:
??q r
false
??s x
)
??x y
,
??y z
Name
?? 
=
?? 
table
??  
.
??  !
Column
??! '
<
??' (
string
??( .
>
??. /
(
??/ 0
type
??0 4
:
??4 5
$str
??6 N
,
??N O
	maxLength
??P Y
:
??Y Z
$num
??[ ^
,
??^ _
nullable
??` h
:
??h i
false
??j o
)
??o p
,
??p q
Value
?? 
=
?? 
table
?? !
.
??! "
Column
??" (
<
??( )
string
??) /
>
??/ 0
(
??0 1
type
??1 5
:
??5 6
$str
??7 =
,
??= >
nullable
??? G
:
??G H
true
??I M
)
??M N
}
?? 
,
?? 
constraints
?? 
:
?? 
table
?? "
=>
??# %
{
?? 
table
?? 
.
?? 

PrimaryKey
?? $
(
??$ %
$str
??% :
,
??: ;
x
??< =
=>
??> @
new
??A D
{
??E F
x
??G H
.
??H I
UserId
??I O
,
??O P
x
??Q R
.
??R S
LoginProvider
??S `
,
??` a
x
??b c
.
??c d
Name
??d h
}
??i j
)
??j k
;
??k l
table
?? 
.
?? 

ForeignKey
?? $
(
??$ %
name
?? 
:
?? 
$str
?? F
,
??F G
column
?? 
:
?? 
x
??  !
=>
??" $
x
??% &
.
??& '
UserId
??' -
,
??- .
principalTable
?? &
:
??& '
$str
??( 5
,
??5 6
principalColumn
?? '
:
??' (
$str
??) -
,
??- .
onDelete
??  
:
??  !
ReferentialAction
??" 3
.
??3 4
Cascade
??4 ;
)
??; <
;
??< =
}
?? 
)
?? 
;
?? 
migrationBuilder
?? 
.
?? 
CreateTable
?? (
(
??( )
name
?? 
:
?? 
$str
?? 
,
?? 
columns
?? 
:
?? 
table
?? 
=>
?? !
new
??" %
{
?? 
Id
?? 
=
?? 
table
?? 
.
?? 
Column
?? %
<
??% &
Guid
??& *
>
??* +
(
??+ ,
type
??, 0
:
??0 1
$str
??2 8
,
??8 9
nullable
??: B
:
??B C
false
??D I
)
??I J
,
??J K
GameSessionId
?? !
=
??" #
table
??$ )
.
??) *
Column
??* 0
<
??0 1
Guid
??1 5
>
??5 6
(
??6 7
type
??7 ;
:
??; <
$str
??= C
,
??C D
nullable
??E M
:
??M N
false
??O T
)
??T U
,
??U V
IsHost
?? 
=
?? 
table
?? "
.
??" #
Column
??# )
<
??) *
bool
??* .
>
??. /
(
??/ 0
type
??0 4
:
??4 5
$str
??6 ?
,
??? @
nullable
??A I
:
??I J
false
??K P
)
??P Q
,
??Q R
UserId
?? 
=
?? 
table
?? "
.
??" #
Column
??# )
<
??) *
string
??* 0
>
??0 1
(
??1 2
type
??2 6
:
??6 7
$str
??8 >
,
??> ?
nullable
??@ H
:
??H I
true
??J N
)
??N O
}
?? 
,
?? 
constraints
?? 
:
?? 
table
?? "
=>
??# %
{
?? 
table
?? 
.
?? 

PrimaryKey
?? $
(
??$ %
$str
??% 0
,
??0 1
x
??2 3
=>
??4 6
x
??7 8
.
??8 9
Id
??9 ;
)
??; <
;
??< =
table
?? 
.
?? 

ForeignKey
?? $
(
??$ %
name
?? 
:
?? 
$str
?? <
,
??< =
column
?? 
:
?? 
x
??  !
=>
??" $
x
??% &
.
??& '
UserId
??' -
,
??- .
principalTable
?? &
:
??& '
$str
??( 5
,
??5 6
principalColumn
?? '
:
??' (
$str
??) -
)
??- .
;
??. /
table
?? 
.
?? 

ForeignKey
?? $
(
??$ %
name
?? 
:
?? 
$str
?? C
,
??C D
column
?? 
:
?? 
x
??  !
=>
??" $
x
??% &
.
??& '
GameSessionId
??' 4
,
??4 5
principalTable
?? &
:
??& '
$str
??( 5
,
??5 6
principalColumn
?? '
:
??' (
$str
??) -
,
??- .
onDelete
??  
:
??  !
ReferentialAction
??" 3
.
??3 4
Cascade
??4 ;
)
??; <
;
??< =
}
?? 
)
?? 
;
?? 
migrationBuilder
?? 
.
?? 
CreateTable
?? (
(
??( )
name
?? 
:
?? 
$str
?? '
,
??' (
columns
?? 
:
?? 
table
?? 
=>
?? !
new
??" %
{
?? 
Id
?? 
=
?? 
table
?? 
.
?? 
Column
?? %
<
??% &
Guid
??& *
>
??* +
(
??+ ,
type
??, 0
:
??0 1
$str
??2 8
,
??8 9
nullable
??: B
:
??B C
false
??D I
)
??I J
,
??J K
AchievementId
?? !
=
??" #
table
??$ )
.
??) *
Column
??* 0
<
??0 1
Guid
??1 5
>
??5 6
(
??6 7
type
??7 ;
:
??; <
$str
??= C
,
??C D
nullable
??E M
:
??M N
false
??O T
)
??T U
,
??U V
UserId
?? 
=
?? 
table
?? "
.
??" #
Column
??# )
<
??) *
string
??* 0
>
??0 1
(
??1 2
type
??2 6
:
??6 7
$str
??8 >
,
??> ?
nullable
??@ H
:
??H I
true
??J N
)
??N O
}
?? 
,
?? 
constraints
?? 
:
?? 
table
?? "
=>
??# %
{
?? 
table
?? 
.
?? 

PrimaryKey
?? $
(
??$ %
$str
??% 9
,
??9 :
x
??; <
=>
??= ?
x
??@ A
.
??A B
Id
??B D
)
??D E
;
??E F
table
?? 
.
?? 

ForeignKey
?? $
(
??$ %
name
?? 
:
?? 
$str
?? M
,
??M N
column
?? 
:
?? 
x
??  !
=>
??" $
x
??% &
.
??& '
AchievementId
??' 4
,
??4 5
principalTable
?? &
:
??& '
$str
??( 6
,
??6 7
principalColumn
?? '
:
??' (
$str
??) -
,
??- .
onDelete
??  
:
??  !
ReferentialAction
??" 3
.
??3 4
Cascade
??4 ;
)
??; <
;
??< =
table
?? 
.
?? 

ForeignKey
?? $
(
??$ %
name
?? 
:
?? 
$str
?? E
,
??E F
column
?? 
:
?? 
x
??  !
=>
??" $
x
??% &
.
??& '
UserId
??' -
,
??- .
principalTable
?? &
:
??& '
$str
??( 5
,
??5 6
principalColumn
?? '
:
??' (
$str
??) -
)
??- .
;
??. /
}
?? 
)
?? 
;
?? 
migrationBuilder
?? 
.
?? 
CreateTable
?? (
(
??( )
name
?? 
:
?? 
$str
?? $
,
??$ %
columns
?? 
:
?? 
table
?? 
=>
?? !
new
??" %
{
?? 
Id
?? 
=
?? 
table
?? 
.
?? 
Column
?? %
<
??% &
Guid
??& *
>
??* +
(
??+ ,
type
??, 0
:
??0 1
$str
??2 8
,
??8 9
nullable
??: B
:
??B C
false
??D I
)
??I J
,
??J K
Name
?? 
=
?? 
table
??  
.
??  !
Column
??! '
<
??' (
string
??( .
>
??. /
(
??/ 0
type
??0 4
:
??4 5
$str
??6 <
,
??< =
nullable
??> F
:
??F G
true
??H L
)
??L M
,
??M N
Description
?? 
=
??  !
table
??" '
.
??' (
Column
??( .
<
??. /
string
??/ 5
>
??5 6
(
??6 7
type
??7 ;
:
??; <
$str
??= C
,
??C D
nullable
??E M
:
??M N
true
??O S
)
??S T
,
??T U
UserId
?? 
=
?? 
table
?? "
.
??" #
Column
??# )
<
??) *
string
??* 0
>
??0 1
(
??1 2
type
??2 6
:
??6 7
$str
??8 >
,
??> ?
nullable
??@ H
:
??H I
true
??J N
)
??N O
,
??O P
ShipId
?? 
=
?? 
table
?? "
.
??" #
Column
??# )
<
??) *
Guid
??* .
>
??. /
(
??/ 0
type
??0 4
:
??4 5
$str
??6 <
,
??< =
nullable
??> F
:
??F G
true
??H L
)
??L M
}
?? 
,
?? 
constraints
?? 
:
?? 
table
?? "
=>
??# %
{
?? 
table
?? 
.
?? 

PrimaryKey
?? $
(
??$ %
$str
??% 6
,
??6 7
x
??8 9
=>
??: <
x
??= >
.
??> ?
Id
??? A
)
??A B
;
??B C
table
?? 
.
?? 

ForeignKey
?? $
(
??$ %
name
?? 
:
?? 
$str
?? B
,
??B C
column
?? 
:
?? 
x
??  !
=>
??" $
x
??% &
.
??& '
UserId
??' -
,
??- .
principalTable
?? &
:
??& '
$str
??( 5
,
??5 6
principalColumn
?? '
:
??' (
$str
??) -
)
??- .
;
??. /
table
?? 
.
?? 

ForeignKey
?? $
(
??$ %
name
?? 
:
?? 
$str
?? ;
,
??; <
column
?? 
:
?? 
x
??  !
=>
??" $
x
??% &
.
??& '
ShipId
??' -
,
??- .
principalTable
?? &
:
??& '
$str
??( .
,
??. /
principalColumn
?? '
:
??' (
$str
??) -
)
??- .
;
??. /
}
?? 
)
?? 
;
?? 
migrationBuilder
?? 
.
?? 
CreateTable
?? (
(
??( )
name
?? 
:
?? 
$str
?? "
,
??" #
columns
?? 
:
?? 
table
?? 
=>
?? !
new
??" %
{
?? 
Id
?? 
=
?? 
table
?? 
.
?? 
Column
?? %
<
??% &
Guid
??& *
>
??* +
(
??+ ,
type
??, 0
:
??0 1
$str
??2 8
,
??8 9
nullable
??: B
:
??B C
false
??D I
)
??I J
,
??J K
PlayerId
?? 
=
?? 
table
?? $
.
??$ %
Column
??% +
<
??+ ,
Guid
??, 0
>
??0 1
(
??1 2
type
??2 6
:
??6 7
$str
??8 >
,
??> ?
nullable
??@ H
:
??H I
false
??J O
)
??O P
,
??P Q
ShipId
?? 
=
?? 
table
?? "
.
??" #
Column
??# )
<
??) *
Guid
??* .
>
??. /
(
??/ 0
type
??0 4
:
??4 5
$str
??6 <
,
??< =
nullable
??> F
:
??F G
false
??H M
)
??M N
}
?? 
,
?? 
constraints
?? 
:
?? 
table
?? "
=>
??# %
{
?? 
table
?? 
.
?? 

PrimaryKey
?? $
(
??$ %
$str
??% 4
,
??4 5
x
??6 7
=>
??8 :
x
??; <
.
??< =
Id
??= ?
)
??? @
;
??@ A
table
?? 
.
?? 

ForeignKey
?? $
(
??$ %
name
?? 
:
?? 
$str
?? =
,
??= >
column
?? 
:
?? 
x
??  !
=>
??" $
x
??% &
.
??& '
PlayerId
??' /
,
??/ 0
principalTable
?? &
:
??& '
$str
??( 0
,
??0 1
principalColumn
?? '
:
??' (
$str
??) -
,
??- .
onDelete
??  
:
??  !
ReferentialAction
??" 3
.
??3 4
Cascade
??4 ;
)
??; <
;
??< =
table
?? 
.
?? 

ForeignKey
?? $
(
??$ %
name
?? 
:
?? 
$str
?? 9
,
??9 :
column
?? 
:
?? 
x
??  !
=>
??" $
x
??% &
.
??& '
ShipId
??' -
,
??- .
principalTable
?? &
:
??& '
$str
??( .
,
??. /
principalColumn
?? '
:
??' (
$str
??) -
,
??- .
onDelete
??  
:
??  !
ReferentialAction
??" 3
.
??3 4
Cascade
??4 ;
)
??; <
;
??< =
}
?? 
)
?? 
;
?? 
migrationBuilder
?? 
.
?? 
CreateTable
?? (
(
??( )
name
?? 
:
?? 
$str
??  
,
??  !
columns
?? 
:
?? 
table
?? 
=>
?? !
new
??" %
{
?? 
Id
?? 
=
?? 
table
?? 
.
?? 
Column
?? %
<
??% &
Guid
??& *
>
??* +
(
??+ ,
type
??, 0
:
??0 1
$str
??2 8
,
??8 9
nullable
??: B
:
??B C
false
??D I
)
??I J
,
??J K
XCoordinate
?? 
=
??  !
table
??" '
.
??' (
Column
??( .
<
??. /
int
??/ 2
>
??2 3
(
??3 4
type
??4 8
:
??8 9
$str
??: C
,
??C D
nullable
??E M
:
??M N
false
??O T
)
??T U
,
??U V
YCoordinate
?? 
=
??  !
table
??" '
.
??' (
Column
??( .
<
??. /
int
??/ 2
>
??2 3
(
??3 4
type
??4 8
:
??8 9
$str
??: C
,
??C D
nullable
??E M
:
??M N
false
??O T
)
??T U
,
??U V
IsDestroyed
?? 
=
??  !
table
??" '
.
??' (
Column
??( .
<
??. /
bool
??/ 3
>
??3 4
(
??4 5
type
??5 9
:
??9 :
$str
??; D
,
??D E
nullable
??F N
:
??N O
false
??P U
)
??U V
,
??V W
PlayerShipId
??  
=
??! "
table
??# (
.
??( )
Column
??) /
<
??/ 0
Guid
??0 4
>
??4 5
(
??5 6
type
??6 :
:
??: ;
$str
??< B
,
??B C
nullable
??D L
:
??L M
false
??N S
)
??S T
}
?? 
,
?? 
constraints
?? 
:
?? 
table
?? "
=>
??# %
{
?? 
table
?? 
.
?? 

PrimaryKey
?? $
(
??$ %
$str
??% 2
,
??2 3
x
??4 5
=>
??6 8
x
??9 :
.
??: ;
Id
??; =
)
??= >
;
??> ?
table
?? 
.
?? 

ForeignKey
?? $
(
??$ %
name
?? 
:
?? 
$str
?? C
,
??C D
column
?? 
:
?? 
x
??  !
=>
??" $
x
??% &
.
??& '
PlayerShipId
??' 3
,
??3 4
principalTable
?? &
:
??& '
$str
??( 4
,
??4 5
principalColumn
?? '
:
??' (
$str
??) -
,
??- .
onDelete
??  
:
??  !
ReferentialAction
??" 3
.
??3 4
Cascade
??4 ;
)
??; <
;
??< =
}
?? 
)
?? 
;
?? 
migrationBuilder
?? 
.
?? 

InsertData
?? '
(
??' (
table
?? 
:
?? 
$str
?? %
,
??% &
columns
?? 
:
?? 
new
?? 
[
?? 
]
?? 
{
??  
$str
??! %
,
??% &
$str
??' =
,
??= >
$str
??? L
,
??L M
$str
??N T
,
??T U
$str
??V f
,
??f g
$str??h ?
}??? ?
,??? ?
values
?? 
:
?? 
new
?? 
object
?? "
[
??" #
,
??# $
]
??$ %
{
?? 
{
?? 
new
?? 
Guid
?? 
(
?? 
$str
?? E
)
??E F
,
??F G
$num
??H I
,
??I J
$str
??K z
,
??z {
$str??| ?
,??? ?
$str??? ?
,??? ?
$num??? ?
}??? ?
,??? ?
{
?? 
new
?? 
Guid
?? 
(
?? 
$str
?? E
)
??E F
,
??F G
$num
??H I
,
??I J
$str
??K c
,
??c d
$str
??e n
,
??n o
$str
??p }
,
??} ~
$num?? ?
}??? ?
,??? ?
{
?? 
new
?? 
Guid
?? 
(
?? 
$str
?? E
)
??E F
,
??F G
$num
??H I
,
??I J
$str
??K t
,
??t u
$str
??v }
,
??} ~
$str?? ?
,??? ?
$num??? ?
}??? ?
,??? ?
{
?? 
new
?? 
Guid
?? 
(
?? 
$str
?? E
)
??E F
,
??F G
$num
??H I
,
??I J
$str
??K [
,
??[ \
$str
??] j
,
??j k
$str
??l |
,
??| }
$num??~ ?
}??? ?
,??? ?
{
?? 
new
?? 
Guid
?? 
(
?? 
$str
?? E
)
??E F
,
??F G
$num
??H I
,
??I J
$str
??K i
,
??i j
$str
??k u
,
??u v
$str??w ?
,??? ?
$num??? ?
}??? ?
,??? ?
{
?? 
new
?? 
Guid
?? 
(
?? 
$str
?? E
)
??E F
,
??F G
$num
??H I
,
??I J
$str
??K k
,
??k l
$str
??m z
,
??z {
$str??| ?
,??? ?
$num??? ?
}??? ?
,??? ?
{
?? 
new
?? 
Guid
?? 
(
?? 
$str
?? E
)
??E F
,
??F G
$num
??H I
,
??I J
$str
??K s
,
??s t
$str??u ?
,??? ?
$str??? ?
,??? ?
$num??? ?
}??? ?
,??? ?
{
?? 
new
?? 
Guid
?? 
(
?? 
$str
?? E
)
??E F
,
??F G
$num
??H I
,
??I J
$str
??K a
,
??a b
$str
??c n
,
??n o
$str
??p {
,
??{ |
$num
??} ~
}?? ?
,??? ?
{
?? 
new
?? 
Guid
?? 
(
?? 
$str
?? E
)
??E F
,
??F G
$num
??H I
,
??I J
$str
??K o
,
??o p
$str
??q w
,
??w x
$str??y ?
,??? ?
$num??? ?
}??? ?
,??? ?
{
?? 
new
?? 
Guid
?? 
(
?? 
$str
?? E
)
??E F
,
??F G
$num
??H I
,
??I J
$str
??K g
,
??g h
$str
??i r
,
??r s
$str??t ?
,??? ?
$num??? ?
}??? ?
}
?? 
)
?? 
;
?? 
migrationBuilder
?? 
.
?? 
CreateIndex
?? (
(
??( )
name
?? 
:
?? 
$str
?? 2
,
??2 3
table
?? 
:
?? 
$str
?? )
,
??) *
column
?? 
:
?? 
$str
??  
)
??  !
;
??! "
migrationBuilder
?? 
.
?? 
CreateIndex
?? (
(
??( )
name
?? 
:
?? 
$str
?? %
,
??% &
table
?? 
:
?? 
$str
?? $
,
??$ %
column
?? 
:
?? 
$str
?? (
,
??( )
unique
?? 
:
?? 
true
?? 
)
?? 
;
?? 
migrationBuilder
?? 
.
?? 
CreateIndex
?? (
(
??( )
name
?? 
:
?? 
$str
?? 2
,
??2 3
table
?? 
:
?? 
$str
?? )
,
??) *
column
?? 
:
?? 
$str
??  
)
??  !
;
??! "
migrationBuilder
?? 
.
?? 
CreateIndex
?? (
(
??( )
name
?? 
:
?? 
$str
?? 2
,
??2 3
table
?? 
:
?? 
$str
?? )
,
??) *
column
?? 
:
?? 
$str
??  
)
??  !
;
??! "
migrationBuilder
?? 
.
?? 
CreateIndex
?? (
(
??( )
name
?? 
:
?? 
$str
?? 1
,
??1 2
table
?? 
:
?? 
$str
?? (
,
??( )
column
?? 
:
?? 
$str
??  
)
??  !
;
??! "
migrationBuilder
?? 
.
?? 
CreateIndex
?? (
(
??( )
name
?? 
:
?? 
$str
?? "
,
??" #
table
?? 
:
?? 
$str
?? $
,
??$ %
column
?? 
:
?? 
$str
?? )
)
??) *
;
??* +
migrationBuilder
?? 
.
?? 
CreateIndex
?? (
(
??( )
name
?? 
:
?? 
$str
?? 4
,
??4 5
table
?? 
:
?? 
$str
?? $
,
??$ %
column
?? 
:
?? 
$str
?? '
)
??' (
;
??( )
migrationBuilder
?? 
.
?? 
CreateIndex
?? (
(
??( )
name
?? 
:
?? 
$str
?? %
,
??% &
table
?? 
:
?? 
$str
?? $
,
??$ %
column
?? 
:
?? 
$str
?? ,
,
??, -
unique
?? 
:
?? 
true
?? 
)
?? 
;
?? 
migrationBuilder
?? 
.
?? 
CreateIndex
?? (
(
??( )
name
?? 
:
?? 
$str
?? <
,
??< =
table
?? 
:
?? 
$str
?? ,
,
??, -
column
?? 
:
?? 
$str
?? '
,
??' (
unique
?? 
:
?? 
true
?? 
)
?? 
;
?? 
migrationBuilder
?? 
.
?? 
CreateIndex
?? (
(
??( )
name
?? 
:
?? 
$str
?? /
,
??/ 0
table
?? 
:
?? 
$str
?? 
,
??  
column
?? 
:
?? 
$str
?? '
)
??' (
;
??( )
migrationBuilder
?? 
.
?? 
CreateIndex
?? (
(
??( )
name
?? 
:
?? 
$str
?? (
,
??( )
table
?? 
:
?? 
$str
?? 
,
??  
column
?? 
:
?? 
$str
??  
)
??  !
;
??! "
migrationBuilder
?? 
.
?? 
CreateIndex
?? (
(
??( )
name
?? 
:
?? 
$str
?? .
,
??. /
table
?? 
:
?? 
$str
?? #
,
??# $
column
?? 
:
?? 
$str
?? "
)
??" #
;
??# $
migrationBuilder
?? 
.
?? 
CreateIndex
?? (
(
??( )
name
?? 
:
?? 
$str
?? ,
,
??, -
table
?? 
:
?? 
$str
?? #
,
??# $
column
?? 
:
?? 
$str
??  
)
??  !
;
??! "
migrationBuilder
?? 
.
?? 
CreateIndex
?? (
(
??( )
name
?? 
:
?? 
$str
?? 0
,
??0 1
table
?? 
:
?? 
$str
?? !
,
??! "
column
?? 
:
?? 
$str
?? &
)
??& '
;
??' (
migrationBuilder
?? 
.
?? 
CreateIndex
?? (
(
??( )
name
?? 
:
?? 
$str
?? 8
,
??8 9
table
?? 
:
?? 
$str
?? (
,
??( )
column
?? 
:
?? 
$str
?? '
)
??' (
;
??( )
migrationBuilder
?? 
.
?? 
CreateIndex
?? (
(
??( )
name
?? 
:
?? 
$str
?? 1
,
??1 2
table
?? 
:
?? 
$str
?? (
,
??( )
column
?? 
:
?? 
$str
??  
)
??  !
;
??! "
migrationBuilder
?? 
.
?? 
CreateIndex
?? (
(
??( )
name
?? 
:
?? 
$str
?? .
,
??. /
table
?? 
:
?? 
$str
?? %
,
??% &
column
?? 
:
?? 
$str
??  
)
??  !
;
??! "
migrationBuilder
?? 
.
?? 
CreateIndex
?? (
(
??( )
name
?? 
:
?? 
$str
?? .
,
??. /
table
?? 
:
?? 
$str
?? %
,
??% &
column
?? 
:
?? 
$str
??  
)
??  !
;
??! "
}
?? 	
	protected
?? 
override
?? 
void
?? 
Down
??  $
(
??$ %
MigrationBuilder
??% 5
migrationBuilder
??6 F
)
??F G
{
?? 	
migrationBuilder
?? 
.
?? 
	DropTable
?? &
(
??& '
name
?? 
:
?? 
$str
?? (
)
??( )
;
??) *
migrationBuilder
?? 
.
?? 
	DropTable
?? &
(
??& '
name
?? 
:
?? 
$str
?? (
)
??( )
;
??) *
migrationBuilder
?? 
.
?? 
	DropTable
?? &
(
??& '
name
?? 
:
?? 
$str
?? (
)
??( )
;
??) *
migrationBuilder
?? 
.
?? 
	DropTable
?? &
(
??& '
name
?? 
:
?? 
$str
?? '
)
??' (
;
??( )
migrationBuilder
?? 
.
?? 
	DropTable
?? &
(
??& '
name
?? 
:
?? 
$str
?? (
)
??( )
;
??) *
migrationBuilder
?? 
.
?? 
	DropTable
?? &
(
??& '
name
?? 
:
?? 
$str
?? 
)
??  
;
??  !
migrationBuilder
?? 
.
?? 
	DropTable
?? &
(
??& '
name
?? 
:
?? 
$str
?? +
)
??+ ,
;
??, -
migrationBuilder
?? 
.
?? 
	DropTable
?? &
(
??& '
name
?? 
:
?? 
$str
??  
)
??  !
;
??! "
migrationBuilder
?? 
.
?? 
	DropTable
?? &
(
??& '
name
?? 
:
?? 
$str
?? '
)
??' (
;
??( )
migrationBuilder
?? 
.
?? 
	DropTable
?? &
(
??& '
name
?? 
:
?? 
$str
?? $
)
??$ %
;
??% &
migrationBuilder
?? 
.
?? 
	DropTable
?? &
(
??& '
name
?? 
:
?? 
$str
?? #
)
??# $
;
??$ %
migrationBuilder
?? 
.
?? 
	DropTable
?? &
(
??& '
name
?? 
:
?? 
$str
?? "
)
??" #
;
??# $
migrationBuilder
?? 
.
?? 
	DropTable
?? &
(
??& '
name
?? 
:
?? 
$str
?? 
)
?? 
;
??  
migrationBuilder
?? 
.
?? 
	DropTable
?? &
(
??& '
name
?? 
:
?? 
$str
?? 
)
?? 
;
?? 
migrationBuilder
?? 
.
?? 
	DropTable
?? &
(
??& '
name
?? 
:
?? 
$str
?? #
)
??# $
;
??$ %
migrationBuilder
?? 
.
?? 
	DropTable
?? &
(
??& '
name
?? 
:
?? 
$str
?? #
)
??# $
;
??$ %
migrationBuilder
?? 
.
?? 
	DropTable
?? &
(
??& '
name
?? 
:
?? 
$str
?? $
)
??$ %
;
??% &
}
?? 	
}
?? 
}?? ?
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
}   ??
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
?? &
:
??& '
$str
??( 5
,
??5 6
principalColumn
?? '
:
??' (
$str
??) -
,
??- .
onDelete
??  
:
??  !
ReferentialAction
??" 3
.
??3 4
Cascade
??4 ;
)
??; <
;
??< =
}
?? 
)
?? 
;
?? 
migrationBuilder
?? 
.
?? 
CreateTable
?? (
(
??( )
name
?? 
:
?? 
$str
?? (
,
??( )
columns
?? 
:
?? 
table
?? 
=>
?? !
new
??" %
{
?? 
LoginProvider
?? !
=
??" #
table
??$ )
.
??) *
Column
??* 0
<
??0 1
string
??1 7
>
??7 8
(
??8 9
type
??9 =
:
??= >
$str
??? W
,
??W X
	maxLength
??Y b
:
??b c
$num
??d g
,
??g h
nullable
??i q
:
??q r
false
??s x
)
??x y
,
??y z
ProviderKey
?? 
=
??  !
table
??" '
.
??' (
Column
??( .
<
??. /
string
??/ 5
>
??5 6
(
??6 7
type
??7 ;
:
??; <
$str
??= U
,
??U V
	maxLength
??W `
:
??` a
$num
??b e
,
??e f
nullable
??g o
:
??o p
false
??q v
)
??v w
,
??w x!
ProviderDisplayName
?? '
=
??( )
table
??* /
.
??/ 0
Column
??0 6
<
??6 7
string
??7 =
>
??= >
(
??> ?
type
??? C
:
??C D
$str
??E K
,
??K L
nullable
??M U
:
??U V
true
??W [
)
??[ \
,
??\ ]
UserId
?? 
=
?? 
table
?? "
.
??" #
Column
??# )
<
??) *
string
??* 0
>
??0 1
(
??1 2
type
??2 6
:
??6 7
$str
??8 >
,
??> ?
nullable
??@ H
:
??H I
false
??J O
)
??O P
}
?? 
,
?? 
constraints
?? 
:
?? 
table
?? "
=>
??# %
{
?? 
table
?? 
.
?? 

PrimaryKey
?? $
(
??$ %
$str
??% :
,
??: ;
x
??< =
=>
??> @
new
??A D
{
??E F
x
??G H
.
??H I
LoginProvider
??I V
,
??V W
x
??X Y
.
??Y Z
ProviderKey
??Z e
}
??f g
)
??g h
;
??h i
table
?? 
.
?? 

ForeignKey
?? $
(
??$ %
name
?? 
:
?? 
$str
?? F
,
??F G
column
?? 
:
?? 
x
??  !
=>
??" $
x
??% &
.
??& '
UserId
??' -
,
??- .
principalTable
?? &
:
??& '
$str
??( 5
,
??5 6
principalColumn
?? '
:
??' (
$str
??) -
,
??- .
onDelete
??  
:
??  !
ReferentialAction
??" 3
.
??3 4
Cascade
??4 ;
)
??; <
;
??< =
}
?? 
)
?? 
;
?? 
migrationBuilder
?? 
.
?? 
CreateTable
?? (
(
??( )
name
?? 
:
?? 
$str
?? '
,
??' (
columns
?? 
:
?? 
table
?? 
=>
?? !
new
??" %
{
?? 
UserId
?? 
=
?? 
table
?? "
.
??" #
Column
??# )
<
??) *
string
??* 0
>
??0 1
(
??1 2
type
??2 6
:
??6 7
$str
??8 >
,
??> ?
nullable
??@ H
:
??H I
false
??J O
)
??O P
,
??P Q
RoleId
?? 
=
?? 
table
?? "
.
??" #
Column
??# )
<
??) *
string
??* 0
>
??0 1
(
??1 2
type
??2 6
:
??6 7
$str
??8 >
,
??> ?
nullable
??@ H
:
??H I
false
??J O
)
??O P
}
?? 
,
?? 
constraints
?? 
:
?? 
table
?? "
=>
??# %
{
?? 
table
?? 
.
?? 

PrimaryKey
?? $
(
??$ %
$str
??% 9
,
??9 :
x
??; <
=>
??= ?
new
??@ C
{
??D E
x
??F G
.
??G H
UserId
??H N
,
??N O
x
??P Q
.
??Q R
RoleId
??R X
}
??Y Z
)
??Z [
;
??[ \
table
?? 
.
?? 

ForeignKey
?? $
(
??$ %
name
?? 
:
?? 
$str
?? E
,
??E F
column
?? 
:
?? 
x
??  !
=>
??" $
x
??% &
.
??& '
RoleId
??' -
,
??- .
principalTable
?? &
:
??& '
$str
??( 5
,
??5 6
principalColumn
?? '
:
??' (
$str
??) -
,
??- .
onDelete
??  
:
??  !
ReferentialAction
??" 3
.
??3 4
Cascade
??4 ;
)
??; <
;
??< =
table
?? 
.
?? 

ForeignKey
?? $
(
??$ %
name
?? 
:
?? 
$str
?? E
,
??E F
column
?? 
:
?? 
x
??  !
=>
??" $
x
??% &
.
??& '
UserId
??' -
,
??- .
principalTable
?? &
:
??& '
$str
??( 5
,
??5 6
principalColumn
?? '
:
??' (
$str
??) -
,
??- .
onDelete
??  
:
??  !
ReferentialAction
??" 3
.
??3 4
Cascade
??4 ;
)
??; <
;
??< =
}
?? 
)
?? 
;
?? 
migrationBuilder
?? 
.
?? 
CreateTable
?? (
(
??( )
name
?? 
:
?? 
$str
?? (
,
??( )
columns
?? 
:
?? 
table
?? 
=>
?? !
new
??" %
{
?? 
UserId
?? 
=
?? 
table
?? "
.
??" #
Column
??# )
<
??) *
string
??* 0
>
??0 1
(
??1 2
type
??2 6
:
??6 7
$str
??8 >
,
??> ?
nullable
??@ H
:
??H I
false
??J O
)
??O P
,
??P Q
LoginProvider
?? !
=
??" #
table
??$ )
.
??) *
Column
??* 0
<
??0 1
string
??1 7
>
??7 8
(
??8 9
type
??9 =
:
??= >
$str
??? W
,
??W X
	maxLength
??Y b
:
??b c
$num
??d g
,
??g h
nullable
??i q
:
??q r
false
??s x
)
??x y
,
??y z
Name
?? 
=
?? 
table
??  
.
??  !
Column
??! '
<
??' (
string
??( .
>
??. /
(
??/ 0
type
??0 4
:
??4 5
$str
??6 N
,
??N O
	maxLength
??P Y
:
??Y Z
$num
??[ ^
,
??^ _
nullable
??` h
:
??h i
false
??j o
)
??o p
,
??p q
Value
?? 
=
?? 
table
?? !
.
??! "
Column
??" (
<
??( )
string
??) /
>
??/ 0
(
??0 1
type
??1 5
:
??5 6
$str
??7 =
,
??= >
nullable
??? G
:
??G H
true
??I M
)
??M N
}
?? 
,
?? 
constraints
?? 
:
?? 
table
?? "
=>
??# %
{
?? 
table
?? 
.
?? 

PrimaryKey
?? $
(
??$ %
$str
??% :
,
??: ;
x
??< =
=>
??> @
new
??A D
{
??E F
x
??G H
.
??H I
UserId
??I O
,
??O P
x
??Q R
.
??R S
LoginProvider
??S `
,
??` a
x
??b c
.
??c d
Name
??d h
}
??i j
)
??j k
;
??k l
table
?? 
.
?? 

ForeignKey
?? $
(
??$ %
name
?? 
:
?? 
$str
?? F
,
??F G
column
?? 
:
?? 
x
??  !
=>
??" $
x
??% &
.
??& '
UserId
??' -
,
??- .
principalTable
?? &
:
??& '
$str
??( 5
,
??5 6
principalColumn
?? '
:
??' (
$str
??) -
,
??- .
onDelete
??  
:
??  !
ReferentialAction
??" 3
.
??3 4
Cascade
??4 ;
)
??; <
;
??< =
}
?? 
)
?? 
;
?? 
migrationBuilder
?? 
.
?? 
CreateTable
?? (
(
??( )
name
?? 
:
?? 
$str
?? #
,
??# $
columns
?? 
:
?? 
table
?? 
=>
?? !
new
??" %
{
?? 
Id
?? 
=
?? 
table
?? 
.
?? 
Column
?? %
<
??% &
Guid
??& *
>
??* +
(
??+ ,
type
??, 0
:
??0 1
$str
??2 8
,
??8 9
nullable
??: B
:
??B C
false
??D I
)
??I J
,
??J K
Icon
?? 
=
?? 
table
??  
.
??  !
Column
??! '
<
??' (
string
??( .
>
??. /
(
??/ 0
type
??0 4
:
??4 5
$str
??6 <
,
??< =
nullable
??> F
:
??F G
true
??H L
)
??L M
,
??M N
Name
?? 
=
?? 
table
??  
.
??  !
Column
??! '
<
??' (
string
??( .
>
??. /
(
??/ 0
type
??0 4
:
??4 5
$str
??6 <
,
??< =
nullable
??> F
:
??F G
true
??H L
)
??L M
,
??M N
DateCreated
?? 
=
??  !
table
??" '
.
??' (
Column
??( .
<
??. /
DateTime
??/ 7
>
??7 8
(
??8 9
type
??9 =
:
??= >
$str
??? Y
,
??Y Z
nullable
??[ c
:
??c d
false
??e j
)
??j k
,
??k l

GameLength
?? 
=
??  
table
??! &
.
??& '
Column
??' -
<
??- .
TimeSpan
??. 6
>
??6 7
(
??7 8
type
??8 <
:
??< =
$str
??> H
,
??H I
nullable
??J R
:
??R S
false
??T Y
)
??Y Z
,
??Z [
Status
?? 
=
?? 
table
?? "
.
??" #
Column
??# )
<
??) *
int
??* -
>
??- .
(
??. /
type
??/ 3
:
??3 4
$str
??5 >
,
??> ?
nullable
??@ H
:
??H I
false
??J O
)
??O P
,
??P Q
CurrentRound
??  
=
??! "
table
??# (
.
??( )
Column
??) /
<
??/ 0
int
??0 3
>
??3 4
(
??4 5
type
??5 9
:
??9 :
$str
??; D
,
??D E
nullable
??F N
:
??N O
false
??P U
)
??U V
,
??V W
EndgameStrategy
?? #
=
??$ %
table
??& +
.
??+ ,
Column
??, 2
<
??2 3
string
??3 9
>
??9 :
(
??: ;
type
??; ?
:
??? @
$str
??A G
,
??G H
nullable
??I Q
:
??Q R
true
??S W
)
??W X
,
??X Y
WinnerId
?? 
=
?? 
table
?? $
.
??$ %
Column
??% +
<
??+ ,
string
??, 2
>
??2 3
(
??3 4
type
??4 8
:
??8 9
$str
??: @
,
??@ A
nullable
??B J
:
??J K
true
??L P
)
??P Q
}
?? 
,
?? 
constraints
?? 
:
?? 
table
?? "
=>
??# %
{
?? 
table
?? 
.
?? 

PrimaryKey
?? $
(
??$ %
$str
??% 5
,
??5 6
x
??7 8
=>
??9 ;
x
??< =
.
??= >
Id
??> @
)
??@ A
;
??A B
table
?? 
.
?? 

ForeignKey
?? $
(
??$ %
name
?? 
:
?? 
$str
?? C
,
??C D
column
?? 
:
?? 
x
??  !
=>
??" $
x
??% &
.
??& '
WinnerId
??' /
,
??/ 0
principalTable
?? &
:
??& '
$str
??( 5
,
??5 6
principalColumn
?? '
:
??' (
$str
??) -
)
??- .
;
??. /
}
?? 
)
?? 
;
?? 
migrationBuilder
?? 
.
?? 
CreateTable
?? (
(
??( )
name
?? 
:
?? 
$str
?? '
,
??' (
columns
?? 
:
?? 
table
?? 
=>
?? !
new
??" %
{
?? 
Id
?? 
=
?? 
table
?? 
.
?? 
Column
?? %
<
??% &
Guid
??& *
>
??* +
(
??+ ,
type
??, 0
:
??0 1
$str
??2 8
,
??8 9
nullable
??: B
:
??B C
false
??D I
)
??I J
,
??J K
AchievementId
?? !
=
??" #
table
??$ )
.
??) *
Column
??* 0
<
??0 1
Guid
??1 5
>
??5 6
(
??6 7
type
??7 ;
:
??; <
$str
??= C
,
??C D
nullable
??E M
:
??M N
false
??O T
)
??T U
,
??U V
UserId
?? 
=
?? 
table
?? "
.
??" #
Column
??# )
<
??) *
string
??* 0
>
??0 1
(
??1 2
type
??2 6
:
??6 7
$str
??8 >
,
??> ?
nullable
??@ H
:
??H I
true
??J N
)
??N O
}
?? 
,
?? 
constraints
?? 
:
?? 
table
?? "
=>
??# %
{
?? 
table
?? 
.
?? 

PrimaryKey
?? $
(
??$ %
$str
??% 9
,
??9 :
x
??; <
=>
??= ?
x
??@ A
.
??A B
Id
??B D
)
??D E
;
??E F
table
?? 
.
?? 

ForeignKey
?? $
(
??$ %
name
?? 
:
?? 
$str
?? M
,
??M N
column
?? 
:
?? 
x
??  !
=>
??" $
x
??% &
.
??& '
AchievementId
??' 4
,
??4 5
principalTable
?? &
:
??& '
$str
??( 6
,
??6 7
principalColumn
?? '
:
??' (
$str
??) -
,
??- .
onDelete
??  
:
??  !
ReferentialAction
??" 3
.
??3 4
Cascade
??4 ;
)
??; <
;
??< =
table
?? 
.
?? 

ForeignKey
?? $
(
??$ %
name
?? 
:
?? 
$str
?? E
,
??E F
column
?? 
:
?? 
x
??  !
=>
??" $
x
??% &
.
??& '
UserId
??' -
,
??- .
principalTable
?? &
:
??& '
$str
??( 5
,
??5 6
principalColumn
?? '
:
??' (
$str
??) -
)
??- .
;
??. /
}
?? 
)
?? 
;
?? 
migrationBuilder
?? 
.
?? 
CreateTable
?? (
(
??( )
name
?? 
:
?? 
$str
?? $
,
??$ %
columns
?? 
:
?? 
table
?? 
=>
?? !
new
??" %
{
?? 
Id
?? 
=
?? 
table
?? 
.
?? 
Column
?? %
<
??% &
Guid
??& *
>
??* +
(
??+ ,
type
??, 0
:
??0 1
$str
??2 8
,
??8 9
nullable
??: B
:
??B C
false
??D I
)
??I J
,
??J K
Name
?? 
=
?? 
table
??  
.
??  !
Column
??! '
<
??' (
string
??( .
>
??. /
(
??/ 0
type
??0 4
:
??4 5
$str
??6 <
,
??< =
nullable
??> F
:
??F G
true
??H L
)
??L M
,
??M N
Description
?? 
=
??  !
table
??" '
.
??' (
Column
??( .
<
??. /
string
??/ 5
>
??5 6
(
??6 7
type
??7 ;
:
??; <
$str
??= C
,
??C D
nullable
??E M
:
??M N
true
??O S
)
??S T
,
??T U
UserId
?? 
=
?? 
table
?? "
.
??" #
Column
??# )
<
??) *
string
??* 0
>
??0 1
(
??1 2
type
??2 6
:
??6 7
$str
??8 >
,
??> ?
nullable
??@ H
:
??H I
true
??J N
)
??N O
,
??O P
ShipId
?? 
=
?? 
table
?? "
.
??" #
Column
??# )
<
??) *
Guid
??* .
>
??. /
(
??/ 0
type
??0 4
:
??4 5
$str
??6 <
,
??< =
nullable
??> F
:
??F G
true
??H L
)
??L M
}
?? 
,
?? 
constraints
?? 
:
?? 
table
?? "
=>
??# %
{
?? 
table
?? 
.
?? 

PrimaryKey
?? $
(
??$ %
$str
??% 6
,
??6 7
x
??8 9
=>
??: <
x
??= >
.
??> ?
Id
??? A
)
??A B
;
??B C
table
?? 
.
?? 

ForeignKey
?? $
(
??$ %
name
?? 
:
?? 
$str
?? B
,
??B C
column
?? 
:
?? 
x
??  !
=>
??" $
x
??% &
.
??& '
UserId
??' -
,
??- .
principalTable
?? &
:
??& '
$str
??( 5
,
??5 6
principalColumn
?? '
:
??' (
$str
??) -
)
??- .
;
??. /
table
?? 
.
?? 

ForeignKey
?? $
(
??$ %
name
?? 
:
?? 
$str
?? ;
,
??; <
column
?? 
:
?? 
x
??  !
=>
??" $
x
??% &
.
??& '
ShipId
??' -
,
??- .
principalTable
?? &
:
??& '
$str
??( .
,
??. /
principalColumn
?? '
:
??' (
$str
??) -
)
??- .
;
??. /
}
?? 
)
?? 
;
?? 
migrationBuilder
?? 
.
?? 
CreateTable
?? (
(
??( )
name
?? 
:
?? 
$str
?? +
,
??+ ,
columns
?? 
:
?? 
table
?? 
=>
?? !
new
??" %
{
?? 
Id
?? 
=
?? 
table
?? 
.
?? 
Column
?? %
<
??% &
Guid
??& *
>
??* +
(
??+ ,
type
??, 0
:
??0 1
$str
??2 8
,
??8 9
nullable
??: B
:
??B C
false
??D I
)
??I J
,
??J K
GameSessionId
?? !
=
??" #
table
??$ )
.
??) *
Column
??* 0
<
??0 1
Guid
??1 5
>
??5 6
(
??6 7
type
??7 ;
:
??; <
$str
??= C
,
??C D
nullable
??E M
:
??M N
false
??O T
)
??T U
,
??U V
GridSize
?? 
=
?? 
table
?? $
.
??$ %
Column
??% +
<
??+ ,
string
??, 2
>
??2 3
(
??3 4
type
??4 8
:
??8 9
$str
??: @
,
??@ A
nullable
??B J
:
??J K
true
??L P
)
??P Q
,
??Q R
ColumnCount
?? 
=
??  !
table
??" '
.
??' (
Column
??( .
<
??. /
int
??/ 2
>
??2 3
(
??3 4
type
??4 8
:
??8 9
$str
??: C
,
??C D
nullable
??E M
:
??M N
false
??O T
)
??T U
,
??U V
RowCount
?? 
=
?? 
table
?? $
.
??$ %
Column
??% +
<
??+ ,
int
??, /
>
??/ 0
(
??0 1
type
??1 5
:
??5 6
$str
??7 @
,
??@ A
nullable
??B J
:
??J K
false
??L Q
)
??Q R
,
??R S
GameType
?? 
=
?? 
table
?? $
.
??$ %
Column
??% +
<
??+ ,
int
??, /
>
??/ 0
(
??0 1
type
??1 5
:
??5 6
$str
??7 @
,
??@ A
nullable
??B J
:
??J K
false
??L Q
)
??Q R
,
??R S'
RoundCountLimitForEndgame
?? -
=
??. /
table
??0 5
.
??5 6
Column
??6 <
<
??< =
int
??= @
>
??@ A
(
??A B
type
??B F
:
??F G
$str
??H Q
,
??Q R
nullable
??S [
:
??[ \
false
??] b
)
??b c
,
??c d0
"DestroyedShipsPercentageForEndgame
?? 6
=
??7 8
table
??9 >
.
??> ?
Column
??? E
<
??E F
int
??F I
>
??I J
(
??J K
type
??K O
:
??O P
$str
??Q Z
,
??Z [
nullable
??\ d
:
??d e
false
??f k
)
??k l
,
??l m*
DestroyedShipCountForEndgame
?? 0
=
??1 2
table
??3 8
.
??8 9
Column
??9 ?
<
??? @
int
??@ C
>
??C D
(
??D E
type
??E I
:
??I J
$str
??K T
,
??T U
nullable
??V ^
:
??^ _
false
??` e
)
??e f
}
?? 
,
?? 
constraints
?? 
:
?? 
table
?? "
=>
??# %
{
?? 
table
?? 
.
?? 

PrimaryKey
?? $
(
??$ %
$str
??% =
,
??= >
x
??? @
=>
??A C
x
??D E
.
??E F
Id
??F H
)
??H I
;
??I J
table
?? 
.
?? 

ForeignKey
?? $
(
??$ %
name
?? 
:
?? 
$str
?? P
,
??P Q
column
?? 
:
?? 
x
??  !
=>
??" $
x
??% &
.
??& '
GameSessionId
??' 4
,
??4 5
principalTable
?? &
:
??& '
$str
??( 5
,
??5 6
principalColumn
?? '
:
??' (
$str
??) -
,
??- .
onDelete
??  
:
??  !
ReferentialAction
??" 3
.
??3 4
Cascade
??4 ;
)
??; <
;
??< =
}
?? 
)
?? 
;
?? 
migrationBuilder
?? 
.
?? 
CreateTable
?? (
(
??( )
name
?? 
:
?? 
$str
?? 
,
?? 
columns
?? 
:
?? 
table
?? 
=>
?? !
new
??" %
{
?? 
Id
?? 
=
?? 
table
?? 
.
?? 
Column
?? %
<
??% &
Guid
??& *
>
??* +
(
??+ ,
type
??, 0
:
??0 1
$str
??2 8
,
??8 9
nullable
??: B
:
??B C
false
??D I
)
??I J
,
??J K
GameSessionId
?? !
=
??" #
table
??$ )
.
??) *
Column
??* 0
<
??0 1
Guid
??1 5
>
??5 6
(
??6 7
type
??7 ;
:
??; <
$str
??= C
,
??C D
nullable
??E M
:
??M N
false
??O T
)
??T U
,
??U V
IsHost
?? 
=
?? 
table
?? "
.
??" #
Column
??# )
<
??) *
bool
??* .
>
??. /
(
??/ 0
type
??0 4
:
??4 5
$str
??6 ?
,
??? @
nullable
??A I
:
??I J
false
??K P
)
??P Q
,
??Q R
UserId
?? 
=
?? 
table
?? "
.
??" #
Column
??# )
<
??) *
string
??* 0
>
??0 1
(
??1 2
type
??2 6
:
??6 7
$str
??8 >
,
??> ?
nullable
??@ H
:
??H I
true
??J N
)
??N O
}
?? 
,
?? 
constraints
?? 
:
?? 
table
?? "
=>
??# %
{
?? 
table
?? 
.
?? 

PrimaryKey
?? $
(
??$ %
$str
??% 0
,
??0 1
x
??2 3
=>
??4 6
x
??7 8
.
??8 9
Id
??9 ;
)
??; <
;
??< =
table
?? 
.
?? 

ForeignKey
?? $
(
??$ %
name
?? 
:
?? 
$str
?? <
,
??< =
column
?? 
:
?? 
x
??  !
=>
??" $
x
??% &
.
??& '
UserId
??' -
,
??- .
principalTable
?? &
:
??& '
$str
??( 5
,
??5 6
principalColumn
?? '
:
??' (
$str
??) -
)
??- .
;
??. /
table
?? 
.
?? 

ForeignKey
?? $
(
??$ %
name
?? 
:
?? 
$str
?? C
,
??C D
column
?? 
:
?? 
x
??  !
=>
??" $
x
??% &
.
??& '
GameSessionId
??' 4
,
??4 5
principalTable
?? &
:
??& '
$str
??( 5
,
??5 6
principalColumn
?? '
:
??' (
$str
??) -
,
??- .
onDelete
??  
:
??  !
ReferentialAction
??" 3
.
??3 4
Cascade
??4 ;
)
??; <
;
??< =
}
?? 
)
?? 
;
?? 
migrationBuilder
?? 
.
?? 
CreateTable
?? (
(
??( )
name
?? 
:
?? 
$str
?? "
,
??" #
columns
?? 
:
?? 
table
?? 
=>
?? !
new
??" %
{
?? 
Id
?? 
=
?? 
table
?? 
.
?? 
Column
?? %
<
??% &
Guid
??& *
>
??* +
(
??+ ,
type
??, 0
:
??0 1
$str
??2 8
,
??8 9
nullable
??: B
:
??B C
false
??D I
)
??I J
,
??J K
PlayerId
?? 
=
?? 
table
?? $
.
??$ %
Column
??% +
<
??+ ,
Guid
??, 0
>
??0 1
(
??1 2
type
??2 6
:
??6 7
$str
??8 >
,
??> ?
nullable
??@ H
:
??H I
false
??J O
)
??O P
,
??P Q
ShipId
?? 
=
?? 
table
?? "
.
??" #
Column
??# )
<
??) *
Guid
??* .
>
??. /
(
??/ 0
type
??0 4
:
??4 5
$str
??6 <
,
??< =
nullable
??> F
:
??F G
false
??H M
)
??M N
}
?? 
,
?? 
constraints
?? 
:
?? 
table
?? "
=>
??# %
{
?? 
table
?? 
.
?? 

PrimaryKey
?? $
(
??$ %
$str
??% 4
,
??4 5
x
??6 7
=>
??8 :
x
??; <
.
??< =
Id
??= ?
)
??? @
;
??@ A
table
?? 
.
?? 

ForeignKey
?? $
(
??$ %
name
?? 
:
?? 
$str
?? =
,
??= >
column
?? 
:
?? 
x
??  !
=>
??" $
x
??% &
.
??& '
PlayerId
??' /
,
??/ 0
principalTable
?? &
:
??& '
$str
??( 0
,
??0 1
principalColumn
?? '
:
??' (
$str
??) -
,
??- .
onDelete
??  
:
??  !
ReferentialAction
??" 3
.
??3 4
Cascade
??4 ;
)
??; <
;
??< =
table
?? 
.
?? 

ForeignKey
?? $
(
??$ %
name
?? 
:
?? 
$str
?? 9
,
??9 :
column
?? 
:
?? 
x
??  !
=>
??" $
x
??% &
.
??& '
ShipId
??' -
,
??- .
principalTable
?? &
:
??& '
$str
??( .
,
??. /
principalColumn
?? '
:
??' (
$str
??) -
,
??- .
onDelete
??  
:
??  !
ReferentialAction
??" 3
.
??3 4
Cascade
??4 ;
)
??; <
;
??< =
}
?? 
)
?? 
;
?? 
migrationBuilder
?? 
.
?? 
CreateTable
?? (
(
??( )
name
?? 
:
?? 
$str
??  
,
??  !
columns
?? 
:
?? 
table
?? 
=>
?? !
new
??" %
{
?? 
Id
?? 
=
?? 
table
?? 
.
?? 
Column
?? %
<
??% &
Guid
??& *
>
??* +
(
??+ ,
type
??, 0
:
??0 1
$str
??2 8
,
??8 9
nullable
??: B
:
??B C
false
??D I
)
??I J
,
??J K
XCoordinate
?? 
=
??  !
table
??" '
.
??' (
Column
??( .
<
??. /
int
??/ 2
>
??2 3
(
??3 4
type
??4 8
:
??8 9
$str
??: C
,
??C D
nullable
??E M
:
??M N
false
??O T
)
??T U
,
??U V
YCoordinate
?? 
=
??  !
table
??" '
.
??' (
Column
??( .
<
??. /
int
??/ 2
>
??2 3
(
??3 4
type
??4 8
:
??8 9
$str
??: C
,
??C D
nullable
??E M
:
??M N
false
??O T
)
??T U
,
??U V
IsDestroyed
?? 
=
??  !
table
??" '
.
??' (
Column
??( .
<
??. /
bool
??/ 3
>
??3 4
(
??4 5
type
??5 9
:
??9 :
$str
??; D
,
??D E
nullable
??F N
:
??N O
false
??P U
)
??U V
,
??V W
PlayerShipId
??  
=
??! "
table
??# (
.
??( )
Column
??) /
<
??/ 0
Guid
??0 4
>
??4 5
(
??5 6
type
??6 :
:
??: ;
$str
??< B
,
??B C
nullable
??D L
:
??L M
false
??N S
)
??S T
}
?? 
,
?? 
constraints
?? 
:
?? 
table
?? "
=>
??# %
{
?? 
table
?? 
.
?? 

PrimaryKey
?? $
(
??$ %
$str
??% 2
,
??2 3
x
??4 5
=>
??6 8
x
??9 :
.
??: ;
Id
??; =
)
??= >
;
??> ?
table
?? 
.
?? 

ForeignKey
?? $
(
??$ %
name
?? 
:
?? 
$str
?? C
,
??C D
column
?? 
:
?? 
x
??  !
=>
??" $
x
??% &
.
??& '
PlayerShipId
??' 3
,
??3 4
principalTable
?? &
:
??& '
$str
??( 4
,
??4 5
principalColumn
?? '
:
??' (
$str
??) -
,
??- .
onDelete
??  
:
??  !
ReferentialAction
??" 3
.
??3 4
Cascade
??4 ;
)
??; <
;
??< =
}
?? 
)
?? 
;
?? 
migrationBuilder
?? 
.
?? 
CreateIndex
?? (
(
??( )
name
?? 
:
?? 
$str
?? 2
,
??2 3
table
?? 
:
?? 
$str
?? )
,
??) *
column
?? 
:
?? 
$str
??  
)
??  !
;
??! "
migrationBuilder
?? 
.
?? 
CreateIndex
?? (
(
??( )
name
?? 
:
?? 
$str
?? %
,
??% &
table
?? 
:
?? 
$str
?? $
,
??$ %
column
?? 
:
?? 
$str
?? (
,
??( )
unique
?? 
:
?? 
true
?? 
)
?? 
;
?? 
migrationBuilder
?? 
.
?? 
CreateIndex
?? (
(
??( )
name
?? 
:
?? 
$str
?? 2
,
??2 3
table
?? 
:
?? 
$str
?? )
,
??) *
column
?? 
:
?? 
$str
??  
)
??  !
;
??! "
migrationBuilder
?? 
.
?? 
CreateIndex
?? (
(
??( )
name
?? 
:
?? 
$str
?? 2
,
??2 3
table
?? 
:
?? 
$str
?? )
,
??) *
column
?? 
:
?? 
$str
??  
)
??  !
;
??! "
migrationBuilder
?? 
.
?? 
CreateIndex
?? (
(
??( )
name
?? 
:
?? 
$str
?? 1
,
??1 2
table
?? 
:
?? 
$str
?? (
,
??( )
column
?? 
:
?? 
$str
??  
)
??  !
;
??! "
migrationBuilder
?? 
.
?? 
CreateIndex
?? (
(
??( )
name
?? 
:
?? 
$str
?? "
,
??" #
table
?? 
:
?? 
$str
?? $
,
??$ %
column
?? 
:
?? 
$str
?? )
)
??) *
;
??* +
migrationBuilder
?? 
.
?? 
CreateIndex
?? (
(
??( )
name
?? 
:
?? 
$str
?? 4
,
??4 5
table
?? 
:
?? 
$str
?? $
,
??$ %
column
?? 
:
?? 
$str
?? '
)
??' (
;
??( )
migrationBuilder
?? 
.
?? 
CreateIndex
?? (
(
??( )
name
?? 
:
?? 
$str
?? %
,
??% &
table
?? 
:
?? 
$str
?? $
,
??$ %
column
?? 
:
?? 
$str
?? ,
,
??, -
unique
?? 
:
?? 
true
?? 
)
?? 
;
?? 
migrationBuilder
?? 
.
?? 
CreateIndex
?? (
(
??( )
name
?? 
:
?? 
$str
?? /
,
??/ 0
table
?? 
:
?? 
$str
?? $
,
??$ %
column
?? 
:
?? 
$str
?? "
)
??" #
;
??# $
migrationBuilder
?? 
.
?? 
CreateIndex
?? (
(
??( )
name
?? 
:
?? 
$str
?? <
,
??< =
table
?? 
:
?? 
$str
?? ,
,
??, -
column
?? 
:
?? 
$str
?? '
,
??' (
unique
?? 
:
?? 
true
?? 
)
?? 
;
?? 
migrationBuilder
?? 
.
?? 
CreateIndex
?? (
(
??( )
name
?? 
:
?? 
$str
?? /
,
??/ 0
table
?? 
:
?? 
$str
?? 
,
??  
column
?? 
:
?? 
$str
?? '
)
??' (
;
??( )
migrationBuilder
?? 
.
?? 
CreateIndex
?? (
(
??( )
name
?? 
:
?? 
$str
?? (
,
??( )
table
?? 
:
?? 
$str
?? 
,
??  
column
?? 
:
?? 
$str
??  
)
??  !
;
??! "
migrationBuilder
?? 
.
?? 
CreateIndex
?? (
(
??( )
name
?? 
:
?? 
$str
?? .
,
??. /
table
?? 
:
?? 
$str
?? #
,
??# $
column
?? 
:
?? 
$str
?? "
)
??" #
;
??# $
migrationBuilder
?? 
.
?? 
CreateIndex
?? (
(
??( )
name
?? 
:
?? 
$str
?? ,
,
??, -
table
?? 
:
?? 
$str
?? #
,
??# $
column
?? 
:
?? 
$str
??  
)
??  !
;
??! "
migrationBuilder
?? 
.
?? 
CreateIndex
?? (
(
??( )
name
?? 
:
?? 
$str
?? 0
,
??0 1
table
?? 
:
?? 
$str
?? !
,
??! "
column
?? 
:
?? 
$str
?? &
)
??& '
;
??' (
migrationBuilder
?? 
.
?? 
CreateIndex
?? (
(
??( )
name
?? 
:
?? 
$str
?? 8
,
??8 9
table
?? 
:
?? 
$str
?? (
,
??( )
column
?? 
:
?? 
$str
?? '
)
??' (
;
??( )
migrationBuilder
?? 
.
?? 
CreateIndex
?? (
(
??( )
name
?? 
:
?? 
$str
?? 1
,
??1 2
table
?? 
:
?? 
$str
?? (
,
??( )
column
?? 
:
?? 
$str
??  
)
??  !
;
??! "
migrationBuilder
?? 
.
?? 
CreateIndex
?? (
(
??( )
name
?? 
:
?? 
$str
?? .
,
??. /
table
?? 
:
?? 
$str
?? %
,
??% &
column
?? 
:
?? 
$str
??  
)
??  !
;
??! "
migrationBuilder
?? 
.
?? 
CreateIndex
?? (
(
??( )
name
?? 
:
?? 
$str
?? .
,
??. /
table
?? 
:
?? 
$str
?? %
,
??% &
column
?? 
:
?? 
$str
??  
)
??  !
;
??! "
}
?? 	
	protected
?? 
override
?? 
void
?? 
Down
??  $
(
??$ %
MigrationBuilder
??% 5
migrationBuilder
??6 F
)
??F G
{
?? 	
migrationBuilder
?? 
.
?? 
	DropTable
?? &
(
??& '
name
?? 
:
?? 
$str
?? (
)
??( )
;
??) *
migrationBuilder
?? 
.
?? 
	DropTable
?? &
(
??& '
name
?? 
:
?? 
$str
?? (
)
??( )
;
??) *
migrationBuilder
?? 
.
?? 
	DropTable
?? &
(
??& '
name
?? 
:
?? 
$str
?? (
)
??( )
;
??) *
migrationBuilder
?? 
.
?? 
	DropTable
?? &
(
??& '
name
?? 
:
?? 
$str
?? '
)
??' (
;
??( )
migrationBuilder
?? 
.
?? 
	DropTable
?? &
(
??& '
name
?? 
:
?? 
$str
?? (
)
??( )
;
??) *
migrationBuilder
?? 
.
?? 
	DropTable
?? &
(
??& '
name
?? 
:
?? 
$str
?? +
)
??+ ,
;
??, -
migrationBuilder
?? 
.
?? 
	DropTable
?? &
(
??& '
name
?? 
:
?? 
$str
??  
)
??  !
;
??! "
migrationBuilder
?? 
.
?? 
	DropTable
?? &
(
??& '
name
?? 
:
?? 
$str
?? '
)
??' (
;
??( )
migrationBuilder
?? 
.
?? 
	DropTable
?? &
(
??& '
name
?? 
:
?? 
$str
?? $
)
??$ %
;
??% &
migrationBuilder
?? 
.
?? 
	DropTable
?? &
(
??& '
name
?? 
:
?? 
$str
?? #
)
??# $
;
??$ %
migrationBuilder
?? 
.
?? 
	DropTable
?? &
(
??& '
name
?? 
:
?? 
$str
?? "
)
??" #
;
??# $
migrationBuilder
?? 
.
?? 
	DropTable
?? &
(
??& '
name
?? 
:
?? 
$str
?? 
)
?? 
;
??  
migrationBuilder
?? 
.
?? 
	DropTable
?? &
(
??& '
name
?? 
:
?? 
$str
?? 
)
?? 
;
?? 
migrationBuilder
?? 
.
?? 
	DropTable
?? &
(
??& '
name
?? 
:
?? 
$str
?? #
)
??# $
;
??$ %
migrationBuilder
?? 
.
?? 
	DropTable
?? &
(
??& '
name
?? 
:
?? 
$str
?? #
)
??# $
;
??$ %
migrationBuilder
?? 
.
?? 
	DropTable
?? &
(
??& '
name
?? 
:
?? 
$str
?? $
)
??$ %
;
??% &
}
?? 	
}
?? 
}?? ?
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
} ?+
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
}WW ?(
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
}XX ?!
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
}FF ?!
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
}FF ?
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
} ?
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
$str	~ ?
{
? ?
nameof
? ?
(
? ?
UserAchievements
? ?
)
? ?
}
? ?
$str
? ?
{
? ?
UserAchievements
? ?
}
? ?
"
? ?
;
? ?
} 	
} 
} ?
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
} ?
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
{ 
	Undefined 
= 
$num 
, 
Petrol 
= 
$num 
, 
Electric 
= 
$num 
} 
}		 ?
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
 ?
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
 ?
2D:\dev\Battleships\Battleships\Models\enums\Gun.cs
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
enum 
Gun 
{ 
	Undefined 
= 
$num 
, 
Cannon 
= 
$num 
, 
Laser 
= 
$num 
} 
}		 ?
/D:\dev\Battleships\Battleships\Models\Friend.cs
	namespace 	
Battleships
 
. 
Models 
{ 
public 

class 
Friend 
: 
	BaseModel #
{ 
[		 	
Required			 
]		 
[

 	

ForeignKey

	 
(

 
$str

 %
)

% &
]

& '
public 
Guid 
User1 
{ 
get 
;  
set! $
;$ %
}& '
[ 	
Required	 
] 
[ 	

ForeignKey	 
( 
$str %
)% &
]& '
public 
Guid 
User2 
{ 
get 
;  
set! $
;$ %
}& '
} 
} ?A
4D:\dev\Battleships\Battleships\Models\GameSession.cs
	namespace 

Battleships 
. 
Models 
{		 
public

 

class

 
GameSession

 
:

  
GameSessionPrototype

 3
{ 
public 
string 
Icon 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
public 
DateTime 
DateCreated #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
TimeSpan 

GameLength "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
GameSessionStatus  
Status! '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
public 
int 
CurrentRound 
{  !
get" %
;% &
set' *
;* +
}, -
=. /
$num0 1
;1 2
public 
string 
EndgameStrategy %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
List 
< 
Player 
> 
Players #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
GameSessionSettings "
Settings# +
{, -
get. 1
;1 2
set3 6
;6 7
}8 9
public 
string 
WinnerId 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
ApplicationUser 
Winner %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
GameSessionDto 
ToDto #
(# $
)$ %
{ 	
var 
dto 
= 
new 
GameSessionDto (
(( )
)) *
;* +
dto 
. 
Id 
= 
this 
. 
Id 
; 
dto 
. 
HostId 
= 
this 
. 
Players %
[% &
$num& '
]' (
.( )
Id) +
;+ ,
dto 
. 
HostName 
= 
this 
.  
Players  '
[' (
$num( )
]) *
.* +
Id+ -
.- .
ToString. 6
(6 7
)7 8
;8 9
dto   
.   
Icon   
=   
this   
.   
Icon    
;    !
dto!! 
.!! 
Name!! 
=!! 
this!! 
.!! 
Name!!  
;!!  !
dto"" 
."" 
GridSize"" 
="" 
this"" 
.""  
Settings""  (
.""( )
GridSize"") 1
;""1 2
dto## 
.## 
GameType## 
=## 
this## 
.##  
Settings##  (
.##( )
GameType##) 1
;##1 2
var$$ 
players$$ 
=$$ 
this$$ 
.$$ 
Players$$ &
.$$& '
Select$$' -
($$- .
player$$. 4
=>$$5 7
player$$8 >
.$$> ?

ToLobbyDto$$? I
($$I J
)$$J K
)$$K L
.$$L M
ToList$$M S
($$S T
)$$T U
;$$U V
dto%% 
.%% 
LobbyPlayers%% 
=%% 
players%% &
;%%& '
return'' 
dto'' 
;'' 
}(( 	
private** 
GameSession** 
DeepCopy** $
(**$ %
GameSession**% 0
gameSession**1 <
)**< =
{++ 	
var,, 
shallowCopy,, 
=,, 
ShallowClone,, *
(,,* +
),,+ ,
as,,- /
GameSession,,0 ;
;,,; <
var-- 
settings-- 
=-- 
shallowCopy-- &
.--& '
Settings--' /
;--/ 0
var// 
	playerOne// 
=// 
new// 
Player//  &
(//& '
gameSession//' 2
,//2 3
true//4 8
,//8 9
gameSession//: E
.//E F
Players//F M
[//M N
$num//N O
]//O P
.//P Q
UserId//Q W
)//W X
;//X Y
var00 
	playerTwo00 
=00 
new00 
Player00  &
(00& '
gameSession00' 2
,002 3
false004 9
,009 :
gameSession00; F
.00F G
Players00G N
[00N O
$num00O P
]00P Q
.00Q R
UserId00R X
)00X Y
;00Y Z
var11 
players11 
=11 
new11 
List11 "
<11" #
Player11# )
>11) *
{11* +
	playerOne11, 5
,116 7
	playerTwo118 A
}11A B
;11B C
var33 
session33 
=33 
new33 
GameSession33 )
{44 
Icon55 
=55 
gameSession55 "
.55" #
Icon55# '
,55' (
Name66 
=66 
gameSession66 "
.66" #
Name66# '
,66' (
DateCreated77 
=77 
gameSession77 )
.77) *
DateCreated77* 5
,775 6

GameLength88 
=88 
gameSession88 (
.88( )

GameLength88) 3
,883 4
Status99 
=99 
gameSession99 $
.99$ %
Status99% +
,99+ ,
CurrentRound:: 
=:: 
gameSession:: *
.::* +
CurrentRound::+ 7
,::7 8
EndgameStrategy;; 
=;;  !
gameSession;;" -
.;;- .
EndgameStrategy;;. =
,;;= >
Players<< 
=<< 
players<< !
,<<! "
Settings== 
=== 
settings== #
,==# $
}>> 
;>> 
return@@ 
session@@ 
;@@ 
}AA 	
publicCC 
GameSessionCC 
(CC 
)CC 
{DD 	
}FF 	
publicHH 
overrideHH 
stringHH 
ToStringHH '
(HH' (
)HH( )
{II 	
returnJJ 
thisJJ 
.JJ 
IdJJ 
.JJ 
ToStringJJ #
(JJ# $
)JJ$ %
+JJ& '
$strJJ( +
+JJ, -
thisJJ. 2
.JJ2 3
NameJJ3 7
+JJ8 9
$strJJ: =
+JJ> ?
thisJJ@ D
.JJD E
IconJJE I
+JJJ K
$strJJL O
+JJP Q
thisJJR V
.JJV W
PlayersJJW ^
[JJ^ _
$numJJ_ `
]JJ` a
.JJa b
IdJJb d
;JJd e
}KK 	
publicMM 
overrideMM  
GameSessionPrototypeMM ,
ShallowCloneMM- 9
(MM9 :
)MM: ;
{NN 	
returnOO 
thisOO 
.OO 
MemberwiseCloneOO '
(OO' (
)OO( )
asOO* , 
GameSessionPrototypeOO- A
;OOA B
}PP 	
publicRR 
overrideRR  
GameSessionPrototypeRR ,
	DeepCloneRR- 6
(RR6 7
GameSessionRR7 B 
gameSessionPrototypeRRC W
)RRW X
{SS 	
varTT 
copiedSessionTT 
=TT 
DeepCopyTT  (
(TT( ) 
gameSessionPrototypeTT) =
)TT= >
;TT> ?
returnUU 
copiedSessionUU  
;UU  !
}VV 	
}WW 
}XX ?
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
} ?
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
} ?
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
})) 	
}** 
}++ ?
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
}<< ?
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
{1 2
State2 7
.7 8
GetState8 @
(@ A
)A B
}B C
$strC D
"D E
;E F
}		 	
}

 
} ?
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
{		. /
State		/ 4
.		4 5
GetState		5 =
(		= >
)		> ?
}		? @
$str		@ A
"		A B
;		B C
}

 	
} 
} ?
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
{. /
State/ 4
.4 5
GetState5 =
(= >
)> ?
}? @
$str@ A
"A B
;B C
} 	
}		 
}

 ?
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
{0 1
State1 6
.6 7
GetState7 ?
(? @
)@ A
}A B
$strB C
"C D
;D E
} 	
}		 
}

 ?
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
{, -
State- 2
.2 3
GetState3 ;
(; <
)< =
}= >
$str> ?
"? @
;@ A
} 	
}		 
}

 ?
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
}8 9
[ 	
	NotMapped	 
] 
public 

IShipState 
State 
{  !
get" %
;% &
set' *
;* +
}, -
public 
abstract 
void 
ChangeState (
(( )
)) *
;* +
} 
} ?
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
{0 1
State1 6
.6 7
GetState7 ?
(? @
)@ A
}A B
$strB C
"C D
;D E
} 	
}		 
}

 ?
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
} ?
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
} ?	
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
} ?

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

static 
class 
Program 
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
} 	
private 
static 
IHostBuilder #
CreateHostBuilder$ 5
(5 6
string6 <
[< =
]= >
args? C
)C D
=>E G
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
} ?
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
private 
readonly 

Dictionary #
<# $
string$ *
,* + 
AchievementPrototype, @
>@ A
_achievementsB O
=P Q
newR U
(U V
)V W
;X Y
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
 
=>

 
_achievements

  
[

  !
	shortName

! *
]

* +
;

+ ,
set 
=> 
_achievements  
.  !
Add! $
($ %
	shortName% .
,. /
value0 5
)5 6
;6 7
} 	
} 
} ?
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
}		 ?
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
 ?H
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
{ 
private 
readonly  
ApplicationDbContext -
_context. 6
;6 7
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
projectionExpression	lln ?
)
ll? ?
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
}tt ?
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
}'' ?	
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
} ?O
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
}dd ?
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
} ?
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
} ?
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
} ?
AD:\dev\Battleships\Battleships\Repositories\IPlayersRepository.cs
	namespace 	
Battleships
 
. 
Repositories "
{ 
public 

	interface 
IPlayersRepository '
:( )
IRepository* 5
<5 6
Player6 <
>< =
{ 
} 
} ?
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
} ?
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
 ?
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
} ?	
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
} ?
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
} ?
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
})) 
}** ?
ID:\dev\Battleships\Battleships\Services\Achievement\AchievementService.cs
	namespace 	
Battleships
 
. 
Services 
. 
Achievement *
{		 
public

 

class

 
AchievementService

 #
:

$ %
IAchievementService

& 9
{ 
private 
readonly  
IBattleshipsDatabase - 
_battleshipsDatabase. B
;B C
public 
AchievementService !
(" # 
IBattleshipsDatabase# 7
battleshipsDatabase8 K
)K L
{ 	 
_battleshipsDatabase  
=! "
battleshipsDatabase# 6
;6 7
} 	
public 
async 
Task 
< 
List 
< 
AchievementDto -
>- .
>. /
ListAchievements0 @
(@ A
)A B
{ 	
var 
allAchievements 
=  !
await" ' 
_battleshipsDatabase( <
.< ="
AchievementsRepository= S
.S T
GetAllT Z
(Z [
)[ \
;\ ]
return 
allAchievements "
. 
Select 
( 
item 
=> 
new  #
AchievementDto$ 2
{ 
Name 
= 
item 
.  
Name  $
,$ %
Description 
=  !
item" &
.& '
Description' 2
} 
) 
. 
ToList 
( 
) 
; 
} 	
} 
}   ?
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
} ?.
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
}DD ?1
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
new"" 
PasswordException"" +
(""+ ,
$str"", >
)""> ?
;""? @
}## 
var%% 
jwtToken%% 
=%% 
CreateJwtToken%% )
(%%) *
user%%* .
)%%. /
;%%/ 0
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
;77P Q
await88 
_userManager88 
.88 
AddPasswordAsync88 /
(88/ 0
createdUser880 ;
,88; <
userCredentialsDto88= O
.88O P
Password88P X
)88X Y
;88Y Z
}99 	
private;; 
static;; 
string;; 
CreateJwtToken;; ,
(;;, -
ApplicationUser;;- <
user;;= A
);;A B
{<< 	
var== 
tokenDescriptor== 
===  !
new==" %#
SecurityTokenDescriptor==& =
{>> 
Subject?? 
=?? 
GetClaimsIdentity?? +
(??+ ,
user??, 0
)??0 1
,??1 2
Expires@@ 
=@@ 
DateTime@@ "
.@@" #
UtcNow@@# )
.@@) *
AddHours@@* 2
(@@2 3
$num@@3 5
)@@5 6
,@@6 7
SigningCredentialsAA "
=AA# $
newBB 
SigningCredentialsBB *
(BB* +!
AuthenticationUtilityCC -
.CC- .#
GetSymmetricSecurityKeyCC. E
(CCE F
)CCF G
,CCG H
SecurityAlgorithmsDD *
.DD* +

HmacSha256DD+ 5
)EE 
}FF 
;FF 
varHH 
tokenHandlerHH 
=HH 
newHH "#
JwtSecurityTokenHandlerHH# :
(HH: ;
)HH; <
;HH< =
varII 
securityTokenII 
=II 
tokenHandlerII  ,
.II, -
CreateTokenII- 8
(II8 9
tokenDescriptorII9 H
)IIH I
;III J
varJJ 
tokenJJ 
=JJ 
tokenHandlerJJ $
.JJ$ %

WriteTokenJJ% /
(JJ/ 0
securityTokenJJ0 =
)JJ= >
;JJ> ?
returnLL 
tokenLL 
;LL 
}MM 	
privateOO 
staticOO 
ClaimsIdentityOO %
GetClaimsIdentityOO& 7
(OO7 8
ApplicationUserOO8 G
userOOH L
)OOL M
{PP 	
varQQ 
claimsQQ 
=QQ 
	GetClaimsQQ "
(QQ" #
userQQ# '
)QQ' (
;QQ( )
varRR 
claimsIdentityRR 
=RR  
newRR! $
ClaimsIdentityRR% 3
(RR3 4
claimsRR4 :
)RR: ;
;RR; <
returnTT 
claimsIdentityTT !
;TT! "
}UU 	
privateWW 
staticWW 
ListWW 
<WW 
ClaimWW !
>WW! "
	GetClaimsWW# ,
(WW, -
ApplicationUserWW- <
userWW= A
)WWA B
{XX 	
varYY 
claimsYY 
=YY 
newYY 
ListYY !
<YY! "
ClaimYY" '
>YY' (
{ZZ 
new[[ 
([[ 
BattleshipClaims[[ $
.[[$ %
UserId[[% +
,[[+ ,
user[[- 1
.[[1 2
Id[[2 4
.[[4 5
ToString[[5 =
([[= >
)[[> ?
)[[? @
}\\ 
;\\ 
return^^ 
claims^^ 
;^^ 
}__ 	
}`` 
}aa ?
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

static 
class !
AuthenticationUtility -
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
} ?
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
}%% ?
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
} ?
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
} ?
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
} ?
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
private 
readonly 
Ship 
_ship #
;# $
public		 
OffState		 
(		 
Ship		 
ship		 !
)		! "
{

 	
_ship 
= 
ship 
; 
} 	
public 
void 
ChangeState 
(  
)  !
{ 	
_ship 
. 
Name 
= 
$str 4
;4 5
_ship 
. 
Description 
= 
$str  B
;B C
} 	
public 
string 
GetState 
( 
)  
{ 	
return 
$str 
; 
} 	
} 
} ?
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
private 
readonly 
Ship 
_ship #
;# $
public		 
OnState		 
(		 
Ship		 
ship		  
)		  !
{

 	
_ship 
= 
ship 
; 
} 	
public 
void 
ChangeState 
(  
)  !
{ 	
_ship 
. 
Name 
= 
$str 3
;3 4
_ship 
. 
Description 
= 
$str  A
;A B
} 	
public 
string 
GetState 
( 
)  
{ 	
return 
$str 
; 
} 	
} 
} ?+
FD:\dev\Battleships\Battleships\Services\Builders\GameSessionBuilder.cs
	namespace 	
Battleships
 
. 
Services 
. 
Builders '
{ 
public 

class 
GameSessionBuilder #
:$ %
IGameSessionBuilder& 9
{		 
private

 
readonly

 
Models

 
.

  
GameSession

  +
_session

, 4
=

5 6
new

7 :
(

: ;
)

; <
;

< =
public 
GameSessionBuilder !
WithIcon" *
(* +
string+ 1
icon2 6
)6 7
{ 	
_session 
. 
Icon 
= 
icon  
;  !
return 
this 
; 
} 	
public 
GameSessionBuilder !
WithName" *
(* +
string+ 1
name2 6
)6 7
{ 	
_session 
. 
Name 
= 
name  
;  !
return 
this 
; 
} 	
public 
GameSessionBuilder !
WithDateCreated" 1
(1 2
DateTime2 :
dateCreated; F
)F G
{ 	
_session 
. 
DateCreated  
=! "
dateCreated# .
;. /
return 
this 
; 
} 	
public 
GameSessionBuilder !
WithGameLength" 0
(0 1
TimeSpan1 9

gameLength: D
)D E
{ 	
_session   
.   

GameLength   
=    !

gameLength  " ,
;  , -
return!! 
this!! 
;!! 
}"" 	
public$$ 
GameSessionBuilder$$ !
WithPlayers$$" -
($$- .
List$$. 2
<$$2 3
Player$$3 9
>$$9 :
players$$; B
)$$B C
{%% 	
_session&& 
.&& 
Players&& 
=&& 
players&& &
;&&& '
return'' 
this'' 
;'' 
}(( 	
public** 
GameSessionBuilder** !
WithSessionSettings**" 5
(**5 6
GameSessionSettings**6 I
settings**J R
)**R S
{++ 	
_session,, 
.,, 
Settings,, 
=,, 
settings,,  (
;,,( )
_session-- 
.-- 
EndgameStrategy-- $
=--% &$
GetEndgameStrategyString--' ?
(--? @
settings--@ H
)--H I
;--I J
return.. 
this.. 
;.. 
}// 	
public11 
GameSessionBuilder11 !
WithCurrentRound11" 2
(112 3
int113 6
round117 <
)11< =
{22 	
_session33 
.33 
CurrentRound33 !
=33" #
round33$ )
;33) *
return44 
this44 
;44 
}55 	
private77 
static77 
string77 $
GetEndgameStrategyString77 6
(776 7
GameSessionSettings777 J
settings77K S
)77S T
{88 	
if99 
(99 
settings99 
.99 
GameType99 !
==99" $
	GameTypes99% .
.99. /

DeathMatch99/ 9
)999 :
{:: 
return;; 
Data;; 
.;; 
	Constants;; %
.;;% &
EndgameStrategies;;& 7
.;;7 8

DeathMatch;;8 B
;;;B C
}<< 
if>> 
(>> 
settings>> 
.>> 
GameType>> !
==>>" $
	GameTypes>>% .
.>>. /
Classic>>/ 6
)>>6 7
{?? 
return@@ 
Data@@ 
.@@ 
	Constants@@ %
.@@% &
EndgameStrategies@@& 7
.@@7 8
Classic@@8 ?
;@@? @
}AA 
ifCC 
(CC 
settingsCC 
.CC (
DestroyedShipCountForEndgameCC 5
>CC6 7
$numCC8 9
)CC9 :
{DD 
returnEE 
DataEE 
.EE 
	ConstantsEE %
.EE% &
EndgameStrategiesEE& 7
.EE7 8
DestroyedShipCountEE8 J
;EEJ K
}FF 
ifHH 
(HH 
settingsHH 
.HH %
RoundCountLimitForEndgameHH 2
>HH3 4
$numHH5 6
)HH6 7
{II 
returnJJ 
DataJJ 
.JJ 
	ConstantsJJ %
.JJ% &
EndgameStrategiesJJ& 7
.JJ7 8
RoundCountLimitJJ8 G
;JJG H
}KK 
returnMM 
nullMM 
;MM 
}NN 	
publicPP 
GameSessionBuilderPP !

WithStatusPP" ,
(PP, -
GameSessionStatusPP- >
statusPP? E
)PPE F
{QQ 	
_sessionRR 
.RR 
StatusRR 
=RR 
statusRR $
;RR$ %
returnTT 
thisTT 
;TT 
}UU 	
publicWW 
ModelsWW 
.WW 
GameSessionWW !
BuildWW" '
(WW' (
)WW( )
{XX 	
returnYY 
thisYY 
.YY 
_sessionYY  
;YY  !
}ZZ 	
}[[ 
}\\ ?	
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
 	
_builder 
= 
builder 
; 
} 	
public 
void &
BuildDefaultMinimalSession .
(. /
)/ 0
{ 	
_builder 
. 
WithIcon 
( 
$str  
)  !
;! "
_builder 
. 
WithName 
( 
$str $
)$ %
;% &
_builder 
. 
WithDateCreated $
($ %
DateTime% -
.- .
Now. 1
)1 2
;2 3
} 	
} 
} ?
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
} ?
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
} ?
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
readonly		 
ShipTile		 !
shipTile		" *
=		+ ,
new		- 0
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
returnII 
shipTileII 
;II 
}JJ 	
}KK 
}LL ?

>D:\dev\Battleships\Battleships\Services\EmailSendingService.cs
	namespace 	
Battleships
 
. 
Services 
{ 
public 

class 
EmailSendingService $
{ 
public 
void 
FinishSendEmail #
(# $
Email$ )
email* /
)/ 0
{ 	
var		 
provider		 
=		 "
GetAgencyEmailProvider		 1
(		1 2
email		2 7
.		7 8
Provider		8 @
)		@ A
;		A B
provider 
. 
	SendEmail 
( 
email $
)$ %
;% &
} 	
private 
static 
IEmailProvider %"
GetAgencyEmailProvider& <
(< =
string= C
providerD L
)L M
{ 	
if 
( 
provider 
== 
$str "
)" #
{ 
return 
new 
SmtpEmailProvider ,
(, -
)- .
;. /
} 
return 
new !
SendGridEmailProvider ,
(, -
)- .
;. /
} 	
} 
} ?
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
}11 ?
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
private%% 
static%% 
bool%% %
IsAllPlayerShipsDestroyed%% 5
(%%5 6
List%%6 :
<%%: ;
ShipTile%%; C
>%%C D
tiles%%E J
,%%J K
Guid%%L P
playerId%%Q Y
)%%Y Z
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
}// ?
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
private"" 
static"" 
bool"" 
IsShipDestroyed"" +
(""+ ,
List"", 0
<""0 1
ShipTile""1 9
>""9 :
tiles""; @
,""@ A
Guid""B F
playerShipId""G S
)""S T
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
;++ ?)
^D:\dev\Battleships\Battleships\Services\EndgameStrategies\DestroyedShipCountEndgameStrategy.cs
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
 -
!DestroyedShipCountEndgameStrategy

 2
:

3 4
IEndgameStrategy

5 E
{ 
private 
readonly  
IBattleshipsDatabase - 
_battleshipsDatabase. B
;B C
public -
!DestroyedShipCountEndgameStrategy 0
(0 1 
IBattleshipsDatabase1 E
battleshipsDatabaseF Y
)Y Z
{ 	 
_battleshipsDatabase  
=! "
battleshipsDatabase# 6
;6 7
} 	
public 
async 
Task 
< 
bool 
> 
IsEndgameReached  0
(0 1
Guid1 5
gameSessionId6 C
)C D
{ 	
var &
requiredDestroyedShipCount *
=+ ,
await- 2 
_battleshipsDatabase3 G
. "
GameSessionsRepository '
.' ()
GetRequiredDestroyedShipCount( E
(E F
gameSessionIdF S
)S T
;T U
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
var 
	playerIds 
= 
tiles !
.! "
Select" (
(( )
tile) -
=>. 0
tile1 5
.5 6

PlayerShip6 @
.@ A
PlayerIdA I
)I J
.J K
DistinctK S
(S T
)T U
.U V
ToListV \
(\ ]
)] ^
;^ _
var %
destroyedPlayerShipCounts )
=* +
	playerIds, 5
.5 6
Select6 <
(< =
playerId= E
=>F H'
GetDestroyedPlayerShipCountI d
(d e
tilese j
,j k
playerIdl t
)t u
)u v
;v w
return %
destroyedPlayerShipCounts ,
., -
Any- 0
(0 1
count1 6
=>7 9
count: ?
>=@ B&
requiredDestroyedShipCountC ]
)] ^
;^ _
} 	
private 
static 
int '
GetDestroyedPlayerShipCount 6
(6 7
List7 ;
<; <
ShipTile< D
>D E
tilesF K
,K L
GuidM Q
playerIdR Z
)Z [
{   	
var!! 
playerTiles!! 
=!! 
tiles!! #
.!!# $
Where!!$ )
(!!) *
tile!!* .
=>!!/ 1
tile!!2 6
.!!6 7

PlayerShip!!7 A
.!!A B
PlayerId!!B J
==!!K M
playerId!!N V
)!!V W
.!!W X
ToList!!X ^
(!!^ _
)!!_ `
;!!` a
var"" 
playerShipIds"" 
="" 
tiles""  %
.## 
Where## 
(## 
tile## 
=>## 
tile## #
.### $
PlayerShipId##$ 0
is##1 3
not##4 7
null##8 <
)##< =
.$$ 
Select$$ 
($$ 
tile$$ 
=>$$ 
tile$$  $
.$$$ %
PlayerShipId$$% 1
.$$1 2
Value$$2 7
)$$7 8
.%% 
Distinct%% 
(%% 
)%% 
.&& 
ToList&& 
(&& 
)&& 
;&& 
var(( 
destroyedShipCount(( "
=((# $
playerShipIds((% 2
.((2 3
Count((3 8
(((8 9
id((9 ;
=>((< >
IsShipDestroyed((? N
(((N O
playerTiles((O Z
,((Z [
id((\ ^
)((^ _
)((_ `
;((` a
return** 
destroyedShipCount** %
;**% &
}++ 	
private-- 
static-- 
bool-- 
IsShipDestroyed-- +
(--+ ,
List--, 0
<--0 1
ShipTile--1 9
>--9 :
tiles--; @
,--@ A
Guid--B F
playerShipId--G S
)--S T
{.. 	
return// 
tiles// 
.00 
Where00 
(00 
tile00 
=>00 
tile00 #
.00# $
PlayerShipId00$ 0
==001 3
playerShipId004 @
)00@ A
.11 
All11 
(11 
tile11 
=>11 
tile11 !
.11! "
IsDestroyed11" -
)11- .
;11. /
}22 	
public44 
string44 
StrategyType44 "
=>44# %
Data44& *
.44* +
	Constants44+ 4
.444 5
EndgameStrategies445 F
.44F G
DestroyedShipCount44G Y
;44Y Z
}55 
}66 ?
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
} ?
[D:\dev\Battleships\Battleships\Services\EndgameStrategies\RoundCountLimitEndgameStrategy.cs
	namespace 	
Battleships
 
. 
Services 
. 
EndgameStrategies 0
{ 
public 

class *
RoundCountLimitEndgameStrategy /
:0 1
IEndgameStrategy2 B
{ 
private		 
readonly		  
IBattleshipsDatabase		 - 
_battleshipsDatabase		. B
;		B C
public *
RoundCountLimitEndgameStrategy -
(- . 
IBattleshipsDatabase  
battleshipsDatabase! 4
) 	
{ 	 
_battleshipsDatabase  
=! "
battleshipsDatabase# 6
;6 7
} 	
public 
async 
Task 
< 
bool 
> 
IsEndgameReached  0
(0 1
Guid1 5
gameSessionId6 C
)C D
{ 	
var 
round 
= 
await  
_battleshipsDatabase 2
.2 3"
GameSessionsRepository3 I
.I J
GetCurrentRoundJ Y
(Y Z
gameSessionIdZ g
)g h
;h i
var 
settings 
= 
await   
_battleshipsDatabase! 5
.5 6)
GameSessionSettingsRepository6 S
.S T
GetBySessionIdT b
(b c
gameSessionIdc p
)p q
;q r
return 
round 
>= 
settings $
.$ %%
RoundCountLimitForEndgame% >
;> ?
} 	
public 
string 
StrategyType "
=># %
Data& *
.* +
	Constants+ 4
.4 5
EndgameStrategies5 F
.F G
RoundCountLimitG V
;V W
} 
} ?
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
}   ?H
AD:\dev\Battleships\Battleships\Services\Friends\FriendsService.cs
	namespace 	
Battleships
 
. 
Services 
. 
Friends &
{ 
public 

class 
FriendsService 
:  !
IFriendsService" 1
{ 
private 
readonly  
IBattleshipsDatabase -
_db. 1
;1 2
private 
readonly 
IUserManager %
_userManager& 2
;2 3
private 
readonly 
ICurrentUserService ,
_currentUserService- @
;@ A
public 
FriendsService 
(  
IBattleshipsDatabase 3
database4 <
,< =
IUserManager> J
userManagerK V
,V W
ICurrentUserServiceX k
currentUserServicel ~
)~ 
{ 	
_db 
= 
database 
; 
_userManager 
= 
userManager &
;& '
_currentUserService 
=  !
currentUserService" 4
;4 5
} 	
public 
async 
Task 
< 
List 
< 
	FriendDto (
>( )
>) *
ListFriends+ 6
(6 7
)7 8
{ 	
var 
currentUserId 
= 
_currentUserService  3
.3 4
GetCurrentUserId4 D
(D E
)E F
;F G
var   

friendsIds   
=   
await   "
GetFriendsIds  # 0
(  0 1
currentUserId  1 >
)  > ?
;  ? @
var!! 
friendsUsers!! 
=!! 
await!! $
_userManager!!% 1
.!!1 2
GetFriendsList!!2 @
(!!@ A
currentUserId!!A N
,!!N O

friendsIds!!P Z
)!!Z [
;!![ \
var## 
friends## 
=## 
friendsUsers## &
.##& '
Select##' -
(##- .
user##. 2
=>##3 5
new##6 9
	FriendDto##: C
{$$ 
Name%% 
=%% 
user%% 
.%% 
UserName%% $
,%%$ %
GamesPlayedCount&&  
=&&! "!
RandomNumberGenerator&&# 8
.&&8 9
GetInt32&&9 A
(&&A B
$num&&B D
,&&D E
$num&&F H
)&&H I
,&&I J
GamesWonCount'' 
='' !
RandomNumberGenerator''  5
.''5 6
GetInt32''6 >
(''> ?
$num''? A
)''A B
,''B C
UserId(( 
=(( 
user(( 
.(( 
Id((  
})) 
))) 
.)) 
ToList)) 
()) 
))) 
;)) 
return++ 
friends++ 
;++ 
},, 	
public.. 
async.. 
Task.. 
<.. 
List.. 
<.. 
string.. %
>..% &
>..& '
GetFriendsIds..( 5
(..5 6
string..6 <
currentUserId..= J
)..J K
{// 	
var00 
friends00 
=00 
await00 
_db00  #
.00# $
FriendsRepository00$ 5
.005 6
GetWhere006 >
(00> ?
user11 
=>11 
user11 
.11 
User111 "
.11" #
ToString11# +
(11+ ,
)11, -
==11. 0
currentUserId111 >
||11? A
user11B F
.11F G
User211G L
.11L M
ToString11M U
(11U V
)11V W
==11X Z
currentUserId11[ h
)11h i
;11i j
var33 

friendsIds33 
=33 
new33  
List33! %
<33% &
string33& ,
>33, -
(33- .
)33. /
;33/ 0
foreach55 
(55 
var55 
friend55 
in55  "
friends55# *
.55* +
Where55+ 0
(550 1
friend551 7
=>558 :
friend55; A
.55A B
User155B G
.55G H
ToString55H P
(55P Q
)55Q R
==55S U
currentUserId55V c
||55d f
friend55g m
.55m n
User255n s
.55s t
ToString55t |
(55| }
)55} ~
==	55 ?
currentUserId
55? ?
)
55? ?
)
55? ?
{66 
if77 
(77 
friend77 
.77 
User177  
.77  !
ToString77! )
(77) *
)77* +
==77, .
currentUserId77/ <
)77< =
{88 

friendsIds99 
.99 
Add99 "
(99" #
friend99# )
.99) *
User299* /
.99/ 0
ToString990 8
(998 9
)999 :
)99: ;
;99; <
}:: 
else;; 
if;; 
(;; 
friend;; 
.;;  
User2;;  %
.;;% &
ToString;;& .
(;;. /
);;/ 0
==;;1 3
currentUserId;;4 A
);;A B
{<< 

friendsIds== 
.== 
Add== "
(==" #
friend==# )
.==) *
User1==* /
.==/ 0
ToString==0 8
(==8 9
)==9 :
)==: ;
;==; <
}>> 
}?? 
returnAA 

friendsIdsAA 
;AA 
}BB 	
publicDD 
asyncDD 
TaskDD 
<DD 
boolDD 
>DD 
	AddFriendDD  )
(DD) *
stringDD* 0
userIdDD1 7
)DD7 8
{EE 	
varFF 
currentUserIdFF 
=FF 
_currentUserServiceFF  3
.FF3 4
GetCurrentUserIdFF4 D
(FFD E
)FFE F
;FFF G
varGG 

friendsIdsGG 
=GG 
GetFriendsIdsGG *
(GG* +
currentUserIdGG+ 8
)GG8 9
.GG9 :
ResultGG: @
;GG@ A
ifII 
(II 
userIdII 
!=II 
nullII 
&&II !
userIdII" (
!=II) +
currentUserIdII, 9
&&II: <
!II= >

friendsIdsII> H
.IIH I
ContainsIII Q
(IIQ R
userIdIIR X
.IIX Y
ToStringIIY a
(IIa b
)IIb c
)IIc d
)IId e
{JJ 
varKK 
	newFriendKK 
=KK 
newKK  #
FriendKK$ *
(KK* +
)KK+ ,
{LL 
User1MM 
=MM 
GuidMM  
.MM  !
ParseMM! &
(MM& '
currentUserIdMM' 4
)MM4 5
,MM5 6
User2NN 
=NN 
GuidNN  
.NN  !
ParseNN! &
(NN& '
userIdNN' -
)NN- .
}OO 
;OO 
awaitPP 
_dbPP 
.PP 
FriendsRepositoryPP +
.PP+ ,
CreatePP, 2
(PP2 3
	newFriendPP3 <
)PP< =
;PP= >
returnRR 
trueRR 
;RR 
}SS 
returnUU 
falseUU 
;UU 
}VV 	
publicXX 
asyncXX 
TaskXX 
<XX 
boolXX 
>XX 
RemoveFriendXX  ,
(XX, -
	FriendDtoXX- 6
friendXX7 =
)XX= >
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
var\\ 
friends\\ 
=\\ 
await\\ 
_db\\  #
.\\# $
FriendsRepository\\$ 5
.\\5 6
GetWhere\\6 >
(\\> ?
user]] 
=>]] 
(]] 
user]] 
.]] 
User1]] 
.]]  
ToString]]  (
(]]( )
)]]) *
==]]+ -
currentUserId]]. ;
&&]]< >
user]]? C
.]]C D
User2]]D I
.]]I J
ToString]]J R
(]]R S
)]]S T
==]]U W
friend]]X ^
.]]^ _
UserId]]_ e
)]]e f
||^^ 
(^^ 
user^^ 
.^^ 
User1^^ 
.^^ 
ToString^^ #
(^^# $
)^^$ %
==^^& (
friend^^) /
.^^/ 0
UserId^^0 6
&&^^7 9
user^^: >
.^^> ?
User2^^? D
.^^D E
ToString^^E M
(^^M N
)^^N O
==^^P R
currentUserId^^S `
)^^` a
)^^a b
;^^b c
await`` 
_db`` 
.`` 
FriendsRepository`` '
.``' (

DeleteMany``( 2
(``2 3
friends``3 :
)``: ;
;``; <
returnbb 
falsebb 
;bb 
}cc 	
}dd 
}ee ?
MD:\dev\Battleships\Battleships\Services\Friends\Interfaces\IFriendsService.cs
	namespace 	
Battleships
 
. 
Services 
. 
Friends &
.& '

Interfaces' 1
{ 
public 

	interface 
IFriendsService $
{ 
Task		 
<		 
List		 
<		 
	FriendDto		 
>		 
>		 
ListFriends		 )
(		) *
)		* +
;		+ ,
Task 
< 
bool 
> 
	AddFriend 
( 
string #
userId$ *
)* +
;+ ,
Task 
< 
bool 
> 
RemoveFriend 
(  
	FriendDto  )
friend* 0
)0 1
;1 2
} 
} ?%
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
}   	
public"" 
async"" 
Task"" 

LaunchGame"" $
(""$ %
Guid""% )
gameSessionId""* 7
)""7 8
{## 	
var$$ 
gameSession$$ 
=$$ 
await$$ # 
_battleshipsDatabase$$$ 8
.$$8 9"
GameSessionsRepository$$9 O
.$$O P
GetById$$P W
($$W X
gameSessionId$$X e
)$$e f
;$$f g
var%% 
playerShips%% 
=%% 
await%% #(
_playerShipGenerationService%%$ @
.%%@ A
GeneratePlayerShips%%A T
(%%T U
gameSession%%U `
.%%` a
Settings%%a i
)%%i j
;%%j k
gameSession'' 
.'' 
Status'' 
=''  
GameSessionStatus''! 2
.''2 3

InProgress''3 =
;''= >
await))  
_battleshipsDatabase)) &
.))& '!
PlayerShipsRepository))' <
.))< =

CreateMany))= G
())G H
playerShips))H S
)))S T
;))T U
await**  
_battleshipsDatabase** &
.**& '"
GameSessionsRepository**' =
.**= >
Update**> D
(**D E
gameSession**E P
)**P Q
;**Q R
}++ 	
private-- 
async-- 
Task-- 
LaunchRematch-- (
(--( )
Guid--) -
gameSessionId--. ;
)--; <
{.. 	
var// 
gameSession// 
=// 
await// # 
_battleshipsDatabase//$ 8
.//8 9"
GameSessionsRepository//9 O
.//O P%
GetWithPlayersAndSettings//P i
(//i j
gameSessionId//j w
)//w x
;//x y
var00 
deepCopy00 
=00 
gameSession00 &
.00& '
	DeepClone00' 0
(000 1
gameSession001 <
)00< =
as00> @
Models00A G
.00G H
GameSession00H S
;00S T
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
;22j k
if44 
(44 
deepCopy44 
!=44 
null44  
)44  !
{55 
deepCopy66 
.66 
Status66 
=66  !
GameSessionStatus66" 3
.663 4

InProgress664 >
;66> ?
await88  
_battleshipsDatabase88 *
.88* +!
PlayerShipsRepository88+ @
.88@ A

CreateMany88A K
(88K L
playerShips88L W
)88W X
;88X Y
await99  
_battleshipsDatabase99 *
.99* +"
GameSessionsRepository99+ A
.99A B
Update99B H
(99H I
deepCopy99I Q
)99Q R
;99R S
}:: 
};; 	
}<< 
}== ?W
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
GameSessionRequestDto##. C
gameSessionDto##D R
)##R S
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
,%%X Y
gameSessionDto%%Z h
)%%h i
;%%i j
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
}(( 	
public** 
async** 
Task** 
<** 
List** 
<** 
GameSessionDto** -
>**- .
>**. /
ListAllSessions**0 ?
(**? @
)**@ A
{++ 	
var,, 
models,, 
=,, 
await,,  
_battleshipsDatabase,, 3
.,,3 4"
GameSessionsRepository,,4 J
.,,J K
GetAll,,K Q
(,,Q R
),,R S
;,,S T
if-- 
(-- 
models-- 
is-- 
null-- 
)-- 
return.. 
new.. 
List.. 
<..  
GameSessionDto..  .
>... /
(../ 0
)..0 1
;..1 2
return// 
models// 
.// 
Select//  
(//  !
x//! "
=>//# %
x//& '
.//' (
ToDto//( -
(//- .
)//. /
)/// 0
.//0 1
ToList//1 7
(//7 8
)//8 9
;//9 :
}00 	
public22 
async22 
Task22 
<22 
GameSessionDto22 (
>22( )

GetSession22* 4
(224 5
Guid225 9
id22: <
)22< =
{33 	
return44 
await44  
_battleshipsDatabase44 -
.44- ."
GameSessionsRepository44. D
.44D E
GetDtoWithPlayers44E V
(44V W
id44W Y
)44Y Z
;44Z [
}55 	
public77 
List77 
<77 
GameTile77 
>77 
GetTileDtos77 )
(77) *
List77* .
<77. /
ShipTile77/ 7
>777 8
tiles779 >
,77> ?
int77@ C
columnCount77D O
,77O P
int77Q T
rowCount77U ]
)77] ^
{88 	
var99 
	shipTiles99 
=99 
tiles99 !
.99! "
Where99" '
(99' (
t99( )
=>99* ,
t99- .
.99. /
PlayerShipId99/ ;
is99< >
not99? B
null99C G
)99G H
.99H I
ToList99I O
(99O P
)99P Q
;99Q R
var:: 

emptyTiles:: 
=:: 
tiles:: "
.::" #
Where::# (
(::( )
t::) *
=>::+ -
t::. /
.::/ 0
PlayerShipId::0 <
is::= ?
null::@ D
)::D E
.::E F
ToList::F L
(::L M
)::M N
;::N O
var<< 
dtos<< 
=<< 

Enumerable<< !
.<<! "
Range<<" '
(<<' (
$num<<( )
,<<) *
columnCount<<+ 6
)<<6 7
.<<7 8

SelectMany<<8 B
(<<B C
columnCoordinate<<C S
=><<T V
{== 
return>> 

Enumerable>> !
.>>! "
Range>>" '
(>>' (
$num>>( )
,>>) *
rowCount>>+ 3
)>>3 4
.>>4 5
Select>>5 ;
(>>; <
rowCoordinate>>< I
=>>>J L
{?? 
var@@ 
shipTile@@  
=@@! "
	shipTiles@@# ,
.@@, -
FirstOrDefault@@- ;
(@@; <
st@@< >
=>@@? A
stAA 
.AA 
XCoordinateAA &
==AA' )
columnCoordinateAA* :
&&AA; =
stAA> @
.AA@ A
YCoordinateAAA L
==AAM O
rowCoordinateAAP ]
)BB 
;BB 
varDD 
	emptyTileDD !
=DD" #

emptyTilesDD$ .
.DD. /
FirstOrDefaultDD/ =
(DD= >
stDD> @
=>DDA C
stEE 
.EE 
XCoordinateEE &
==EE' )
columnCoordinateEE* :
&&EE; =
stEE> @
.EE@ A
YCoordinateEEA L
==EEM O
rowCoordinateEEP ]
)FF 
;FF 
varHH 
tileHH 
=HH 
newHH "
GameTileHH# +
{II 
ColumnCoordinateJJ (
=JJ) *
columnCoordinateJJ+ ;
,JJ; <
RowCoordinateKK %
=KK& '
rowCoordinateKK( 5
,KK5 6
IsShipLL 
=LL  
shipTileLL! )
?LL) *
.LL* +
PlayerShipIdLL+ 7
isLL8 :
notLL; >
nullLL? C
,LLC D
IsDestroyedMM #
=MM$ %
(MM& '
shipTileMM' /
?MM/ 0
.MM0 1
IsDestroyedMM1 <
??MM= ?
falseMM@ E
)MME F
||MMG I
(MMJ K
	emptyTileMMK T
?MMT U
.MMU V
IsDestroyedMMV a
??MMb d
falseMMe j
)MMj k
,MMk l
ShipIdNN 
=NN  
shipTileNN! )
!=NN* ,
nullNN- 1
?NN2 3
shipTileNN4 <
.NN< =
PlayerShipIdNN= I
:NNJ K
nullNNL P
,NNP Q
}OO 
;OO 
returnQQ 
tileQQ 
;QQ  
}RR 
)RR 
;RR 
}SS 
)SS 
;SS 
returnUU 
dtosUU 
.UU 
ToListUU 
(UU 
)UU  
;UU  !
}VV 	
publicXX 
asyncXX 
TaskXX 
<XX 
InGameSessionDtoXX *
>XX* +
MoveShipInSessionXX, =
(XX> ?
GuidXX? C
gameSessionIdXXD Q
,XXQ R
GuidXXS W
shipIdXXX ^
,XX^ _
stringXX` f
	directionXXg p
)XXp q
{YY 	
var[[ 

playerShip[[ 
=[[ 
await[[ " 
_battleshipsDatabase[[# 7
.[[7 8!
PlayerShipsRepository[[8 M
.[[M N
GetById[[N U
([[U V
shipId[[V \
)[[\ ]
;[[] ^
var\\ 
playerTiles\\ 
=\\ 
await\\ # 
_battleshipsDatabase\\$ 8
.\\8 9
ShipTilesRepository\\9 L
.\\L M
GetPlayerTiles\\M [
(\\[ \

playerShip\\\ f
.\\f g
PlayerId\\g o
)\\o p
;\\p q
switch^^ 
(^^ 
	direction^^ 
)^^ 
{__ 
case`` 
$str`` 
:`` 
IShipActionCommandaa &
shipMoveUpCommandaa' 8
=aa9 :
newaa; >
ShipMoveUpCommandaa? P
(aaP Q

playerShipaaQ [
)aa[ \
;aa\ ]
shipMoveUpCommandbb %
.bb% &
Executebb& -
(bb- .
)bb. /
;bb/ 0
breakcc 
;cc 
casedd 
$strdd 
:dd 
IShipActionCommandee &
shipMoveDownCommandee' :
=ee; <
newee= @
ShipMoveDownCommandeeA T
(eeT U

playerShipeeU _
)ee_ `
;ee` a
shipMoveDownCommandff '
.ff' (
Executeff( /
(ff/ 0
)ff0 1
;ff1 2
breakgg 
;gg 
casehh 
$strhh 
:hh 
IShipActionCommandii &
shipMoveLeftCommandii' :
=ii; <
newii= @
ShipMoveLeftCommandiiA T
(iiT U

playerShipiiU _
)ii_ `
;ii` a
shipMoveLeftCommandjj '
.jj' (
Executejj( /
(jj/ 0
)jj0 1
;jj1 2
breakkk 
;kk 
casell 
$strll 
:ll 
IShipActionCommandmm & 
shipMoveRightCommandmm' ;
=mm< =
newmm> A 
ShipMoveRightCommandmmB V
(mmV W

playerShipmmW a
)mma b
;mmb c 
shipMoveRightCommandnn (
.nn( )
Executenn) 0
(nn0 1
)nn1 2
;nn2 3
breakoo 
;oo 
}pp 
awaitrr  
_battleshipsDatabaserr &
.rr& '
ShipTilesRepositoryrr' :
.rr: ;

UpdateManyrr; E
(rrE F

playerShiprrF P
.rrP Q
TilesrrQ V
)rrV W
;rrW X
vartt 
gameSessionDtott 
=tt  
awaittt! &'
_inGameSessionHelperServicett' B
.ttB C
GetInGameSessionttC S
(ttS T
gameSessionIdttT a
)tta b
;ttb c
varuu 
updatedPosTilesuu 
=uu  !'
_inGameSessionHelperServiceuu" =
.uu= >
GetTileDtosuu> I
(uuI J
playerTilesuuJ U
,uuU V
gameSessionDtouuW e
.uue f
ColumnCountuuf q
,uuq r
gameSessionDto	uus ?
.
uu? ?
RowCount
uu? ?
)
uu? ?
;
uu? ?
gameSessionDtovv 
.vv 
OwnTilesvv #
=vv$ %
updatedPosTilesvv& 5
;vv5 6
returnxx 
gameSessionDtoxx !
;xx! "
}yy 	
}zz 
}{{ ?5
QD:\dev\Battleships\Battleships\Services\GameSession\InGameSessionHelperService.cs
	namespace 	
Battleships
 
. 
Services 
. 
GameSession *
{ 
public 

class &
InGameSessionHelperService +
:, -'
IInGameSessionHelperService. I
{ 
private 
readonly  
IBattleshipsDatabase - 
_battleshipsDatabase. B
;B C
private 
readonly 
ICurrentUserService ,
_currentUserService- @
;@ A
public &
InGameSessionHelperService )
() * 
IBattleshipsDatabase  
battleshipsDatabase! 4
,4 5
ICurrentUserService 
userService  +
) 	
{ 	 
_battleshipsDatabase  
=! "
battleshipsDatabase# 6
;6 7
_currentUserService 
=  !
userService" -
;- .
} 	
public 
async 
Task 
< 
InGameSessionDto *
>* +
GetInGameSession, <
(< =
Guid= A
gameSessionIdB O
)O P
{ 	
var 
currentUserId 
= 
_currentUserService  3
.3 4
GetCurrentUserId4 D
(D E
)E F
;F G
var   
(   
ownPlayerId   
,   
opponentPlayerId   .
)  . /
=  0 1
await  2 7 
_battleshipsDatabase  8 L
.  L M"
GameSessionsRepository  M c
.  c d
GetPlayerIds  d p
(  p q
gameSessionId  q ~
,  ~ 
currentUserId
  ? ?
)
  ? ?
;
  ? ?
var!! 
ownTiles!! 
=!! 
await!!   
_battleshipsDatabase!!! 5
.!!5 6
ShipTilesRepository!!6 I
.!!I J
GetPlayerTiles!!J X
(!!X Y
ownPlayerId!!Y d
)!!d e
;!!e f
var"" 
opponentTiles"" 
="" 
await""  % 
_battleshipsDatabase""& :
."": ;
ShipTilesRepository""; N
.""N O
GetPlayerTiles""O ]
(""] ^
opponentPlayerId""^ n
)""n o
;""o p
var$$ 
dto$$ 
=$$ 
await$$  
_battleshipsDatabase$$ 0
.$$0 1"
GameSessionsRepository$$1 G
.$$G H
GetInGameSession$$H X
($$X Y
gameSessionId$$Y f
,$$f g
currentUserId$$h u
)$$u v
;$$v w
dto%% 
.%% 
OwnTiles%% 
=%% 
GetTileDtos%% &
(%%& '
ownTiles%%' /
,%%/ 0
dto%%1 4
.%%4 5
ColumnCount%%5 @
,%%@ A
dto%%B E
.%%E F
RowCount%%F N
)%%N O
;%%O P
dto&& 
.&& 
OpponentTiles&& 
=&& 
GetTileDtos&&  +
(&&+ ,
opponentTiles&&, 9
,&&9 :
dto&&; >
.&&> ?
ColumnCount&&? J
,&&J K
dto&&L O
.&&O P
RowCount&&P X
)&&X Y
;&&Y Z
return(( 
dto(( 
;(( 
})) 	
public++ 
List++ 
<++ 
GameTile++ 
>++ 
GetTileDtos++ )
(++) *
List++* .
<++. /
ShipTile++/ 7
>++7 8
	shipTiles++9 B
,++B C
int++D G
columnCount++H S
,++S T
int++U X
rowCount++Y a
)++a b
{,, 	
var-- 
tiles-- 
=-- 

Enumerable-- "
.--" #
Range--# (
(--( )
$num--) *
,--* +
columnCount--, 7
)--7 8
.--8 9

SelectMany--9 C
(--C D
columnCoordinate--D T
=>--U W
{.. 
return// 

Enumerable// !
.//! "
Range//" '
(//' (
$num//( )
,//) *
rowCount//+ 3
)//3 4
.//4 5
Select//5 ;
(//; <
rowCoordinate//< I
=>//J L
{00 
var11 
shipTile11  
=11! "
	shipTiles11# ,
.11, -
FirstOrDefault11- ;
(11; <
st11< >
=>11? A
st22 
.22 
XCoordinate22 &
==22' )
columnCoordinate22* :
&&22; =
st22> @
.22@ A
YCoordinate22A L
==22M O
rowCoordinate22P ]
)33 
;33 
IShipAppearance55 #
shipAppearance55$ 2
=553 4
new555 8
ShipAppearance559 G
(55G H
)55H I
;55I J
IShipAppearance66 #
skinDecorator66$ 1
=662 3
new664 7
SkinDecorator668 E
(66E F
shipAppearance66F T
)66T U
.66U V
Draw66V Z
(66Z [
)66[ \
;66\ ]
IShipAppearance77 #
labelDecorator77$ 2
=773 4
new775 8
LabelDecorator779 G
(77G H
skinDecorator77H U
)77U V
.77V W
Draw77W [
(77[ \
)77\ ]
;77] ^
var99 
tile99 
=99 
new99 "
GameTile99# +
{:: 
ColumnCoordinate;; (
=;;) *
columnCoordinate;;+ ;
,;;; <
RowCoordinate<< %
=<<& '
rowCoordinate<<( 5
,<<5 6
IsShip== 
===  
shipTile==! )
is==* ,
not==- 0
null==1 5
,==5 6
IsDestroyed>> #
=>>$ %
shipTile>>& .
?>>. /
.>>/ 0
IsDestroyed>>0 ;
??>>< >
false>>? D
,>>D E
ShipId?? 
=??  
shipTile??! )
???) *
.??* +
PlayerShipId??+ 7
,??7 8
SkinName@@  
=@@! "
shipTile@@# +
!=@@, .
null@@/ 3
?@@4 5
labelDecorator@@6 D
.@@D E
SkinName@@E M
:@@N O
$str@@P R
,@@R S
LabelAA 
=AA 
shipTileAA  (
!=AA) +
nullAA, 0
?AA1 2
labelDecoratorAA3 A
.AAA B
LabelAAB G
:AAH I
$strAAJ L
}BB 
;BB 
returnDD 
tileDD 
;DD  
}EE 
)EE 
;EE 
}FF 
)FF 
;FF 
returnHH 
tilesHH 
.HH 
ToListHH 
(HH  
)HH  !
;HH! "
}JJ 	
}KK 
}LL ?
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
} ?	
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
Task 
< 
InGameSessionDto 
> 
MoveShipInSession 0
(0 1
Guid1 5
gameSessionId6 C
,C D
GuidE I
shipIdJ P
,P Q
stringR X
	directionY b
)b c
;c d
} 
} ?
]D:\dev\Battleships\Battleships\Services\GameSession\Interfaces\IInGameSessionHelperService.cs
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
	interface		 '
IInGameSessionHelperService		 0
{

 
public 
Task 
< 
InGameSessionDto $
>$ %
GetInGameSession& 6
(6 7
Guid7 ;
gameSessionId< I
)I J
;J K
public 
List 
< 
GameTile 
> 
GetTileDtos )
() *
List* .
<. /
ShipTile/ 7
>7 8
	shipTiles9 B
,B C
intD G
columnCountH S
,S T
intU X
rowCountY a
)a b
;b c
} 
} ?
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
} ?F
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
varNN 
(NN 
shipTypeNN 
,NN 
shipSizeNN '
)NN' (
=NN) *
shipTypeTuplesNN+ 9
[NN9 :
playerShipsNN: E
.NNE F
CountNNF K
]NNK L
;NNL M
varPP 
	shipTilesPP 
=PP 

EnumerablePP  *
.PP* +
RangePP+ 0
(PP0 1
rowPP1 4
,PP4 5
shipSizePP6 >
)PP> ?
.PP? @
SelectPP@ F
(PPF G
rawRowNumberPPG S
=>PPT V
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
([[O P
shipType[[P X
)[[X Y
;[[Y Z
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
}jj ?
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
 ?
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
} ?
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
} ?
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
} ?
AD:\dev\Battleships\Battleships\Services\Players\PlayersService.cs
	namespace 	
Battleships
 
. 
Services 
. 
Players &
{ 
public 

class 
PlayersService 
:  !
IPlayersService" 1
{ 
private 
readonly  
IBattleshipsDatabase -
_db. 1
;1 2
private 
readonly 
IUserManager %
_userManager& 2
;2 3
private 
readonly 
ICurrentUserService ,
_currentUserService- @
;@ A
public 
PlayersService 
(  
IBattleshipsDatabase  
database! )
,) *
IUserManager 
userManager $
,$ %
ICurrentUserService 
currentUserService  2
)2 3
{ 	
_db 
= 
database 
; 
_userManager 
= 
userManager &
;& '
_currentUserService 
=  !
currentUserService" 4
;4 5
} 	
public   
async   
Task   
<   
List   
<   
UserDto   &
>  & '
>  ' (
GetAllUsers  ) 4
(  4 5
)  5 6
{!! 	
var"" 
currentUserId"" 
="" 
_currentUserService""  3
.""3 4
GetCurrentUserId""4 D
(""D E
)""E F
;""F G
var$$ 
users$$ 
=$$ 
await$$ 
_userManager$$ *
.$$* +
GetOtherUsers$$+ 8
($$8 9
currentUserId$$9 F
)$$F G
;$$G H
return&& 
users&& 
;&& 
}'' 	
public)) 
async)) 
Task)) 
<)) 
List)) 
<)) 
UserDto)) &
>))& '
>))' (
GetLobbyUsers))) 6
())6 7
Guid))7 ;
gameSessionId))< I
)))I J
{** 	
var++ 
users++ 
=++ 
await++ 
_userManager++ *
.++* +
GetLobbyUsers+++ 8
(++8 9
gameSessionId++9 F
)++F G
;++G H
return-- 
users-- 
;-- 
}.. 	
public00 
async00 
Task00 
InviteUserToGame00 *
(00* +
Guid00+ /
gameSessionId000 =
,00= >
string00? E
userId00F L
)00L M
{11 	
var22 
player22 
=22 
new22 
Player22 #
{33 
GameSessionId44 
=44 
gameSessionId44  -
,44- .
UserId55 
=55 
userId55 
}66 
;66 
await88 
_db88 
.88 
PlayersRepository88 '
.88' (
Create88( .
(88. /
player88/ 5
)885 6
;886 7
}99 	
}:: 
};; ?
=D:\dev\Battleships\Battleships\Services\Users\IUserManager.cs
	namespace		 	
Battleships		
 
.		 
Services		 
.		 
Users		 $
{

 
public 

	interface 
IUserManager !
{ 
Task 
< 
ApplicationUser 
> 
GetById %
(% &
string& ,
userId- 3
)3 4
;4 5

IQueryable 
< 
ApplicationUser "
>" #
Users$ )
{* +
get, /
;/ 0
}1 2

IQueryable 
< 
ApplicationUser "
>" #
GetWhere$ ,
(, -

Expression- 7
<7 8
Func8 <
<< =
ApplicationUser= L
,L M
boolN R
>R S
>S T
filterU [
)[ \
;\ ]
Task 
< 
List 
< 
UserDto 
> 
> 
GetOtherUsers )
() *
string* 0
currentUserId1 >
)> ?
;? @
Task 
< 
List 
< 
UserDto 
> 
> 
GetLobbyUsers )
() *
Guid* .
gameSessionId/ <
)< =
;= >
Task 
< 
List 
< 
ApplicationUser !
>! "
>" #
GetFriendsList$ 2
(2 3
string3 9
currentUserId: G
,G H
ListI M
<M N
stringN T
>T U

friendsIdsV `
)` a
;a b
} 
} ?.
<D:\dev\Battleships\Battleships\Services\Users\UserManager.cs
	namespace 	
Battleships
 
. 
Services 
. 
Users $
;$ %
public 
class 
UserManager 
: 
IUserManager '
{ 
private 
readonly 
UserManager  
<  !
ApplicationUser! 0
>0 1
_userManager2 >
;> ?

IQueryable 
< 
ApplicationUser 
> 
IUserManager  ,
., -
Users- 2
=>3 5
_userManager6 B
.B C
UsersC H
;H I
public 

UserManager 
( 
UserManager "
<" #
ApplicationUser# 2
>2 3
userManager4 ?
)? @
{ 
_userManager 
= 
userManager "
;" #
} 
public 


IQueryable 
< 
ApplicationUser %
>% &
Users' ,
=>- /
_userManager0 <
.< =
Users= B
;B C
public 

async 
Task 
< 
ApplicationUser %
>% &
GetById' .
(. /
string/ 5
userId6 <
)< =
{ 
return 
await 
_userManager !
.! "
FindByIdAsync" /
(/ 0
userId0 6
)6 7
;7 8
} 
public   


IQueryable   
<   
ApplicationUser   %
>  % &
GetWhere  ' /
(  / 0

Expression  0 :
<  : ;
Func  ; ?
<  ? @
ApplicationUser  @ O
,  O P
bool  Q U
>  U V
>  V W
filter  X ^
)  ^ _
{!! 
return"" 
_userManager"" 
."" 
Users"" !
.""! "
Where""" '
(""' (
filter""( .
)"". /
.""/ 0
AsQueryable""0 ;
(""; <
)""< =
;""= >
}## 
public%% 

async%% 
Task%% 
<%% 
List%% 
<%% 
UserDto%% "
>%%" #
>%%# $
GetOtherUsers%%% 2
(%%2 3
string%%3 9
currentUserId%%: G
)%%G H
{&& 
var'' 
users'' 
='' 
await'' 
Users'' 
.''  
Where''  %
(''% &
u''& '
=>''( *
u''+ ,
.'', -
Id''- /
!=''0 2
currentUserId''3 @
)''@ A
.(( 
Select(( 
((( 
u(( 
=>(( 
new(( 
UserDto(( $
{)) 
Id** 
=** 
u** 
.** 
Id** 
,** 
Name++ 
=++ 
u++ 
.++ 
UserName++ !
,++! "
GamesPlayedCount,,  
=,,! "
u,,# $
.,,$ %
Players,,% ,
.,,, -
Count,,- 2
,,,2 3
GamesWonCount-- 
=-- 
u--  !
.--! "
WonGames--" *
.--* +
Count--+ 0
}.. 
).. 
... 
ToListAsync.. 
(.. 
).. 
;.. 
return00 
users00 
;00 
}11 
public33 

async33 
Task33 
<33 
List33 
<33 
UserDto33 "
>33" #
>33# $
GetLobbyUsers33% 2
(332 3
Guid333 7
gameSessionId338 E
)33E F
{44 
var55 
users55 
=55 
await55 
_userManager55 &
.55& '
Users55' ,
.66 
Where66 
(66 
u66 
=>66 
u66 
.66 
Players66 !
.66! "
All66" %
(66% &
p66& '
=>66( *
p66+ ,
.66, -
GameSessionId66- :
!=66; =
gameSessionId66> K
)66K L
)66L M
.77 
Select77 
(77 
u77 
=>77 
new77 
UserDto77 $
{88 
Id99 
=99 
u99 
.99 
Id99 
,99 
Name:: 
=:: 
u:: 
.:: 
UserName:: !
,::! "
GamesPlayedCount;;  
=;;! "
u;;# $
.;;$ %
Players;;% ,
.;;, -
Count;;- 2
,;;2 3
GamesWonCount<< 
=<< 
u<<  !
.<<! "
WonGames<<" *
.<<* +
Count<<+ 0
}== 
)== 
.>> 
ToListAsync>> 
(>> 
)>> 
;>> 
return@@ 
users@@ 
;@@ 
}AA 
publicCC 

asyncCC 
TaskCC 
<CC 
ListCC 
<CC 
ApplicationUserCC *
>CC* +
>CC+ ,
GetFriendsListCC- ;
(CC; <
stringCC< B
currentUserIdCCC P
,CCP Q
ListCCR V
<CCV W
stringCCW ]
>CC] ^

friendsIdsCC_ i
)CCi j
{DD 
returnEE 
awaitEE 
_userManagerEE !
.EE! "
UsersEE" '
.FF 
WhereFF 
(FF 
userFF 
=>FF 

friendsIdsFF )
.FF) *
ContainsFF* 2
(FF2 3
userFF3 7
.FF7 8
IdFF8 :
)FF: ;
)FF; <
.GG 
ToListAsyncGG 
(GG 
)GG 
;GG 
}HH 
}II ?
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
}%% ?
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
}(( ?	
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
} ?
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
} ?
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
} ?l
)D:\dev\Battleships\Battleships\Startup.cs
	namespace   	
Battleships  
 
{!! 
public"" 

class"" 
Startup"" 
{## 
public$$ 
Startup$$ 
($$ 
IConfiguration$$ %
configuration$$& 3
)$$3 4
{%% 	
Configuration&& 
=&& 
configuration&& )
;&&) *
}'' 	
public)) 
IConfiguration)) 
Configuration)) +
{)), -
get)). 1
;))1 2
}))3 4
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
services>> 
.>> 
AddAuthentication>> &
(>>& '
options>>' .
=>>>/ 1
{?? 
options@@ 
.@@ %
DefaultAuthenticateScheme@@ 5
=@@6 7
JwtBearerDefaults@@8 I
.@@I J 
AuthenticationScheme@@J ^
;@@^ _
optionsAA 
.AA "
DefaultChallengeSchemeAA 2
=AA3 4
JwtBearerDefaultsAA5 F
.AAF G 
AuthenticationSchemeAAG [
;AA[ \
optionsBB 
.BB 
DefaultSchemeBB )
=BB* +
JwtBearerDefaultsBB, =
.BB= > 
AuthenticationSchemeBB> R
;BBR S
}CC 
)CC 
.DD 
AddJwtBearerDD 
(DD 
optionsDD %
=>DD& (
{EE 
optionsFF 
.FF  
RequireHttpsMetadataFF 0
=FF1 2
falseFF3 8
;FF8 9
optionsGG 
.GG 
	SaveTokenGG %
=GG& '
falseGG( -
;GG- .
optionsHH 
.HH %
TokenValidationParametersHH 5
=HH6 7
newHH8 ;%
TokenValidationParametersHH< U
{II $
ValidateIssuerSigningKeyJJ 0
=JJ1 2
trueJJ3 7
,JJ7 8
IssuerSigningKeyKK (
=KK) *!
AuthenticationUtilityKK+ @
.KK@ A#
GetSymmetricSecurityKeyKKA X
(KKX Y
)KKY Z
,KKZ [
ValidateIssuerLL &
=LL' (
falseLL) .
,LL. /
ValidateAudienceMM (
=MM) *
falseMM+ 0
,MM0 1
	ClockSkewNN !
=NN" #
TimeSpanNN$ ,
.NN, -
ZeroNN- 1
}OO 
;OO 
}PP 
)PP 
;PP 
servicesQQ 
.QQ #
AddControllersWithViewsQQ ,
(QQ, -
)QQ- .
;QQ. /
servicesRR 
.RR 

AddSignalRRR 
(RR  
)RR  !
;RR! "
servicesSS 
.SS 
AddSpaStaticFilesSS &
(SS& '
configurationSS' 4
=>SS5 7
{SS8 9
configurationSS: G
.SSG H
RootPathSSH P
=SSQ R
$strSSS c
;SSc d
}SSe f
)SSf g
;SSg h
servicesUU 
.VV "
AddHttpContextAccessorVV '
(VV' (
)VV( )
.WW 
	AddScopedWW 
(WW 
typeofWW !
(WW! "
IRepositoryWW" -
<WW- .
>WW. /
)WW/ 0
,WW0 1
typeofWW2 8
(WW8 9
BaseRepositoryWW9 G
<WWG H
>WWH I
)WWI J
)WWJ K
.XX 
	AddScopedXX 
<XX *
IGameSessionSettingsRepositoryXX 9
,XX9 :)
GameSessionSettingsRepositoryXX; X
>XXX Y
(XXY Z
)XXZ [
.YY 
	AddScopedYY 
<YY  
IBattleshipsDatabaseYY /
,YY/ 0
BattleshipsDatabaseYY1 D
>YYD E
(YYE F
)YYF G
.ZZ 
	AddScopedZZ 
<ZZ 
IShipsRepositoryZZ +
,ZZ+ ,
ShipsRepositoryZZ- <
>ZZ< =
(ZZ= >
)ZZ> ?
.[[ 
	AddScoped[[ 
<[[ "
IAuthenticationService[[ 1
,[[1 2!
AuthenticationService[[3 H
>[[H I
([[I J
)[[J K
.\\ 
	AddScoped\\ 
<\\ 
ICurrentUserService\\ .
,\\. /
CurrentUserService\\0 B
>\\B C
(\\C D
)\\D E
.]] 
	AddScoped]] 
<]] 
IGameSessionService]] .
,]]. /
GameSessionService]]0 B
>]]B C
(]]C D
)]]D E
.^^ 
	AddScoped^^ 
<^^ .
"IBattleshipsSynchronizationService^^ =
,^^= >-
!BattleshipsSynchronizationService^^? `
>^^` a
(^^a b
)^^b c
.__ 
	AddScoped__ 
<__ #
IGameSessionsRepository__ 2
,__2 3"
GameSessionsRepository__4 J
>__J K
(__K L
)__L M
.`` 
	AddScoped`` 
<`` 
IPlayersRepository`` -
,``- .
PlayersRepository``/ @
>``@ A
(``A B
)``B C
.aa 
	AddScopedaa 
<aa 
IPlayersServiceaa *
,aa* +
PlayersServiceaa, :
>aa: ;
(aa; <
)aa< =
.bb 
	AddScopedbb 
<bb  
IShipTilesRepositorybb /
,bb/ 0
ShipTilesRepositorybb1 D
>bbD E
(bbE F
)bbF G
.cc 
	AddScopedcc 
<cc #
IAttackExecutionServicecc 2
,cc2 3"
AttackExecutionServicecc4 J
>ccJ K
(ccK L
)ccL M
.dd 
	AddScopeddd 
<dd 
IEndgameServicedd *
,dd* +
EndgameServicedd, :
>dd: ;
(dd; <
)dd< =
.ee 
	AddScopedee 
<ee #
IEndgameStrategyServiceee 2
,ee2 3"
EndgameStrategyServiceee4 J
>eeJ K
(eeK L
)eeL M
.ff 
	AddScopedff 
<ff 
IEndgameStrategyff +
,ff+ ,"
ClassicEndgameStrategyff- C
>ffC D
(ffD E
)ffE F
.gg 
	AddScopedgg 
<gg 
IEndgameStrategygg +
,gg+ ,%
DeathMatchEndgameStrategygg- F
>ggF G
(ggG H
)ggH I
.hh 
	AddScopedhh 
<hh 
IEndgameStrategyhh +
,hh+ ,-
!DestroyedShipCountEndgameStrategyhh- N
>hhN O
(hhO P
)hhP Q
.ii 
	AddScopedii 
<ii 
IEndgameStrategyii +
,ii+ ,*
RoundCountLimitEndgameStrategyii- K
>iiK L
(iiL M
)iiM N
.jj 
	AddScopedjj 
<jj 
IAchievementServicejj .
,jj. /
AchievementServicejj0 B
>jjB C
(jjC D
)jjD E
.kk 
	AddScopedkk 
<kk 
IGameLaunchServicekk -
,kk- .
GameLaunchServicekk/ @
>kk@ A
(kkA B
)kkB C
.ll 
	AddScopedll 
<ll (
IPlayerShipGenerationServicell 7
,ll7 8'
PlayerShipGenerationServicell9 T
>llT U
(llU V
)llV W
.mm 
AddSingletonmm 
<mm "
NumberGeneratorFactorymm 4
>mm4 5
(mm5 6
)mm6 7
.nn 
	AddScopednn 
<nn 
IFriendsServicenn *
,nn* +
FriendsServicenn, :
>nn: ;
(nn; <
)nn< =
.oo 
	AddScopedoo 
<oo '
IInGameSessionHelperServiceoo 6
,oo6 7&
InGameSessionHelperServiceoo8 R
>ooR S
(ooS T
)ooT U
.pp 
	AddScopedpp 
<pp 
IUserManagerpp '
,pp' (
UserManagerpp) 4
>pp4 5
(pp5 6
)pp6 7
;qq 
}rr 	
publictt 
voidtt 
	Configurett 
(tt 
IApplicationBuildertt 1
apptt2 5
,tt5 6
IWebHostEnvironmenttt7 J
envttK N
)ttN O
{uu 	
ifvv 
(vv 
envvv 
.vv 
IsDevelopmentvv !
(vv! "
)vv" #
)vv# $
{ww 
appxx 
.xx %
UseDeveloperExceptionPagexx -
(xx- .
)xx. /
;xx/ 0
appyy 
.yy !
UseMigrationsEndPointyy )
(yy) *
)yy* +
;yy+ ,
}zz 
else{{ 
{|| 
app}} 
.}} 
UseHsts}} 
(}} 
)}} 
;}} 
}~~ 
app
?? 
.
?? !
UseHttpsRedirection
?? #
(
??# $
)
??$ %
;
??% &
app
?? 
.
?? 
UseStaticFiles
?? 
(
?? 
)
??  
;
??  !
if
?? 
(
?? 
!
?? 
env
?? 
.
?? 
IsDevelopment
?? "
(
??" #
)
??# $
)
??$ %
{
?? 
app
?? 
.
?? 
UseSpaStaticFiles
?? %
(
??% &
)
??& '
;
??' (
}
?? 
app
?? 
.
?? 

UseRouting
?? 
(
?? 
)
?? 
;
?? 
app
?? 
.
?? 
UseAuthentication
?? !
(
??! "
)
??" #
;
??# $
app
?? 
.
?? 
UseAuthorization
??  
(
??  !
)
??! "
;
??" #
app
?? 
.
?? 
UseEndpoints
?? 
(
?? 
	endpoints
?? &
=>
??' )
{
?? 
	endpoints
?? 
.
??  
MapControllerRoute
?? ,
(
??, -
name
?? 
:
?? 
$str
?? #
,
??# $
pattern
?? 
:
?? 
$str
?? @
)
??@ A
;
??A B
	endpoints
?? 
.
?? 
MapRazorPages
?? '
(
??' (
)
??( )
;
??) *
	endpoints
?? 
.
?? 
MapHub
??  
<
??  !
BattleshipsHub
??! /
>
??/ 0
(
??0 1
$str
??1 B
,
??B C
options
??D K
=>
??L N
{
?? 
options
?? 
.
?? 

Transports
?? &
=
??' (
HttpTransportType
??) :
.
??: ;

WebSockets
??; E
;
??E F
}
?? 
)
?? 
;
?? 
}
?? 
)
?? 
;
?? 
app
?? 
.
?? 
UseSpa
?? 
(
?? 
spa
?? 
=>
?? 
{
?? 
spa
?? 
.
?? 
Options
?? 
.
?? 

SourcePath
?? &
=
??' (
$str
??) 4
;
??4 5
if
?? 
(
?? 
env
?? 
.
?? 
IsDevelopment
?? %
(
??% &
)
??& '
)
??' (
{
?? 
spa
?? 
.
?? !
UseAngularCliServer
?? +
(
??+ ,
	npmScript
??, 5
:
??5 6
$str
??7 >
)
??> ?
;
??? @
}
?? 
}
?? 
)
?? 
;
?? 

ShipSeeder
?? 
.
?? 
	SeedShips
??  
(
??  !
app
??! $
.
??$ %!
ApplicationServices
??% 8
)
??8 9
;
??9 :
SeedAchievements
?? 
.
?? 
SeedAchs
?? %
(
??% &
app
??& )
.
??) *!
ApplicationServices
??* =
)
??= >
;
??> ?
}
?? 	
}
?? 
}?? ?	
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
_timeUtilityInstance# 7
;7 8
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
_timeUtilityInstance $
is% '
null( ,
), -
{  
_timeUtilityInstance $
=% &
new' *
TimeUtility+ 6
(6 7
)7 8
;8 9
} 
return  
_timeUtilityInstance '
;' (
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