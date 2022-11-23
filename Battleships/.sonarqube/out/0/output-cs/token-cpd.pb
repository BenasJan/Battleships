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
} á
8D:\dev\Battleships\Battleships\Adapter\IEmailProvider.cs
	namespace 	
Battleships
 
. 
Adapter 
{ 
public 

	interface 
IEmailProvider #
{ 
void 
	SendEmail 
( 
Email 
email "
)" #
;# $
} 
} ü'
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
{ 
SendGridClient		 
client		 
=		 
new		  #
SendGridClient		$ 2
(		2 3
$str		3 z
)		z {
;		{ |
EmailAddress

 
from

 
=

 
new

 
EmailAddress

  ,
(

, -
$str

- F
,

F G
$str

H U
)

U V
;

V W
public 
async 
void 
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
(2 3
from3 7
,7 8
to9 ;
,; <
subject= D
,D E
plainTextContentF V
,V W
htmlContentX c
)c d
;d e
var 
response 
= 
await  
client! '
.' (
SendEmailAsync( 6
(6 7
msg7 :
): ;
;; <
} 	
public 
async 
void 
SendToAllRecipients -
(- .
). /
{ 	
var 
tos 
= 
new 
List 
< 
EmailAddress +
>+ ,
{ 
new 
EmailAddress  
(  !
$str! 4
,4 5
$str6 E
)E F
,F G
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
} 
; 
var 
subjects 
= 
new 
List #
<# $
string$ *
>* +
{, -
$str. =
,= >
$str? N
,N O
$strP _
}` a
;a b
var 
plainTextContent  
=! "
$str# 1
;1 2
var 
htmlContent 
= 
$str .
;. /
var   
substitutions   
=   
new    #
List  $ (
<  ( )

Dictionary  ) 3
<  3 4
string  4 :
,  : ;
string  < B
>  B C
>  C D
{!! 
new"" 

Dictionary"" 
<"" 
string"" %
,""% &
string""' -
>""- .
("". /
)""/ 0
{""1 2
{""2 3
$str""3 ;
,""; <
$str""= D
}""D E
}""E F
,""F G
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
}%% 
;%% 
var'' 
msg'' 
='' 

MailHelper''  
.''  !4
(CreateMultipleEmailsToMultipleRecipients''! I
(''I J
from''J N
,''N O
tos(( 
,(( 
subjects)) 
,)) 
plainTextContent**  
,**  !
htmlContent++ 
,++ 
substitutions,, 
)-- 
;-- 
var.. 
response.. 
=.. 
await..  
client..! '
...' (
SendEmailAsync..( 6
(..6 7
msg..7 :
)..: ;
;..; <
}// 	
}00 
}11 Õ
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
{ 
readonly 

SmtpClient 
_smtpClient '
=( )
new* -
(. /
)/ 0
;0 1
public		 
void		 
	SendEmail		 
(		 
Email		 #
email		$ )
)		) *
{

 	
_smtpClient 
. 
Host 
= 
$str /
;/ 0
_smtpClient 
. 
Port 
= 
$num "
;" #
_smtpClient 
. !
UseDefaultCredentials -
=. /
false0 5
;5 6
_smtpClient 
. 
	EnableSsl !
=" #
true$ (
;( )
_smtpClient 
. 
Credentials #
=$ %
new& )
NetworkCredential* ;
(; <
$str< U
,U V
$strW a
)a b
;b c
_smtpClient 
. 
Send 
( 
$str 6
,6 7
email8 =
.= >
To> @
,@ A
emailB G
.G H
SubjectH O
,O P
emailQ V
.V W
BodyW [
)[ \
;\ ]
} 	
} 
} ü
3D:\dev\Battleships\Battleships\Bridge\IShipState.cs
	namespace 	
Battleships
 
. 
Bridge 
; 
public 
	interface 

IShipState 
{ 
void 
ChangeState	 
( 
) 
; 
string 

GetState 
( 
) 
; 
} Œ
1D:\dev\Battleships\Battleships\Bridge\OffState.cs
	namespace 	
Battleships
 
. 
Bridge 
; 
public 
class 
OffState 
: 

IShipState "
{ 
private 
Ship 
ship 
; 
public		 

void		 
ChangeState		 
(		 
)		 
{

 
ship 
. 
Name 
= 
$str /
;/ 0
ship 
. 
Description 
= 
$str =
;= >
} 
public 

string 
GetState 
( 
) 
{ 
return 
$str 
; 
} 
} ◊
0D:\dev\Battleships\Battleships\Bridge\OnState.cs
	namespace 	
Battleships
 
. 
Bridge 
; 
public 
class 
OnState 
: 

IShipState !
{ 
private 
Ship 
ship 
; 
public		 

void		 
ChangeState		 
(		 
)		 
{

 
ship 
. 
Name 
= 
$str .
;. /
ship 
. 
Description 
= 
$str <
;< =
} 
public 

string 
GetState 
( 
) 
{ 
return 
$str 
; 
} 
public 

void 
ni 
( 
) 
{ 
throw 
new 
System 
. #
NotImplementedException 0
(0 1
)1 2
;2 3
} 
} ∂*
=D:\dev\Battleships\Battleships\Builders\GameSessionBuilder.cs
	namespace 	
Battleships
 
. 
Builders 
; 
public 
class 
GameSessionBuilder 
:  !
IGameSessionBuilder" 5
{		 
private

 
GameSession

 
session

 
=

  !
new

" %
GameSession

& 1
(

1 2
)

2 3
;

3 4
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

GameSessionWW 
BuildWW 
(WW 
)WW 
{XX 
returnYY 
thisYY 
.YY 
sessionYY 
;YY 
}ZZ 
}[[ á

=D:\dev\Battleships\Battleships\Builders\GameSessionCreator.cs
	namespace 	
Battleships
 
. 
Builders 
; 
public 
class 
GameSessionCreator 
{ 
private 
readonly 
IGameSessionBuilder (
_builder) 1
;1 2
public		 

GameSessionCreator		 
(		 
IGameSessionBuilder		 1
builder		2 9
)		9 :
{

 
this 
. 
_builder 
= 
builder 
;  
} 
public 

void &
BuildDefaultMinimalSession *
(* +
)+ ,
{ 
this 
. 
_builder 
. 
WithIcon 
( 
$str !
)! "
;" #
this 
. 
_builder 
. 
WithName 
( 
$str %
)% &
;& '
this 
. 
_builder 
. 
WithDateCreated %
(% &
DateTime& .
.. /
Now/ 2
)2 3
;3 4
} 
} î
>D:\dev\Battleships\Battleships\Builders\IGameSessionBuilder.cs
	namespace 	
Battleships
 
. 
Builders 
; 
public 
	interface 
IGameSessionBuilder $
{ 
GameSessionBuilder		 
WithIcon		 
(		  
string		  &
icon		' +
)		+ ,
;		, -
GameSessionBuilder

 
WithName

 
(

  
string

  &
name

' +
)

+ ,
;

, -
GameSessionBuilder 
WithDateCreated &
(& '
DateTime' /
dateCreated0 ;
); <
;< =
GameSessionBuilder 
WithGameLength %
(% &
TimeSpan& .

gameLength/ 9
)9 :
;: ;
GameSessionBuilder 
WithPlayers "
(" #
List# '
<' (
Player( .
>. /
players0 7
)7 8
;8 9
GameSessionBuilder 
WithSessionSettings *
(* +
GameSessionSettings+ >
settings? G
)G H
;H I
GameSessionBuilder 
WithCurrentRound '
(' (
int( +
round, 1
)1 2
;2 3
GameSession 
Build 
( 
) 
; 
} ≈
;D:\dev\Battleships\Battleships\Builders\IShipTileBuilder.cs
	namespace 	
Battleships
 
. 
Builders 
; 
public 
	interface 
IShipTileBuilder !
{ 
ShipTileBuilder		 
WithXCoordinate		 #
(		# $
int		$ '
x		( )
)		) *
;		* +
ShipTileBuilder

 
WithYCoordinate

 #
(

# $
int

$ '
y

( )
)

) *
;

* +
ShipTileBuilder 
WithIsDestroyed #
(# $
bool$ (
isDestroyed) 4
)4 5
;5 6
ShipTileBuilder 
WithPlayerShipId $
($ %
Guid% )
id* ,
), -
;- .
ShipTileBuilder 
WithPlayerShip "
(" #

PlayerShip# -

playerShip. 8
)8 9
;9 :
ShipTileBuilder 

WithEngine 
( 
Engine %
engine& ,
), -
;- .
ShipTileBuilder 
WithGuns 
( 
Gun  
gun! $
)$ %
;% &
ShipTileBuilder 

WithShield 
( 
bool #
shield$ *
)* +
;+ ,
ShipTileBuilder 
WithGunCount  
(  !
int! $
gunCount% -
)- .
;. /
ShipTileBuilder 
WithIsFlagship "
(" #
bool# '

isFlagship( 2
)2 3
;3 4
ShipTile 
Build 
( 
) 
; 
} ∆
:D:\dev\Battleships\Battleships\Builders\ShipTileBuilder.cs
	namespace 	
Battleships
 
. 
Builders 
; 
public 
class 
ShipTileBuilder 
: 
IShipTileBuilder /
{ 
private		 
ShipTile		 
shipTile		 
=		 
new		  #
ShipTile		$ ,
(		, -
)		- .
;		. /
public 

ShipTileBuilder 
WithXCoordinate *
(* +
int+ .
x/ 0
)0 1
{ 
shipTile 
. 
XCoordinate 
= 
x  
;  !
return 
this 
; 
} 
public 

ShipTileBuilder 
WithYCoordinate *
(* +
int+ .
y/ 0
)0 1
{ 
shipTile 
. 
YCoordinate 
= 
y  
;  !
return 
this 
; 
} 
public 

ShipTileBuilder 
WithIsDestroyed *
(* +
bool+ /
isDestroyed0 ;
); <
{ 
shipTile 
. 
IsDestroyed 
= 
isDestroyed *
;* +
return 
this 
; 
} 
public 

ShipTileBuilder 
WithPlayerShipId +
(+ ,
Guid, 0
id1 3
)3 4
{ 
shipTile 
. 
PlayerShipId 
= 
id  "
;" #
return   
this   
;   
}!! 
public## 

ShipTileBuilder## 
WithPlayerShip## )
(##) *

PlayerShip##* 4

playerShip##5 ?
)##? @
{$$ 
shipTile%% 
.%% 

PlayerShip%% 
=%% 

playerShip%% (
;%%( )
return&& 
this&& 
;&& 
}'' 
public)) 

ShipTileBuilder)) 

WithEngine)) %
())% &
Engine))& ,
engine))- 3
)))3 4
{** 
shipTile++ 
.++ 
Engine++ 
=++ 
engine++  
;++  !
return,, 
this,, 
;,, 
}-- 
public// 

ShipTileBuilder// 
WithGuns// #
(//# $
Gun//$ '
gun//( +
)//+ ,
{00 
shipTile11 
.11 
Guns11 
=11 
gun11 
;11 
return22 
this22 
;22 
}33 
public55 

ShipTileBuilder55 

WithShield55 %
(55% &
bool55& *
shield55+ 1
)551 2
{66 
shipTile77 
.77 
Shield77 
=77 
shield77  
;77  !
return88 
this88 
;88 
}99 
public;; 

ShipTileBuilder;; 
WithGunCount;; '
(;;' (
int;;( +
gunCount;;, 4
);;4 5
{<< 
shipTile== 
.== 
GunCount== 
=== 
gunCount== $
;==$ %
return>> 
this>> 
;>> 
}?? 
publicAA 

ShipTileBuilderAA 
WithIsFlagshipAA )
(AA) *
boolAA* .

isFlagshipAA/ 9
)AA9 :
{BB 
shipTileCC 
.CC 

IsFlagshipCC 
=CC 

isFlagshipCC (
;CC( )
returnDD 
thisDD 
;DD 
}EE 
publicGG 

ShipTileGG 
BuildGG 
(GG 
)GG 
{HH 
returnII 
thisII 
.II 
shipTileII 
;II 
}JJ 
}KK Œ
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
}## ±6
CD:\dev\Battleships\Battleships\Controllers\GameSessionController.cs
	namespace		 	
Battleships		
 
.		 
Controllers		 !
{

 
[ 
ApiController 
] 
[ 
Route 

(
 
$str 
) 
] 
public 

class !
GameSessionController &
:& '
ControllerBase( 6
{ 
private 
readonly 
IGameSessionService ,
_gameSessionService- @
;@ A
private 
readonly 
IPlayersService (
_playersService) 8
;8 9
private 
readonly 
IGameLaunchService +
_gameLaunchService, >
;> ?
private 
readonly .
"IBattleshipsSynchronizationService ;.
"_battleshipsSynchronizationService< ^
;^ _
public !
GameSessionController $
($ %
IGameSessionService 
gameSessionService  2
,2 3
IPlayersService 
playersService *
,* +
IGameLaunchService 
gameLaunchService 0
,0 1.
"IBattleshipsSynchronizationService .-
!battleshipsSynchronizationService/ P
)P Q
{ 	
_gameSessionService 
=  !
gameSessionService" 4
;4 5
_playersService 
= 
playersService ,
;, -
_gameLaunchService 
=  
gameLaunchService! 2
;2 3.
"_battleshipsSynchronizationService .
=/ 0-
!battleshipsSynchronizationService1 R
;R S
} 	
[   	
HttpPost  	 
(   
$str   !
)  ! "
]  " #
public!! 
async!! 
Task!! 
<!! 
IActionResult!! '
>!!' (
CreateSessions!!) 7
(!!7 8
[!!8 9
FromBody!!9 A
]!!A B!
GameSessionRequestDto!!C X
gameSessionDto!!Y g
)!!g h
{"" 	
return## 
Ok## 
(## 
await## 
_gameSessionService## /
.##/ 0
CreateSession##0 =
(##= >
gameSessionDto##> L
)##L M
)##M N
;##N O
}$$ 	
[&& 	
HttpGet&&	 
(&& 
$str&& 
)&&  
]&&  !
public'' 
async'' 
Task'' 
<'' 
IActionResult'' '
>''' (
ListSessions'') 5
(''5 6
)''6 7
{(( 	
Console)) 
.)) 
	WriteLine)) 
()) 
$str)) )
)))) *
;))* +
var** 
gameSessions** 
=** 
await** $
_gameSessionService**% 8
.**8 9
ListAllSessions**9 H
(**H I
)**I J
;**J K
return,, 
Ok,, 
(,, 
gameSessions,, "
),," #
;,,# $
}-- 	
[// 	
HttpGet//	 
(// 
$str// 
)// 
]// 
public00 
async00 
Task00 
<00 
IActionResult00 '
>00' (

GetSession00) 3
(003 4
Guid004 8
id009 ;
)00; <
{11 	
Console22 
.22 
	WriteLine22 
(22 
$str22 1
)221 2
;222 3
Console33 
.33 
	WriteLine33 
(33 
id33  
)33  !
;33! "
var55 
game55 
=55 
await55 
_gameSessionService55 0
.550 1

GetSession551 ;
(55; <
id55< >
)55> ?
;55? @
return66 
Ok66 
(66 
game66 
)66 
;66 
}77 	
[99 	
HttpGet99	 
(99 
$str99 /
)99/ 0
]990 1
public:: 
async:: 
Task:: 
<:: 
IActionResult:: '
>::' (
GetInGameSession::) 9
(::9 :
Guid::: >
gameSessionId::? L
)::L M
{;; 	
var<< 
dto<< 
=<< 
await<< 
_gameSessionService<< /
.<</ 0
GetInGameSession<<0 @
(<<@ A
gameSessionId<<A N
)<<N O
;<<O P
return>> 
Ok>> 
(>> 
dto>> 
)>> 
;>> 
}?? 	
[AA 	
HttpPostAA	 
(AA 
$strAA 4
)AA4 5
]AA5 6
publicBB 
asyncBB 
TaskBB 
<BB 
IActionResultBB '
>BB' (

LaunchGameBB) 3
(BB3 4
GuidBB4 8
gameSessionIdBB9 F
,BBF G
boolBBH L
rematchBBM T
)BBT U
{CC 	
awaitDD 
_gameLaunchServiceDD $
.DD$ %

LaunchGameDD% /
(DD/ 0
gameSessionIdDD0 =
,DD= >
rematchDD? F
)DDF G
;DDG H
ResponseFF 
.FF 
OnCompletedFF  
(FF  !
asyncFF! &
(FF' (
)FF( )
=>FF* ,
awaitGG .
"_battleshipsSynchronizationServiceGG 8
.GG8 9!
SendLaunchGameMessageGG9 N
(GGN O
gameSessionIdGGO \
)GG\ ]
)GG] ^
;GG^ _
returnII 
OkII 
(II 
)II 
;II 
}JJ 	
[LL 	
HttpPostLL	 
(LL 
$strLL /
)LL/ 0
]LL0 1
publicMM 
asyncMM 
TaskMM 
<MM 
IActionResultMM '
>MM' (
InvitePlayerMM) 5
(MM5 6
GuidMM6 :
gameSessionIdMM; H
,MMH I
[MMJ K
FromBodyMMK S
]MMS T
UserInviteDtoMMU b
inviteMMc i
)MMi j
{NN 	
awaitOO 
_playersServiceOO !
.OO! "
InviteUserToGameOO" 2
(OO2 3
gameSessionIdOO3 @
,OO@ A
inviteOOB H
.OOH I
UserIdOOI O
)OOO P
;OOP Q
ResponseQQ 
.QQ 
OnCompletedQQ  
(QQ  !
asyncQQ! &
(QQ' (
)QQ( )
=>QQ* ,
awaitRR .
"_battleshipsSynchronizationServiceRR 8
.RR8 9
InviteUserToGameRR9 I
(RRI J
gameSessionIdRRJ W
,RRW X
inviteRRY _
.RR_ `
UserIdRR` f
)RRf g
)RRg h
;RRh i
returnTT 
OkTT 
(TT 
)TT 
;TT 
}UU 	
}VV 
}WW ‰
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
}&& ¡
=D:\dev\Battleships\Battleships\Controllers\UsersController.cs
	namespace 	
Battleships
 
. 
Controllers !
;! "
[ 
Route 
( 
$str 
) 
] 
[ 
ApiController 
] 
public 
class 
UsersController 
: 
ControllerBase -
{ 
}

 »
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
public  
ApplicationDbContext #
(# $
DbContextOptions$ 4
options5 <
)< =
:> ?
base@ D
(D E
optionsE L
)L M
{ 	
} 	
	protected 
override 
void 
OnModelCreating  /
(/ 0
ModelBuilder0 <
modelBuilder= I
)I J
{ 	
modelBuilder 
. 
Entity 
<  
Ship  $
>$ %
(% &
)& '
. 
HasDiscriminator !
(! "
ship" &
=>' )
ship* .
.. /!
ShipTypeDiscriminator/ D
)D E
. 
HasValue 
< 
BattleshipShip (
>( )
() *
nameof* 0
(0 1
BattleshipShip1 ?
)? @
)@ A
. 
HasValue 
< 
CarrierShip %
>% &
(& '
nameof' -
(- .
CarrierShip. 9
)9 :
): ;
. 
HasValue 
< 
CruiserShip %
>% &
(& '
nameof' -
(- .
CruiserShip. 9
)9 :
): ;
. 
HasValue 
< 
DestroyerShip '
>' (
(( )
nameof) /
(/ 0
DestroyerShip0 =
)= >
)> ?
. 
HasValue 
< 
SubmarineShip '
>' (
(( )
nameof) /
(/ 0
SubmarineShip0 =
)= >
)> ?
; 
base 
. 
OnModelCreating  
(  !
modelBuilder! -
)- .
;. /
} 	
} 
} ¥
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
} ù
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
} ¥
AD:\dev\Battleships\Battleships\Data\Dto\InGameSession\GameTile.cs
	namespace 	
Battleships
 
. 
Data 
. 
Dto 
. 
InGameSession ,
;, -
public 
class 
GameTile 
{ 
public 

bool 
IsShip 
{ 
get 
; 
set !
;! "
}# $
public 

bool 
IsDestroyed 
{ 
get !
;! "
set# &
;& '
}( )
public 

int 
ColumnCoordinate 
{  !
get" %
;% &
set' *
;* +
}, -
public 

int 
RowCoordinate 
{ 
get "
;" #
set$ '
;' (
}) *
}		 …
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
;, -
public 
class 
InGameSessionDto 
{ 
public 

Guid 
GameSessionId 
{ 
get  #
;# $
set% (
;( )
}* +
public		 

int		 
ColumnCount		 
{		 
get		  
;		  !
set		" %
;		% &
}		' (
public

 

int

 
RowCount

 
{

 
get

 
;

 
set

 "
;

" #
}

$ %
public 

int 
CurrentRound 
{ 
get !
;! "
set# &
;& '
}( )
public 

string 
OwnName 
{ 
get 
;  
set! $
;$ %
}& '
public 

string 
OpponentName 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 

string $
CurrentRoundPlayerUserId *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
public 

List 
< 
GameTile 
> 
OwnTiles "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 

List 
< 
GameTile 
> 
OpponentTiles '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
} ‹
9D:\dev\Battleships\Battleships\Data\Dto\PlayerLobbyDto.cs
	namespace 	
Battleships
 
. 
Data 
. 
Dto 
; 
public 
class 
PlayerLobbyDto 
{ 
public 

string 
Id 
{ 
get 
; 
set 
;  
}! "
public 

string 
UserId 
{ 
get 
; 
set  #
;# $
}% &
public		 

string		 
Name		 
{		 
get		 
;		 
set		 !
;		! "
}		# $
}

 ﬂ
FD:\dev\Battleships\Battleships\Data\Dto\PlayerLobbyDtoWithSessionId.cs
	namespace 	
Battleships
 
. 
Data 
. 
Dto 
; 
public 
class '
PlayerLobbyDtoWithSessionId (
{ 
public 

string 
Id 
{ 
get 
; 
set 
;  
}! "
public 

string 
Name 
{ 
get 
; 
set !
;! "
}# $
public		 

Guid		 
	SessionId		 
{		 
get		 
;		  
set		! $
;		$ %
}		& '
public 

override 
string 
ToString #
(# $
)$ %
{ 
return 
$" 
{ 
nameof 
( 
Id 
) 
} 
$str 
{  
Id  "
}" #
$str# %
{% &
nameof& ,
(, -
Name- 1
)1 2
}2 3
$str3 5
{5 6
Name6 :
}: ;
$str; =
{= >
nameof> D
(D E
	SessionIdE N
)N O
}O P
$strP R
{R S
	SessionIdS \
}\ ]
"] ^
;^ _
} 
} ‚
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
 ¨
8D:\dev\Battleships\Battleships\Data\Dto\UserInviteDto.cs
	namespace 	
Battleships
 
. 
Data 
. 
Dto 
; 
public 
class 
UserInviteDto 
{ 
public 

string 
UserId 
{ 
get 
; 
set  #
;# $
}% &
} –
6D:\dev\Battleships\Battleships\Data\NumberGenerator.cs
	namespace 	
Battleships
 
. 
Data 
; 
public 
class 
NumberGenerator 
{ 
private 
readonly 
int 
	_maxValue "
;" #
public		 

NumberGenerator		 
(		 
int		 
maxValue		 '
)		' (
{

 
	_maxValue 
= 
maxValue 
; 
} 
public 

int 
GenerateNumber 
( 
) 
{ 
return !
RandomNumberGenerator $
.$ %
GetInt32% -
(- .
	_maxValue. 7
)7 8
;8 9
} 
} ÓY
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
}ûû ≠
1D:\dev\Battleships\Battleships\Data\ShipSeeder.cs
	namespace		 	
Battleships		
 
.		 
Data		 
;		 
public 
class 

ShipSeeder 
{ 
public 

static 
void 
	SeedShips  
(  !
IServiceProvider! 1
serviceProvider2 A
)A B
{ 
using 
var 
serviceScope 
=  
serviceProvider! 0
.0 1
CreateScope1 <
(< =
)= >
;> ?
var 
battleshipsDatabase 
=  !
serviceScope" .
.. /
ServiceProvider/ >
.> ?
GetRequiredService? Q
<Q R 
IBattleshipsDatabaseR f
>f g
(g h
)h i
;i j
var 
isEmpty 
= 
battleshipsDatabase )
.) *
ShipsRepository* 9
.9 :
IsEmpty: A
(A B
)B C
;C D
if 

( 
isEmpty 
) 
{ 	
var 
factoryProducer 
=  !
new" %
ShipFactoryProducer& 9
(9 :
): ;
;; <
var 
neutralShipFactory "
=# $
factoryProducer% 4
.4 5
ProduceFactory5 C
(C D
nullD H
)H I
;I J
var !
defensiveShipsFactory %
=& '
factoryProducer( 7
.7 8
ProduceFactory8 F
(F G
trueG K
)K L
;L M
var !
offensiveShipsFactory %
=& '
factoryProducer( 7
.7 8
ProduceFactory8 F
(F G
falseG L
)L M
;M N
var 
ships 
= 
new 
List  
<  !
Ship! %
>% &
(& '
)' (
{ !
defensiveShipsFactory %
.% &
GenerateShip& 2
(2 3
	ShipTypes3 <
.< =
Carrier= D
)D E
,E F!
defensiveShipsFactory %
.% &
GenerateShip& 2
(2 3
	ShipTypes3 <
.< =
Cruiser= D
)D E
,E F!
offensiveShipsFactory %
.% &
GenerateShip& 2
(2 3
	ShipTypes3 <
.< =

Battleship= G
)G H
,H I!
offensiveShipsFactory %
.% &
GenerateShip& 2
(2 3
	ShipTypes3 <
.< =
	Destroyer= F
)F G
,G H!
offensiveShipsFactory   %
.  % &
GenerateShip  & 2
(  2 3
	ShipTypes  3 <
.  < =
	Submarine  = F
)  F G
,  G H
neutralShipFactory!! "
.!!" #
GenerateShip!!# /
(!!/ 0
	ShipTypes!!0 9
.!!9 :
Dummy!!: ?
)!!? @
}"" 
;"" 
battleshipsDatabase$$ 
.$$  
ShipsRepository$$  /
.$$/ 0

CreateMany$$0 :
($$: ;
ships$$; @
)$$@ A
.$$A B
Wait$$B F
($$F G
)$$G H
;$$H I
}%% 	
}&& 
}'' ó
;D:\dev\Battleships\Battleships\Facades\GameSessionFacade.cs
	namespace 	
Battleships
 
. 
Facades 
; 
public 
class 
GameSessionFacade 
{ 
private 
readonly  
IBattleshipsDatabase )
	_database* 3
;3 4
private 
readonly 
ICurrentUserService (
_currentUserService) <
;< =
private 
readonly !
GameSessionRequestDto *
dto+ .
;. /
public 

GameSessionFacade 
(  
IBattleshipsDatabase 1
database2 :
,: ;
ICurrentUserService< O
currentUserServiceP b
,b c!
GameSessionRequestDtod y
dtoz }
)} ~
{ 
this 
. 
	_database 
= 
database !
;! "
this 
. 
_currentUserService  
=! "
currentUserService# 5
;5 6
this 
. 
dto 
= 
dto 
; 
} 
public 

async 
Task 
< 
Guid 
> 
CreateGameSession -
(- .
). /
{ 
var 
userId 
= 
_currentUserService (
.( )
GetCurrentUserId) 9
(9 :
): ;
;; <
var 
gameSettings 
= 
new 
GameSessionSettings 2
{ 	
ColumnCount   
=   
dto   
.   
SettingsDto   )
.  ) *
ColumnCount  * 5
,  5 6
RowCount!! 
=!! 
dto!! 
.!! 
SettingsDto!! &
.!!& '
RowCount!!' /
,!!/ 0
GameType"" 
="" 
dto"" 
."" 
SettingsDto"" &
.""& '
GameType""' /
}## 	
;##	 

var$$ 
players$$ 
=$$ 
new$$ 
List$$ 
<$$ 
Player$$ %
>$$% &
{%% 	
new&& 
Player&& 
{'' 
IsHost(( 
=(( 
true(( 
,(( 
UserId)) 
=)) 
userId)) 
,))  
IsCurrentPlayerTurn** #
=**$ %
true**& *
}++ 
},, 	
;,,	 

var.. 
gameSession.. 
=.. 
new.. 
GameSessionBuilder.. 0
(..0 1
)..1 2
.// 
WithIcon// 
(// 
dto// 
.// 
Icon// 
)// 
.00 
WithName00 
(00 
dto00 
.00 
Name00 
)00 
.11 
WithDateCreated11 
(11 
DateTime11 %
.11% &
UtcNow11& ,
)11, -
.22 
WithSessionSettings22  
(22  !
gameSettings22! -
)22- .
.33 
WithPlayers33 
(33 
players33  
)33  !
.44 

WithStatus44 
(44 
GameSessionStatus44 )
.44) *
Created44* 1
)441 2
.55 
Build55 
(55 
)55 
;55 
var77 
id77 
=77 
await77 
	_database77  
.77  !"
GameSessionsRepository77! 7
.777 8
Create778 >
(77> ?
gameSession77? J
)77J K
;77K L
return99 
id99 
;99 
}:: 
};; ÿ
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
} †
BD:\dev\Battleships\Battleships\Factories\NumberGeneratorFactory.cs
	namespace 	
Battleships
 
. 
	Factories 
;  
public 
class "
NumberGeneratorFactory #
{ 
public 

NumberGenerator 
GetNumberGenerator -
(- .
int. 1
maxValue2 :
): ;
{ 
var		 
	generator		 
=		 
new		 
NumberGenerator		 +
(		+ ,
maxValue		, 4
)		4 5
;		5 6
return 
	generator 
; 
} 
} µ
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
} œ„
CD:\dev\Battleships\Battleships\Migrations\20221027202249_NewInit.cs
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
} ˘
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
} ã
5D:\dev\Battleships\Battleships\Models\enums\Engine.cs
	namespace 	
Battleships
 
. 
Models 
. 
enums "
;" #
public 
enum 
Engine 
{ 
} ≤
@D:\dev\Battleships\Battleships\Models\enums\GameSessionStatus.cs
	namespace 	
Battleships
 
. 
Models 
. 
enums "
;" #
public 
enum 
GameSessionStatus 
{ 
	Undefined 
= 
$num 
, 
Created 
= 
$num 
, 

InProgress 
= 
$num 
, 
EndgameReached 
= 
$num 
}		 ´
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
} îA
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
dto!! 
.!! 
HostName!! 
=!! 
this!! 
.!!  
Players!!  '
[!!' (
$num!!( )
]!!) *
.!!* +
User!!+ /
.!!/ 0
Name!!0 4
;!!4 5
dto"" 
."" 
Icon"" 
="" 
this"" 
."" 
Icon""  
;""  !
dto## 
.## 
Name## 
=## 
this## 
.## 
Name##  
;##  !
dto$$ 
.$$ 
GridSize$$ 
=$$ 
this$$ 
.$$  
Settings$$  (
.$$( )
GridSize$$) 1
;$$1 2
dto%% 
.%% 
GameType%% 
=%% 
this%% 
.%%  
Settings%%  (
.%%( )
GameType%%) 1
;%%1 2
var&& 
players&& 
=&& 
this&& 
.&& 
Players&& &
.&&& '
Select&&' -
(&&- .
player&&. 4
=>&&5 7
player&&8 >
.&&> ?

ToLobbyDto&&? I
(&&I J
)&&J K
)&&K L
.&&L M
ToList&&M S
(&&S T
)&&T U
;&&U V
dto'' 
.'' 
LobbyPlayers'' 
='' 
players'' &
;''& '
return)) 
dto)) 
;)) 
}** 	
private,, 
GameSession,, 
DeepCopy,, $
(,,$ %
GameSession,,% 0
gameSession,,1 <
),,< =
{-- 	
var.. 
shallowCopy.. 
=.. 
ShallowClone.. *
(..* +
)..+ ,
as..- /
GameSession..0 ;
;..; <
var// 
settings// 
=// 
shallowCopy// &
.//& '
Settings//' /
;/// 0
var11 
	playerOne11 
=11 
new11 
Player11  &
(11& '
gameSession11' 2
,112 3
true114 8
,118 9
gameSession11: E
.11E F
Players11F M
[11M N
$num11N O
]11O P
.11P Q
UserId11Q W
)11W X
;11X Y
var22 
	playerTwo22 
=22 
new22 
Player22  &
(22& '
gameSession22' 2
,222 3
false224 9
,229 :
gameSession22; F
.22F G
Players22G N
[22N O
$num22O P
]22P Q
.22Q R
UserId22R X
)22X Y
;22Y Z
var33 
players33 
=33 
new33 
List33 "
<33" #
Player33# )
>33) *
{33* +
	playerOne33, 5
,336 7
	playerTwo338 A
}33A B
;33B C
var55 
session55 
=55 
new55 
GameSession55 )
{66 
Icon77 
=77 
gameSession77 "
.77" #
Icon77# '
,77' (
Name88 
=88 
gameSession88 "
.88" #
Name88# '
,88' (
DateCreated99 
=99 
gameSession99 )
.99) *
DateCreated99* 5
,995 6

GameLength:: 
=:: 
gameSession:: (
.::( )

GameLength::) 3
,::3 4
Status;; 
=;; 
gameSession;; $
.;;$ %
Status;;% +
,;;+ ,
CurrentRound<< 
=<< 
gameSession<< *
.<<* +
CurrentRound<<+ 7
,<<7 8
EndgameStrategy== 
===  !
gameSession==" -
.==- .
EndgameStrategy==. =
,=== >
Players>> 
=>> 
players>> !
,>>! "
Settings?? 
=?? 
settings?? #
,??# $
}@@ 
;@@ 
returnBB 
sessionBB 
;BB 
}CC 	
publicEE 
GameSessionEE 
(EE 
)EE 
{FF 	
}HH 	
publicJJ 
overrideJJ 
stringJJ 
ToStringJJ '
(JJ' (
)JJ( )
{KK 	
returnLL 
thisLL 
.LL 
IdLL 
.LL 
ToStringLL #
(LL# $
)LL$ %
+LL& '
$strLL( +
+LL, -
thisLL. 2
.LL2 3
NameLL3 7
+LL8 9
$strLL: =
+LL> ?
thisLL@ D
.LLD E
IconLLE I
+LLJ K
$strLLL O
+LLP Q
thisLLR V
.LLV W
PlayersLLW ^
[LL^ _
$numLL_ `
]LL` a
.LLa b
IdLLb d
;LLd e
}MM 	
publicOO 
overrideOO  
GameSessionPrototypeOO ,
ShallowCloneOO- 9
(OO9 :
)OO: ;
{PP 	
returnQQ 
thisQQ 
.QQ 
MemberwiseCloneQQ '
(QQ' (
)QQ( )
asQQ* , 
GameSessionPrototypeQQ- A
;QQA B
}RR 	
publicTT 
overrideTT  
GameSessionPrototypeTT ,
	DeepCloneTT- 6
(TT6 7
GameSessionTT7 B
gameSessionTTC N
)TTN O
{UU 	
varVV 
copiedSessionVV 
=VV 
DeepCopyVV  (
(VV( )
gameSessionVV) 4
)VV4 5
;VV5 6
returnWW 
copiedSessionWW  
asWW! # 
GameSessionPrototypeWW$ 8
;WW8 9
}XX 	
}YY 
}ZZ Ú
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
} ó 
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
}00 –
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
}0 1
} 
} Ô
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
 ¥
3D:\dev\Battleships\Battleships\Models\Ships\Ship.cs
	namespace 	
Battleships
 
. 
Models 
. 
Ships "
{ 
public 

abstract 
class 
Ship 
:  
	BaseModel! *
{ 
public 
string !
ShipTypeDiscriminator +
{, -
get. 1
;1 2
set3 6
;6 7
}8 9
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
public 
string 
ShipType 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
List 
< 
UserCosmetic  
>  !
UserCosmetics" /
{0 1
get2 5
;5 6
set7 :
;: ;
}< =
public 
List 
< 

PlayerShip 
> 
PlayerShips  +
{, -
get. 1
;1 2
set3 6
;6 7
}8 9
	protected 

IShipState 
_state #
;# $
public 

IShipState 
State 
{ 	
get 
{ 
return 
_state 
; 
} 
set 
{ 
_state 
= 
value 
; 
} 
} 	
public   
abstract   
void   
ChangeState   (
(  ( )
)  ) *
;  * +
void"" 
n"" 
("" 
)"" 
{## 	
State$$ 
.$$ 
ChangeState$$ 
($$ 
)$$ 
;$$  
_state%% 
.%% 
ChangeState%% 
(%% 
)%%  
;%%  !
}&& 	
}'' 
}(( Ì
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
 ∞
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
public 
Guid 
PlayerShipId  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 

PlayerShip 

PlayerShip $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
Engine 
Engine 
{ 
get "
;" #
set$ '
;' (
}) *
public 
Gun 
Guns 
{ 
get 
; 
set "
;" #
}$ %
public 
bool 
Shield 
{ 
get  
;  !
set" %
;% &
}' (
public 
int 
GunCount 
{ 
get !
;! "
set# &
;& '
}( )
public 
bool 

IsFlagship 
{  
get! $
;$ %
set& )
;) *
}+ ,
} 
} ´
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
 ïH
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
public 
virtual 
async 
Task !
<! "
List" &
<& '
TModel' -
>- .
>. /
GetAll0 6
(6 7
)7 8
{ 	
return 
await 
ItemSet  
.  !
ToListAsync! ,
(, -
)- .
;. /
} 	
public!! 
async!! 
Task!! 
<!! 
Guid!! 
>!! 
Create!!  &
(!!& '
TModel!!' -
model!!. 3
)!!3 4
{"" 	
await## 
ItemSet## 
.## 
AddAsync## "
(##" #
model### (
)##( )
;##) *
await$$ 
SaveChanges$$ 
($$ 
)$$ 
;$$  
return&& 
model&& 
.&& 
Id&& 
;&& 
}'' 	
public)) 
async)) 
Task)) 
Update))  
())  !
TModel))! '
model))( -
)))- .
{** 	
ItemSet++ 
.++ 
Update++ 
(++ 
model++  
)++  !
;++! "
await,, 
SaveChanges,, 
(,, 
),, 
;,,  
}-- 	
public// 
async// 
Task// 
Delete//  
(//  !
TModel//! '
model//( -
)//- .
{00 	
ItemSet11 
.11 
Remove11 
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
Task55 
<55 
List55 
<55 
Guid55 #
>55# $
>55$ %

CreateMany55& 0
(550 1
List551 5
<555 6
TModel556 <
>55< =
models55> D
)55D E
{66 	
await77 
ItemSet77 
.77 
AddRangeAsync77 '
(77' (
models77( .
)77. /
;77/ 0
await88 
SaveChanges88 
(88 
)88 
;88  
return:: 
models:: 
.:: 
Select::  
(::  !
m::! "
=>::# %
m::& '
.::' (
Id::( *
)::* +
.::+ ,
ToList::, 2
(::2 3
)::3 4
;::4 5
};; 	
public== 
async== 
Task== 

UpdateMany== $
(==$ %
List==% )
<==) *
TModel==* 0
>==0 1
models==2 8
)==8 9
{>> 	
ItemSet?? 
.?? 
UpdateRange?? 
(??  
models??  &
)??& '
;??' (
await@@ 
SaveChanges@@ 
(@@ 
)@@ 
;@@  
}AA 	
publicCC 
asyncCC 
TaskCC 

DeleteManyCC $
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
RemoveRangeEE 
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
publicII 
boolII 
IsEmptyII 
(II 
)II 
{JJ 	
varKK 
anyExistKK 
=KK 
ItemSetKK "
.KK" #
AnyKK# &
(KK& '
)KK' (
;KK( )
returnLL 
!LL 
anyExistLL 
;LL 
}MM 	
privateOO 
asyncOO 
TaskOO 
SaveChangesOO &
(OO& '
)OO' (
{PP 	
awaitQQ 
_contextQQ 
.QQ 
SaveChangesAsyncQQ +
(QQ+ ,
)QQ, -
;QQ- .
}RR 	
	protectedTT 
asyncTT 
TaskTT 
<TT 
ListTT !
<TT! "
TModelTT" (
>TT( )
>TT) *
GetWhereTT+ 3
(TT3 4

ExpressionTT4 >
<TT> ?
FuncTT? C
<TTC D
TModelTTD J
,TTJ K
boolTTL P
>TTP Q
>TTQ R
filterTTS Y
)TTY Z
{UU 	
returnVV 
awaitVV 
ItemSetVV  
.VV  !
WhereVV! &
(VV& '
filterVV' -
)VV- .
.VV. /
ToListAsyncVV/ :
(VV: ;
)VV; <
;VV< =
}WW 	
	protectedYY 
asyncYY 
TaskYY 
<YY 
TModelYY #
>YY# $
	GetSingleYY% .
(YY. /

ExpressionYY/ 9
<YY9 :
FuncYY: >
<YY> ?
TModelYY? E
,YYE F
boolYYG K
>YYK L
>YYL M
filterYYN T
)YYT U
{ZZ 	
return[[ 
([[ 
await[[ 
_context[[ "
.[[" #
Set[[# &
<[[& '
TModel[[' -
>[[- .
([[. /
)[[/ 0
.[[0 1
Where[[1 6
([[6 7
filter[[7 =
)[[= >
.[[> ?
ToArrayAsync[[? K
([[K L
)[[L M
)[[M N
.[[N O
SingleOrDefault[[O ^
([[^ _
)[[_ `
;[[` a
}\\ 	
	protected^^ 
async^^ 
Task^^ 
<^^ 
TProjection^^ (
>^^( )
	GetSingle^^* 3
<^^3 4
TProjection^^4 ?
>^^? @
(^^@ A

Expression__ 
<__ 
Func__ 
<__ 
TModel__ "
,__" #
bool__$ (
>__( )
>__) *
filter__+ 1
,__1 2

Expression`` 
<`` 
Func`` 
<`` 
TModel`` "
,``" #
TProjection``$ /
>``/ 0
>``0 1 
projectionExpression``2 F
)aa 	
{bb 	
returncc 
(cc 
awaitcc 
_contextcc "
.dd 
Setdd 
<dd 
TModeldd 
>dd  
(dd  !
)dd! "
.ee 
Whereee 
(ee 
filteree !
)ee! "
.ff 
Selectff 
(ff  
projectionExpressionff 0
)ff0 1
.gg 
ToArrayAsyncgg !
(gg! "
)gg" #
)hh 
.hh 
SingleOrDefaulthh !
(hh! "
)hh" #
;hh# $
}ii 	
	protectedkk 
asynckk 
Taskkk 
<kk 
TProjectionkk (
>kk( )
GetByIdkk* 1
<kk1 2
TProjectionkk2 =
>kk= >
(kk> ?
Guidkk? C
idkkD F
,kkF G

ExpressionkkH R
<kkR S
FunckkS W
<kkW X
TModelkkX ^
,kk^ _
TProjectionkk` k
>kkk l
>kkl m!
projectionExpression	kkn Ç
)
kkÇ É
{ll 	
returnmm 
awaitmm 
ItemSetmm  
.nn 
Wherenn 
(nn 
itemnn 
=>nn 
itemnn #
.nn# $
Idnn$ &
==nn' )
idnn* ,
)nn, -
.oo 
Selectoo 
(oo  
projectionExpressionoo ,
)oo, -
.pp 
FirstOrDefaultAsyncpp $
(pp$ %
)pp% &
;pp& '
}qq 	
}rr 
}ss »
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
)4 5
{ 	"
AchievementsRepository "
=# $"
achievementsRepository% ;
;; <"
GameSessionsRepository "
=# $"
gameSessionsRepository% ;
;; <)
GameSessionSettingsRepository )
=* +)
gameSessionSettingsRepository, I
;I J
PlayersRepository 
= 
playersRepository  1
;1 2!
PlayerShipsRepository !
=" #!
playerShipsRepository$ 9
;9 :
ShipsRepository 
= 
shipsRepository -
;- .#
UserCosmeticsRepository #
=$ %#
userCosmeticsRepository& =
;= >
ShipTilesRepository 
=  !
shipTilesRepository" 5
;5 6
} 	
public 
IRepository 
< 
Achievement &
>& '"
AchievementsRepository( >
{? @
getA D
;D E
}F G
public #
IGameSessionsRepository &"
GameSessionsRepository' =
{> ?
get@ C
;C D
}E F
public *
IGameSessionSettingsRepository -)
GameSessionSettingsRepository. K
{L M
getN Q
;Q R
}S T
public 
IPlayersRepository !
PlayersRepository" 3
{4 5
get6 9
;9 :
}; <
public 
IRepository 
< 

PlayerShip %
>% &!
PlayerShipsRepository' <
{= >
get? B
;B C
}D E
public    
IShipTilesRepository   #
ShipTilesRepository  $ 7
{  8 9
get  : =
;  = >
}  ? @
public!! 
IShipsRepository!! 
ShipsRepository!!  /
{!!0 1
get!!2 5
;!!5 6
}!!7 8
public"" 
IRepository"" 
<"" 
UserCosmetic"" '
>""' (#
UserCosmeticsRepository"") @
{""A B
get""C F
;""F G
}""H I
}## 
}$$ ¬	
LD:\dev\Battleships\Battleships\Repositories\GameSessionSettingsRepository.cs
	namespace 	
Battleships
 
. 
Repositories "
;" #
public 
class )
GameSessionSettingsRepository *
:+ ,
BaseRepository- ;
<; <
GameSessionSettings< O
>O P
,P Q*
IGameSessionSettingsRepositoryR p
{		 
public

 

async

 
Task

 
<

 
GameSessionSettings

 )
>

) *
GetBySessionId

+ 9
(

9 :
Guid

: >
gameSessionId

? L
)

L M
{ 
return 
await 
	GetSingle 
( 
settings '
=>( *
settings+ 3
.3 4
GameSessionId4 A
==B D
gameSessionIdE R
)R S
;S T
} 
public 
)
GameSessionSettingsRepository (
(( ) 
ApplicationDbContext) =
context> E
)E F
:G H
baseI M
(M N
contextN U
)U V
{ 
} 
} õO
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
}dd Í
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
}H I
} 
} “
MD:\dev\Battleships\Battleships\Repositories\IGameSessionSettingsRepository.cs
	namespace 	
Battleships
 
. 
Repositories "
;" #
public 
	interface *
IGameSessionSettingsRepository /
:0 1
IRepository2 =
<= >
GameSessionSettings> Q
>Q R
{ 
Task		 
<		 	
GameSessionSettings			 
>		 
GetBySessionId		 ,
(		, -
Guid		- 1
gameSessionId		2 ?
)		? @
;		@ A
}

 à
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
} Ê
AD:\dev\Battleships\Battleships\Repositories\IPlayersRepository.cs
	namespace 	
Battleships
 
. 
Repositories "
;" #
public 
	interface 
IPlayersRepository #
:$ %
IRepository& 1
<1 2
Player2 8
>8 9
{		 
}

  
:D:\dev\Battleships\Battleships\Repositories\IRepository.cs
	namespace 	
Battleships
 
. 
Repositories "
{ 
public 

	interface 
IRepository  
<  !
TModel! '
>' (
where) .
TModel/ 5
:6 7
	BaseModel8 A
{		 
Task

 
<

 
TModel

 
>

 
GetById

 
(

 
Guid

 !
id

" $
)

$ %
;

% &
Task 
< 
List 
< 
TModel 
> 
> 
GetAll !
(! "
)" #
;# $
Task 
< 
Guid 
> 
Create 
( 
TModel  
model! &
)& '
;' (
Task 
Update 
( 
TModel 
model  
)  !
;! "
Task 
Delete 
( 
TModel 
model  
)  !
;! "
Task 
< 
List 
< 
Guid 
> 
> 

CreateMany #
(# $
List$ (
<( )
TModel) /
>/ 0
models1 7
)7 8
;8 9
Task 

UpdateMany 
( 
List 
< 
TModel #
># $
models% +
)+ ,
;, -
Task 

DeleteMany 
( 
List 
< 
TModel #
># $
models% +
)+ ,
;, -
bool 
IsEmpty 
( 
) 
; 
} 
} ê
?D:\dev\Battleships\Battleships\Repositories\IShipsRepository.cs
	namespace 	
Battleships
 
. 
Repositories "
;" #
public 
	interface 
IShipsRepository !
:" #
IRepository$ /
</ 0
Ship0 4
>4 5
{ 
Task 
< 	
Ship	 
> 
	GetByType 
( 
string 
shipType  (
)( )
;) *
}		 É
CD:\dev\Battleships\Battleships\Repositories\IShipTilesRepository.cs
	namespace 	
Battleships
 
. 
Repositories "
;" #
public		 
	interface		  
IShipTilesRepository		 %
:		& '
IRepository		( 3
<		3 4
ShipTile		4 <
>		< =
{

 
Task 
< 	
ShipTile	 
> 
GetAttackedTile "
(" #
AttackPayload# 0
attack1 7
)7 8
;8 9
Task 
< 	
List	 
< 
ShipTile 
> 
> 
GetSessionShipTiles ,
(, -
Guid- 1
gameSessionId2 ?
)? @
;@ A
Task 
< 	
List	 
< 
ShipTile 
> 
> 
GetPlayerTiles '
(' (
Guid( ,
playerId- 5
)5 6
;6 7
} Ø	
@D:\dev\Battleships\Battleships\Repositories\PlayersRepository.cs
	namespace 	
Battleships
 
. 
Repositories "
;" #
public

 
class

 
PlayersRepository

 
:

  
BaseRepository

! /
<

/ 0
Player

0 6
>

6 7
,

7 8
IPlayersRepository

9 K
{ 
public 

PlayersRepository 
(  
ApplicationDbContext 1
context2 9
)9 :
:; <
base= A
(A B
contextB I
)I J
{ 
} 
public 

override 
async 
Task 
< 
List #
<# $
Player$ *
>* +
>+ ,
GetAll- 3
(3 4
)4 5
{ 
return 
await 
ItemSet 
. 
Include $
($ %
x% &
=>' )
x* +
.+ ,
User, 0
)0 1
. 
ToListAsync 
( 
) 
; 
} 
} “
>D:\dev\Battleships\Battleships\Repositories\ShipsRepository.cs
	namespace 	
Battleships
 
. 
Repositories "
;" #
public 
class 
ShipsRepository 
: 
BaseRepository -
<- .
Ship. 2
>2 3
,3 4
IShipsRepository5 E
{ 
public		 

async		 
Task		 
<		 
Ship		 
>		 
	GetByType		 %
(		% &
string		& ,
shipType		- 5
)		5 6
{

 
return 
await 
	GetSingle 
( 
ship #
=>$ &
ship' +
.+ ,
ShipType, 4
==5 7
shipType8 @
)@ A
;A B
} 
public 

ShipsRepository 
(  
ApplicationDbContext /
context0 7
)7 8
:9 :
base; ?
(? @
context@ G
)G H
{ 
} 
} ˇ
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
;

" #
public 
class 
ShipTilesRepository  
:! "
BaseRepository# 1
<1 2
ShipTile2 :
>: ;
,; < 
IShipTilesRepository= Q
{ 
public 

ShipTilesRepository 
(  
ApplicationDbContext 3
context4 ;
); <
:= >
base? C
(C D
contextD K
)K L
{ 
} 
public 

async 
Task 
< 
ShipTile 
> 
GetAttackedTile  /
(/ 0
AttackPayload0 =
attack> D
)D E
{ 
return 
await 
	GetSingle 
( 
tile #
=>$ &
tile 
. 
XCoordinate 
== 
attack  &
.& '
TargetXCoordinate' 8
&&9 ;
tile< @
.@ A
YCoordinateA L
==M O
attackP V
.V W
TargetYCoordinateW h
&&i k
tile 
. 

PlayerShip 
. 
Player "
." #
UserId# )
!=* ,
attack- 3
.3 4
AttackingUserId4 C
&&D F
tile 
. 

PlayerShip 
. 
Player "
." #
GameSessionId# 0
==1 3
attack4 :
.: ;
GameSessionId; H
) 	
;	 

} 
public 

async 
Task 
< 
List 
< 
ShipTile #
># $
>$ %
GetSessionShipTiles& 9
(9 :
Guid: >
gameSessionId? L
)L M
{ 
return 
await 
ItemSet 
. 
Include 
( 
tile 
=> 
tile !
.! "

PlayerShip" ,
), -
. 
Where 
( 
tile 
=> 
tile 
.  

PlayerShip  *
.* +
Player+ 1
.1 2
GameSessionId2 ?
==@ B
gameSessionIdC P
)P Q
.   
ToListAsync   
(   
)   
;   
}!! 
public## 

async## 
Task## 
<## 
List## 
<## 
ShipTile## #
>### $
>##$ %
GetPlayerTiles##& 4
(##4 5
Guid##5 9
playerId##: B
)##B C
{$$ 
return%% 
await%% 
ItemSet%% 
.&& 
Where&& 
(&& 
tile&& 
=>&& 
tile&& 
.&&  

PlayerShip&&  *
.&&* +
PlayerId&&+ 3
==&&4 6
playerId&&7 ?
)&&? @
.'' 
ToListAsync'' 
('' 
)'' 
;'' 
}(( 
})) ≈
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
} £&
AD:\dev\Battleships\Battleships\Services\AttackExecutionService.cs
	namespace 	
Battleships
 
. 
Services 
{ 
public		 

class		 "
AttackExecutionService		 '
:		( )#
IAttackExecutionService		* A
{

 
private 
readonly  
IBattleshipsDatabase - 
_battleshipsDatabase. B
;B C
private 
readonly 
IEndgameService (
_endgameService) 8
;8 9
private 
readonly .
"IBattleshipsSynchronizationService ;.
"_battleshipsSynchronizationService< ^
;^ _
public "
AttackExecutionService %
(% & 
IBattleshipsDatabase  
battleshipsDatabase! 4
,4 5
IEndgameService 
endgameService *
,* +.
"IBattleshipsSynchronizationService .-
!battleshipsSynchronizationService/ P
)P Q
{ 	 
_battleshipsDatabase  
=! "
battleshipsDatabase# 6
;6 7
_endgameService 
= 
endgameService ,
;, -.
"_battleshipsSynchronizationService .
=/ 0-
!battleshipsSynchronizationService1 R
;R S
} 	
public 
async 
Task 
ExecuteAttack '
(' (
AttackPayload( 5
attack6 <
)< =
{ 	
var 
session 
= 
await  
_battleshipsDatabase  4
.4 5"
GameSessionsRepository5 K
.K L%
GetWithPlayersAndSettingsL e
(e f
attackf l
.l m
GameSessionIdm z
)z {
;{ |
var 
destroyedTile 
= 
await  % 
_battleshipsDatabase& :
.: ;
ShipTilesRepository; N
.N O
GetAttackedTileO ^
(^ _
attack_ e
)e f
;f g
var 
currentUserPlayer !
=" #
session$ +
.+ ,
Players, 3
.3 4
First4 9
(9 :
p: ;
=>< >
p? @
.@ A
IsCurrentPlayerTurnA T
)T U
;U V
var 
opponentPlayer 
=  
session! (
.( )
Players) 0
.0 1
First1 6
(6 7
p7 8
=>9 ;
!< =
p= >
.> ?
IsCurrentPlayerTurn? R
)R S
;S T
if   
(   
destroyedTile   
is    
not  ! $
null  % )
)  ) *
{!! 
destroyedTile"" 
."" 
IsDestroyed"" )
=""* +
true"", 0
;""0 1
await##  
_battleshipsDatabase## *
.##* +
ShipTilesRepository##+ >
.##> ?
Update##? E
(##E F
destroyedTile##F S
)##S T
;##T U
}$$ 
session&& 
.&& 
CurrentRound&&  
+=&&! #
$num&&$ %
;&&% &
currentUserPlayer'' 
.'' 
IsCurrentPlayerTurn'' 1
=''2 3
false''4 9
;''9 :
opponentPlayer(( 
.(( 
IsCurrentPlayerTurn(( .
=((/ 0
true((1 5
;((5 6
await**  
_battleshipsDatabase** &
.**& '"
GameSessionsRepository**' =
.**= >
Update**> D
(**D E
session**E L
)**L M
;**M N
await++ .
"_battleshipsSynchronizationService++ 4
.++4 5
SendAttackMessage++5 F
(++F G
session++G N
.++N O
Id++O Q
,++Q R
new++S V
BattleshipsMessage++W i
<++i j
AttackPayload++j w
>++w x
{,, 
CallerUserId-- 
=-- 
attack-- %
.--% &
AttackingUserId--& 5
,--5 6
Payload.. 
=.. 
attack..  
}// 
)// 
;// 
if11 
(11 
await11 
_endgameService11 %
.11% &
IsEndgameReached11& 6
(116 7
attack117 =
.11= >
GameSessionId11> K
)11K L
)11L M
{22 
await33 
_endgameService33 %
.33% &
EndGameSession33& 4
(334 5
attack335 ;
.33; <
GameSessionId33< I
,33I J
attack33K Q
.33Q R
AttackingUserId33R a
)33a b
;33b c
}44 
}55 	
}66 
}77 ã6
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
} å

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
} ö
9D:\dev\Battleships\Battleships\Services\EndgameService.cs
	namespace 	
Battleships
 
. 
Services 
; 
public		 
class		 
EndgameService		 
:		 
IEndgameService		 -
{

 
private 
readonly  
IBattleshipsDatabase ) 
_battleshipsDatabase* >
;> ?
private 
readonly #
IEndgameStrategyService ,#
_endgameStrategyService- D
;D E
private 
readonly .
"IBattleshipsSynchronizationService 7.
"_battleshipsSynchronizationService8 Z
;Z [
public 

EndgameService 
(  
IBattleshipsDatabase 
battleshipsDatabase 0
,0 1#
IEndgameStrategyService "
endgameStrategyService  6
,6 7.
"IBattleshipsSynchronizationService *-
!battleshipsSynchronizationService+ L
)L M
{  
_battleshipsDatabase 
= 
battleshipsDatabase 2
;2 3#
_endgameStrategyService 
=  !"
endgameStrategyService" 8
;8 9.
"_battleshipsSynchronizationService *
=+ ,-
!battleshipsSynchronizationService- N
;N O
} 
public 

async 
Task 
< 
bool 
> 
IsEndgameReached ,
(, -
Guid- 1
gameSessionId2 ?
)? @
{ 
var 
strategy 
= 
await #
_endgameStrategyService 4
.4 5
GetEndgameStrategy5 G
(G H
gameSessionIdH U
)U V
;V W
return 
await 
strategy 
. 
IsEndgameReached .
(. /
gameSessionId/ <
)< =
;= >
} 
public   

async   
Task   
EndGameSession   $
(  $ %
Guid  % )
gameSessionId  * 7
,  7 8
string  9 ?

attackerId  @ J
)  J K
{!! 
var"" 
session"" 
="" 
await""  
_battleshipsDatabase"" 0
.""0 1"
GameSessionsRepository""1 G
.""G H
GetById""H O
(""O P
gameSessionId""P ]
)""] ^
;""^ _
session$$ 
.$$ 
WinnerId$$ 
=$$ 

attackerId$$ %
;$$% &
session%% 
.%% 
Status%% 
=%% 
GameSessionStatus%% *
.%%* +
EndgameReached%%+ 9
;%%9 :
await''  
_battleshipsDatabase'' "
.''" #"
GameSessionsRepository''# 9
.''9 :
Update'': @
(''@ A
session''A H
)''H I
;''I J
await(( .
"_battleshipsSynchronizationService(( 0
.((0 1
SendEndgameReached((1 C
(((C D
gameSessionId((D Q
)((Q R
;((R S
})) 
}** ⁄
SD:\dev\Battleships\Battleships\Services\EndgameStrategies\ClassicEndgameStrategy.cs
	namespace 	
Battleships
 
. 
Services 
. 
EndgameStrategies 0
;0 1
public

 
class

 "
ClassicEndgameStrategy

 #
:

$ %
IEndgameStrategy

& 6
{ 
private 
readonly  
IBattleshipsDatabase ) 
_battleshipsDatabase* >
;> ?
public 
"
ClassicEndgameStrategy !
(! " 
IBattleshipsDatabase 
battleshipsDatabase 0
) 
{  
_battleshipsDatabase 
= 
battleshipsDatabase 2
;2 3
} 
public 

async 
Task 
< 
bool 
> 
IsEndgameReached ,
(, -
Guid- 1
gameSessionId2 ?
)? @
{ 
var 
tiles 
= 
await  
_battleshipsDatabase .
.. /
ShipTilesRepository/ B
.B C
GetSessionShipTilesC V
(V W
gameSessionIdW d
)d e
;e f
var 
	playerIds 
= 
tiles 
. 
Select $
($ %
tile% )
=>* ,
tile- 1
.1 2

PlayerShip2 <
.< =
PlayerId= E
)E F
.F G
DistinctG O
(O P
)P Q
.Q R
ToListR X
(X Y
)Y Z
;Z [
var 
( 
playerOneId 
, 
playerTwoId %
)% &
=' (
() *
	playerIds* 3
[3 4
$num4 5
]5 6
,6 7
	playerIds8 A
[A B
$numB C
]C D
)D E
;E F
var %
isPlayerOneShipsDestroyed %
=& '%
IsAllPlayerShipsDestroyed( A
(A B
tilesB G
,G H
playerOneIdI T
)T U
;U V
var %
isPlayerTwoShipsDestroyed %
=& '%
IsAllPlayerShipsDestroyed( A
(A B
tilesB G
,G H
playerTwoIdI T
)T U
;U V
return %
isPlayerOneShipsDestroyed (
||) +%
isPlayerTwoShipsDestroyed, E
;E F
} 
private!! 
bool!! %
IsAllPlayerShipsDestroyed!! *
(!!* +
List!!+ /
<!!/ 0
ShipTile!!0 8
>!!8 9
tiles!!: ?
,!!? @
Guid!!A E
playerId!!F N
)!!N O
{"" 
return## 
tiles## 
.$$ 
Where$$ 
($$ 
tile$$ 
=>$$ 
tile$$ 
.$$  

PlayerShip$$  *
.$$* +
PlayerId$$+ 3
==$$4 6
playerId$$7 ?
)$$? @
.%% 
All%% 
(%% 
tile%% 
=>%% 
tile%% 
.%% 
IsDestroyed%% )
)%%) *
;%%* +
}&& 
public(( 

string(( 
StrategyType(( 
=>(( !
Data((" &
.((& '
	Constants((' 0
.((0 1
EndgameStrategies((1 B
.((B C
Classic((C J
;((J K
})) ∏
VD:\dev\Battleships\Battleships\Services\EndgameStrategies\DeathMatchEndgameStrategy.cs
	namespace 	
Battleships
 
. 
Services 
. 
EndgameStrategies 0
;0 1
public

 
class

 %
DeathMatchEndgameStrategy

 &
:

' (
IEndgameStrategy

) 9
{ 
private 
readonly  
IBattleshipsDatabase ) 
_battleshipsDatabase* >
;> ?
public 
%
DeathMatchEndgameStrategy $
($ % 
IBattleshipsDatabase% 9
battleshipsDatabase: M
)M N
{  
_battleshipsDatabase 
= 
battleshipsDatabase 2
;2 3
} 
public 

async 
Task 
< 
bool 
> 
IsEndgameReached ,
(, -
Guid- 1
gameSessionId2 ?
)? @
{ 
var 
tiles 
= 
await  
_battleshipsDatabase .
.. /
ShipTilesRepository/ B
.B C
GetSessionShipTilesC V
(V W
gameSessionIdW d
)d e
;e f
var 
playerShipIds 
= 
tiles !
.! "
Select" (
(( )
tile) -
=>. 0
tile1 5
.5 6
PlayerShipId6 B
)B C
.C D
DistinctD L
(L M
)M N
.N O
ToListO U
(U V
)V W
;W X
var 
isAnyShipDestroyed 
=  
playerShipIds! .
.. /
Any/ 2
(2 3
playerShipId3 ?
=>@ B
IsShipDestroyedC R
(R S
tilesS X
,X Y
playerShipIdZ f
)f g
)g h
;h i
return 
isAnyShipDestroyed !
;! "
} 
private 
bool 
IsShipDestroyed  
(  !
List! %
<% &
ShipTile& .
>. /
tiles0 5
,5 6
Guid7 ;
playerShipId< H
)H I
{ 
return 
tiles 
.   
Where   
(   
tile   
=>   
tile   
.    
PlayerShipId    ,
==  - /
playerShipId  0 <
)  < =
.!! 
All!! 
(!! 
tile!! 
=>!! 
tile!! 
.!! 
IsDestroyed!! )
)!!) *
;!!* +
}"" 
public$$ 

string$$ 
StrategyType$$ 
=>$$ !
Data$$" &
.$$& '
	Constants$$' 0
.$$0 1
EndgameStrategies$$1 B
.$$B C

DeathMatch$$C M
;$$M N
}%% à'
^D:\dev\Battleships\Battleships\Services\EndgameStrategies\DestroyedShipCountEndgameStrategy.cs
	namespace 	
Battleships
 
. 
Services 
. 
EndgameStrategies 0
;0 1
public

 
class

 -
!DestroyedShipCountEndgameStrategy

 .
:

/ 0
IEndgameStrategy

1 A
{ 
private 
readonly  
IBattleshipsDatabase ) 
_battleshipsDatabase* >
;> ?
public 
-
!DestroyedShipCountEndgameStrategy ,
(, - 
IBattleshipsDatabase- A
battleshipsDatabaseB U
)U V
{  
_battleshipsDatabase 
= 
battleshipsDatabase 2
;2 3
} 
public 

async 
Task 
< 
bool 
> 
IsEndgameReached ,
(, -
Guid- 1
gameSessionId2 ?
)? @
{ 
var &
requiredDestroyedShipCount &
=' (
await) . 
_battleshipsDatabase/ C
. "
GameSessionsRepository #
.# $)
GetRequiredDestroyedShipCount$ A
(A B
gameSessionIdB O
)O P
;P Q
var 
tiles 
= 
await  
_battleshipsDatabase .
.. /
ShipTilesRepository/ B
.B C
GetSessionShipTilesC V
(V W
gameSessionIdW d
)d e
;e f
var 
	playerIds 
= 
tiles 
. 
Select $
($ %
tile% )
=>* ,
tile- 1
.1 2

PlayerShip2 <
.< =
PlayerId= E
)E F
.F G
DistinctG O
(O P
)P Q
.Q R
ToListR X
(X Y
)Y Z
;Z [
var %
destroyedPlayerShipCounts %
=& '
	playerIds( 1
.1 2
Select2 8
(8 9
playerId9 A
=>B D'
GetDestroyedPlayerShipCountE `
(` a
tilesa f
,f g
playerIdh p
)p q
)q r
;r s
return %
destroyedPlayerShipCounts (
.( )
Any) ,
(, -
count- 2
=>3 5
count6 ;
>=< >&
requiredDestroyedShipCount? Y
)Y Z
;Z [
} 
private 
int '
GetDestroyedPlayerShipCount +
(+ ,
List, 0
<0 1
ShipTile1 9
>9 :
tiles; @
,@ A
GuidB F
playerIdG O
)O P
{   
var!! 
playerTiles!! 
=!! 
tiles!! 
.!!  
Where!!  %
(!!% &
tile!!& *
=>!!+ -
tile!!. 2
.!!2 3

PlayerShip!!3 =
.!!= >
PlayerId!!> F
==!!G I
playerId!!J R
)!!R S
.!!S T
ToList!!T Z
(!!Z [
)!![ \
;!!\ ]
var"" 
playerShipIds"" 
="" 
playerTiles"" '
.""' (
Select""( .
("". /
tile""/ 3
=>""4 6
tile""7 ;
.""; <
PlayerShipId""< H
)""H I
.""I J
Distinct""J R
(""R S
)""S T
.""T U
ToList""U [
(""[ \
)""\ ]
;""] ^
var$$ 
destroyedShipCount$$ 
=$$  
playerShipIds$$! .
.$$. /
Count$$/ 4
($$4 5
id$$5 7
=>$$8 :
IsShipDestroyed$$; J
($$J K
playerTiles$$K V
,$$V W
id$$X Z
)$$Z [
)$$[ \
;$$\ ]
return&& 
destroyedShipCount&& !
;&&! "
}'' 
private)) 
bool)) 
IsShipDestroyed))  
())  !
List))! %
<))% &
ShipTile))& .
>)). /
tiles))0 5
,))5 6
Guid))7 ;
playerShipId))< H
)))H I
{** 
return++ 
tiles++ 
.,, 
Where,, 
(,, 
tile,, 
=>,, 
tile,, 
.,,  
PlayerShipId,,  ,
==,,- /
playerShipId,,0 <
),,< =
.-- 
All-- 
(-- 
tile-- 
=>-- 
tile-- 
.-- 
IsDestroyed-- )
)--) *
;--* +
}.. 
public00 

string00 
StrategyType00 
=>00 !
Data00" &
.00& '
	Constants00' 0
.000 1
EndgameStrategies001 B
.00B C
DestroyedShipCount00C U
;00U V
}11 ˙
MD:\dev\Battleships\Battleships\Services\EndgameStrategies\IEndgameStrategy.cs
	namespace 	
Battleships
 
. 
Services 
. 
EndgameStrategies 0
;0 1
public 
	interface 
IEndgameStrategy !
{ 
Task 
< 	
bool	 
> 
IsEndgameReached 
(  
Guid  $
gameSessionId% 2
)2 3
;3 4
public		 

string		 
StrategyType		 
{		  
get		! $
;		$ %
}		& '
}

 ø
[D:\dev\Battleships\Battleships\Services\EndgameStrategies\RoundCountLimitEndgameStrategy.cs
	namespace 	
Battleships
 
. 
Services 
. 
EndgameStrategies 0
;0 1
public 
class *
RoundCountLimitEndgameStrategy +
:, -
IEndgameStrategy. >
{ 
private		 
readonly		  
IBattleshipsDatabase		 ) 
_battleshipsDatabase		* >
;		> ?
public 
*
RoundCountLimitEndgameStrategy )
() * 
IBattleshipsDatabase 
battleshipsDatabase 0
) 
{  
_battleshipsDatabase 
= 
battleshipsDatabase 2
;2 3
} 
public 

async 
Task 
< 
bool 
> 
IsEndgameReached ,
(, -
Guid- 1
gameSessionId2 ?
)? @
{ 
var 
round 
= 
await  
_battleshipsDatabase .
.. /"
GameSessionsRepository/ E
.E F
GetCurrentRoundF U
(U V
gameSessionIdV c
)c d
;d e
var 
settings 
= 
await  
_battleshipsDatabase 1
.1 2)
GameSessionSettingsRepository2 O
.O P
GetBySessionIdP ^
(^ _
gameSessionId_ l
)l m
;m n
return 
round 
>= 
settings  
.  !%
RoundCountLimitForEndgame! :
;: ;
} 
public 

string 
StrategyType 
=> !
Data" &
.& '
	Constants' 0
.0 1
EndgameStrategies1 B
.B C
RoundCountLimitC R
;R S
} ˜
AD:\dev\Battleships\Battleships\Services\EndgameStrategyService.cs
	namespace 	
Battleships
 
. 
Services 
; 
public

 
class

 "
EndgameStrategyService

 #
:

$ %#
IEndgameStrategyService

& =
{ 
private 
readonly  
IBattleshipsDatabase ) 
_battleshipsDatabase* >
;> ?
private 
readonly 
IEnumerable  
<  !
IEndgameStrategy! 1
>1 2
_endgameStrategies3 E
;E F
public 
"
EndgameStrategyService !
(! " 
IBattleshipsDatabase 
battleshipsDatabase 0
,0 1
IEnumerable 
< 
IEndgameStrategy $
>$ %
endgameStrategies& 7
) 
{  
_battleshipsDatabase 
= 
battleshipsDatabase 2
;2 3
_endgameStrategies 
= 
endgameStrategies .
;. /
} 
public 

async 
Task 
< 
IEndgameStrategy &
>& '
GetEndgameStrategy( :
(: ;
Guid; ?
gameSessionId@ M
)M N
{ 
var 
strategyString 
= 
await " 
_battleshipsDatabase# 7
.7 8"
GameSessionsRepository8 N
.N O
GetEndgameStrategyO a
(a b
gameSessionIdb o
)o p
;p q
var 
endgameStrategy 
= 
_endgameStrategies 0
.0 1
First1 6
(6 7
strategy7 ?
=>@ B
strategyC K
.K L
StrategyTypeL X
==Y [
strategyString\ j
)j k
;k l
return 
endgameStrategy 
; 
} 
} é$
HD:\dev\Battleships\Battleships\Services\GameSession\GameLaunchService.cs
	namespace 	
Battleships
 
. 
Services 
. 
GameSession *
;* +
public		 
class		 
GameLaunchService		 
:		  
IGameLaunchService		! 3
{

 
private 
readonly  
IBattleshipsDatabase ) 
_battleshipsDatabase* >
;> ?
private 
readonly (
IPlayerShipGenerationService 1(
_playerShipGenerationService2 N
;N O
public 

GameLaunchService 
(  
IBattleshipsDatabase 
battleshipsDatabase 0
,0 1(
IPlayerShipGenerationService $'
playerShipGenerationService% @
)@ A
{  
_battleshipsDatabase 
= 
battleshipsDatabase 2
;2 3(
_playerShipGenerationService $
=% &'
playerShipGenerationService' B
;B C
} 
public 

async 
Task 

LaunchGame  
(  !
Guid! %
gameSessionId& 3
,3 4
bool5 9
rematch: A
)A B
{ 
if 

( 
rematch 
) 
{ 	
await 
LaunchRematch 
(  
gameSessionId  -
)- .
;. /
} 	
else 
{ 	
await 

LaunchGame 
( 
gameSessionId *
)* +
;+ ,
} 	
}   
private"" 
async"" 
Task"" 
LaunchRematch"" $
(""$ %
Guid""% )
gameSessionId""* 7
)""7 8
{## 
var$$ 
gameSession$$ 
=$$ 
await$$  
_battleshipsDatabase$$  4
.$$4 5"
GameSessionsRepository$$5 K
.$$K L%
GetWithPlayersAndSettings$$L e
($$e f
gameSessionId$$f s
)$$s t
;$$t u
var%% 
deepCopy%% 
=%% 
gameSession%% "
.%%" #
	DeepClone%%# ,
(%%, -
gameSession%%- 8
)%%8 9
as%%: <
Models%%= C
.%%C D
GameSession%%D O
;%%O P
var'' 
playerShips'' 
='' 
await'' (
_playerShipGenerationService''  <
.''< =
GeneratePlayerShips''= P
(''P Q
gameSession''Q \
.''\ ]
Settings''] e
)''e f
;''f g
deepCopy)) 
.)) 
Status)) 
=)) 
GameSessionStatus)) +
.))+ ,

InProgress)), 6
;))6 7
await++  
_battleshipsDatabase++ "
.++" #!
PlayerShipsRepository++# 8
.++8 9

CreateMany++9 C
(++C D
playerShips++D O
)++O P
;++P Q
await,,  
_battleshipsDatabase,, "
.,," #"
GameSessionsRepository,,# 9
.,,9 :
Update,,: @
(,,@ A
deepCopy,,A I
),,I J
;,,J K
}-- 
public// 

async// 
Task// 

LaunchGame//  
(//  !
Guid//! %
gameSessionId//& 3
)//3 4
{00 
var11 
gameSession11 
=11 
await11  
_battleshipsDatabase11  4
.114 5"
GameSessionsRepository115 K
.11K L
GetById11L S
(11S T
gameSessionId11T a
)11a b
;11b c
var22 
playerShips22 
=22 
await22 (
_playerShipGenerationService22  <
.22< =
GeneratePlayerShips22= P
(22P Q
gameSession22Q \
.22\ ]
Settings22] e
)22e f
;22f g
gameSession44 
.44 
Status44 
=44 
GameSessionStatus44 .
.44. /

InProgress44/ 9
;449 :
await66  
_battleshipsDatabase66 "
.66" #!
PlayerShipsRepository66# 8
.668 9

CreateMany669 C
(66C D
playerShips66D O
)66O P
;66P Q
await77  
_battleshipsDatabase77 "
.77" #"
GameSessionsRepository77# 9
.779 :
Update77: @
(77@ A
gameSession77A L
)77L M
;77M N
}88 
}99 ‚:
ID:\dev\Battleships\Battleships\Services\GameSession\GameSessionService.cs
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
class 
GameSessionService #
:$ %
IGameSessionService& 9
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
;@ A
public 
GameSessionService !
(! " 
IBattleshipsDatabase  
battleshipsDatabase! 4
,4 5
ICurrentUserService 
userService  +
) 	
{ 	 
_battleshipsDatabase  
=! "
battleshipsDatabase# 6
;6 7
_currentUserService 
=  !
userService" -
;- .
} 	
public 
async 
Task 
< 
Guid 
> 
CreateSession  -
(- .!
GameSessionRequestDto. C
dtoD G
)G H
{ 	
return 
await 
new 
GameSessionFacade .
(. / 
_battleshipsDatabase/ C
,C D
_currentUserServiceE X
,X Y
dtoZ ]
)] ^
.^ _
CreateGameSession_ p
(p q
)q r
;r s
}   	
public"" 
async"" 
Task"" 
<"" 
List"" 
<"" 
GameSessionDto"" -
>""- .
>"". /
ListAllSessions""0 ?
(""? @
)""@ A
{## 	
var$$ 
models$$ 
=$$ 
await$$  
_battleshipsDatabase$$ 3
.$$3 4"
GameSessionsRepository$$4 J
.$$J K
GetAll$$K Q
($$Q R
)$$R S
;$$S T
return%% 
models%% 
.%% 
Select%%  
(%%  !
x%%! "
=>%%# %
x%%& '
.%%' (
toDto%%( -
(%%- .
)%%. /
)%%/ 0
.%%0 1
ToList%%1 7
(%%7 8
)%%8 9
;%%9 :
}&& 	
public(( 
async(( 
Task(( 
<(( 
GameSessionDto(( (
>((( )

GetSession((* 4
(((4 5
Guid((5 9
id((: <
)((< =
{)) 	
return** 
await**  
_battleshipsDatabase** -
.**- ."
GameSessionsRepository**. D
.**D E
GetDtoWithPlayers**E V
(**V W
id**W Y
)**Y Z
;**Z [
}++ 	
public-- 
async-- 
Task-- 
<-- 
InGameSessionDto-- *
>--* +
GetInGameSession--, <
(--< =
Guid--= A
gameSessionId--B O
)--O P
{.. 	
var// 
currentUserId// 
=// 
_currentUserService//  3
.//3 4
GetCurrentUserId//4 D
(//D E
)//E F
;//F G
var11 
(11 
ownPlayerId11 
,11 
opponentPlayerId11 .
)11. /
=110 1
await112 7 
_battleshipsDatabase118 L
.11L M"
GameSessionsRepository11M c
.11c d
GetPlayerIds11d p
(11p q
gameSessionId11q ~
,11~ 
currentUserId
11Ä ç
)
11ç é
;
11é è
var22 
ownTiles22 
=22 
await22   
_battleshipsDatabase22! 5
.225 6
ShipTilesRepository226 I
.22I J
GetPlayerTiles22J X
(22X Y
ownPlayerId22Y d
)22d e
;22e f
var33 
opponentTiles33 
=33 
await33  % 
_battleshipsDatabase33& :
.33: ;
ShipTilesRepository33; N
.33N O
GetPlayerTiles33O ]
(33] ^
opponentPlayerId33^ n
)33n o
;33o p
var55 
dto55 
=55 
await55  
_battleshipsDatabase55 0
.550 1"
GameSessionsRepository551 G
.55G H
GetInGameSession55H X
(55X Y
gameSessionId55Y f
,55f g
currentUserId55h u
)55u v
;55v w
dto66 
.66 
OwnTiles66 
=66 
GetTileDtos66 &
(66& '
ownTiles66' /
,66/ 0
dto661 4
.664 5
ColumnCount665 @
,66@ A
dto66B E
.66E F
RowCount66F N
)66N O
;66O P
dto77 
.77 
OpponentTiles77 
=77 
GetTileDtos77  +
(77+ ,
opponentTiles77, 9
,779 :
dto77; >
.77> ?
ColumnCount77? J
,77J K
dto77L O
.77O P
RowCount77P X
)77X Y
;77Y Z
return99 
dto99 
;99 
}:: 	
private<< 
List<< 
<<< 
GameTile<< 
><< 
GetTileDtos<< *
(<<* +
List<<+ /
<<</ 0
ShipTile<<0 8
><<8 9
	shipTiles<<: C
,<<C D
int<<E H
columnCount<<I T
,<<T U
int<<V Y
rowCount<<Z b
)<<b c
{== 	
var>> 
tiles>> 
=>> 

Enumerable>> "
.>>" #
Range>># (
(>>( )
$num>>) *
,>>* +
columnCount>>, 7
)>>7 8
.>>8 9

SelectMany>>9 C
(>>C D
columnCoordinate>>D T
=>>>U W
{?? 
return@@ 

Enumerable@@ !
.@@! "
Range@@" '
(@@' (
$num@@( )
,@@) *
rowCount@@+ 3
)@@3 4
.@@4 5
Select@@5 ;
(@@; <
rowCoordinate@@< I
=>@@J L
{AA 
varBB 
shipTileBB  
=BB! "
	shipTilesBB# ,
.BB, -
FirstOrDefaultBB- ;
(BB; <
stBB< >
=>BB? A
stCC 
.CC 
XCoordinateCC &
==CC' )
columnCoordinateCC* :
&&CC; =
stCC> @
.CC@ A
YCoordinateCCA L
==CCM O
rowCoordinateCCP ]
)DD 
;DD 
varFF 
tileFF 
=FF 
newFF "
GameTileFF# +
{GG 
ColumnCoordinateHH (
=HH) *
columnCoordinateHH+ ;
,HH; <
RowCoordinateII %
=II& '
rowCoordinateII( 5
,II5 6
IsShipJJ 
=JJ  
shipTileJJ! )
isJJ* ,
notJJ- 0
nullJJ1 5
,JJ5 6
IsDestroyedKK #
=KK$ %
shipTileKK& .
isKK/ 1
notKK2 5
nullKK6 :
?LL 
shipTileLL &
.LL& '
IsDestroyedLL' 2
:MM 
falseMM #
}NN 
;NN 
returnPP 
tilePP 
;PP  
}QQ 
)QQ 
;QQ 
}RR 
)RR 
;RR 
returnTT 
tilesTT 
.TT 
ToListTT 
(TT  
)TT  !
;TT! "
}VV 	
}WW 
}XX ®
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
;5 6
public 
	interface 
IGameLaunchService #
{ 
Task 

LaunchGame	 
( 
Guid 
gameSessionId &
)& '
;' (
Task		 

LaunchGame			 
(		 
Guid		 
gameSessionId		 &
,		& '
bool		( ,
rematch		- 4
)		4 5
;		5 6
}

 Ö	
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
;C D
} 
} ˚
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
;5 6
public 
	interface (
IPlayerShipGenerationService -
{		 
Task

 
<

 	
List

	 
<

 

PlayerShip

 
>

 
>

 
GeneratePlayerShips

 .
(

. /
GameSessionSettings

/ B
settings

C K
)

K L
;

L M
} ÜF
RD:\dev\Battleships\Battleships\Services\GameSession\PlayerShipGenerationService.cs
	namespace 	
Battleships
 
. 
Services 
. 
GameSession *
;* +
public 
class '
PlayerShipGenerationService (
:) *(
IPlayerShipGenerationService+ G
{ 
private 
readonly  
IBattleshipsDatabase ) 
_battleshipsDatabase* >
;> ?
private 
readonly 
ICurrentUserService (
_currentUserService) <
;< =
private 
readonly "
NumberGeneratorFactory +#
_numberGeneratorFactory, C
;C D
public 
'
PlayerShipGenerationService &
(& ' 
IBattleshipsDatabase 
battleshipsDatabase 0
,0 1
ICurrentUserService 
currentUserService .
,. /"
NumberGeneratorFactory "
numberGeneratorFactory 5
)5 6
{  
_battleshipsDatabase 
= 
battleshipsDatabase 2
;2 3
_currentUserService 
= 
currentUserService 0
;0 1#
_numberGeneratorFactory 
=  !"
numberGeneratorFactory" 8
;8 9
} 
public 

async 
Task 
< 
List 
< 

PlayerShip %
>% &
>& '
GeneratePlayerShips( ;
(; <
GameSessionSettings< O
settingsP X
)X Y
{   
var!! 
currentUserId!! 
=!! 
_currentUserService!! /
.!!/ 0
GetCurrentUserId!!0 @
(!!@ A
)!!A B
;!!B C
var"" 
("" 
ownPlayerId"" 
,"" 
opponentPlayerId"" *
)""* +
="", -
await##  
_battleshipsDatabase## &
.##& '"
GameSessionsRepository##' =
.##= >
GetPlayerIds##> J
(##J K
settings##K S
.##S T
GameSessionId##T a
,##a b
currentUserId##c p
)##p q
;##q r
var%% 
playerShips%% 
=%% 

Enumerable%% $
.%%$ %
Empty%%% *
<%%* +

PlayerShip%%+ 5
>%%5 6
(%%6 7
)%%7 8
.&& 
Concat&& 
(&& 
await&& 
GenerateShips&& '
(&&' (
ownPlayerId&&( 3
,&&3 4
settings&&5 =
)&&= >
)&&> ?
.'' 
Concat'' 
('' 
await'' 
GenerateShips'' '
(''' (
opponentPlayerId''( 8
,''8 9
settings'': B
)''B C
)''C D
.(( 
ToList(( 
((( 
)(( 
;(( 
return** 
playerShips** 
;** 
}++ 
private-- 
async-- 
Task-- 
<-- 
List-- 
<-- 

PlayerShip-- &
>--& '
>--' (
GenerateShips--) 6
(--6 7
Guid--7 ;
playerId--< D
,--D E
GameSessionSettings--F Y
settings--Z b
)--b c
{.. 
var// 
columnCount// 
=// 
settings// "
.//" #
ColumnCount//# .
;//. /
var00 
rowCount00 
=00 
settings00 
.00  
RowCount00  (
;00( )
var22 
rowStartGenerator22 
=22 #
_numberGeneratorFactory22  7
.227 8
GetNumberGenerator228 J
(22J K
rowCount22K S
)22S T
;22T U
var33  
columnStartGenerator33  
=33! "#
_numberGeneratorFactory33# :
.33: ;
GetNumberGenerator33; M
(33M N
columnCount33N Y
)33Y Z
;33Z [
var55 
shipTypeTuples55 
=55 
new55  
List55! %
<55% &
(55& '
string55' -
,55- .
int55/ 2
)552 3
>553 4
(554 5
)555 6
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
var@@ 
playerShips@@ 
=@@ 
new@@ 
List@@ "
<@@" #

PlayerShip@@# -
>@@- .
(@@. /
)@@/ 0
;@@0 1
whileBB 
(BB 
playerShipsBB 
.BB 
CountBB  
<BB! "
$numBB# $
)BB$ %
{CC 	
varDD 
columnDD 
=DD  
columnStartGeneratorDD -
.DD- .
GenerateNumberDD. <
(DD< =
)DD= >
;DD> ?
ifFF 
(FF 
playerShipsFF 
.FF 
AnyFF 
(FF  
shipFF  $
=>FF% '
shipFF( ,
.FF, -
TilesFF- 2
.FF2 3
AnyFF3 6
(FF6 7
tileFF7 ;
=>FF< >
tileFF? C
.FFC D
XCoordinateFFD O
==FFP R
columnFFS Y
)FFY Z
)FFZ [
)FF[ \
{GG 
continueHH 
;HH 
}II 
varKK 
rowKK 
=KK 
rowStartGeneratorKK '
.KK' (
GenerateNumberKK( 6
(KK6 7
)KK7 8
;KK8 9
varMM 
	directionMM 
=MM 
rowMM 
<MM  !
(MM" #
rowCountMM# +
/MM, -
$numMM. /
)MM/ 0
?MM1 2
$strMM3 9
:MM: ;
$strMM< @
;MM@ A
varNN 
shipTypeTupleNN 
=NN 
shipTypeTuplesNN  .
[NN. /
playerShipsNN/ :
.NN: ;
CountNN; @
]NN@ A
;NNA B
varPP 
	shipTilesPP 
=PP 

EnumerablePP &
.PP& '
RangePP' ,
(PP, -
rowPP- 0
,PP0 1
shipTypeTuplePP2 ?
.PP? @
Item2PP@ E
)PPE F
.PPF G
SelectPPG M
(PPM N
rawRowNumberPPN Z
=>PP[ ]
{QQ 
varRR 
	rowNumberRR 
=RR 
	directionRR  )
==RR* ,
$strRR- 3
?RR4 5
rawRowNumberRR6 B
:RRC D
rowRRE H
-RRI J
(RRK L
rawRowNumberRRL X
-RRY Z
rowRR[ ^
)RR^ _
;RR_ `
returnTT 
newTT 
ShipTileBuilderTT *
(TT* +
)TT+ ,
.UU 
WithXCoordinateUU $
(UU$ %
columnUU% +
)UU+ ,
.VV 
WithYCoordinateVV $
(VV$ %
	rowNumberVV% .
)VV. /
.WW 
BuildWW 
(WW 
)WW 
;WW 
}YY 
)YY 
.YY 
ToListYY 
(YY 
)YY 
;YY 
var[[ 
ship[[ 
=[[ 
await[[  
_battleshipsDatabase[[ 1
.[[1 2
ShipsRepository[[2 A
.[[A B
	GetByType[[B K
([[K L
shipTypeTuple[[L Y
.[[Y Z
Item1[[Z _
)[[_ `
;[[` a
var]] 

playerShip]] 
=]] 
new]]  

PlayerShip]]! +
{^^ 
PlayerId__ 
=__ 
playerId__ #
,__# $
Tiles`` 
=`` 
	shipTiles`` !
,``! "
ShipIdaa 
=aa 
shipaa 
.aa 
Idaa  
}bb 
;bb 
playerShipsdd 
.dd 
Adddd 
(dd 

playerShipdd &
)dd& '
;dd' (
}ee 	
returngg 
playerShipsgg 
;gg 
}hh 
}ii ®
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
 ˚
:D:\dev\Battleships\Battleships\Services\IEndgameService.cs
	namespace 	
Battleships
 
. 
Services 
; 
public 
	interface 
IEndgameService  
{ 
Task 
< 	
bool	 
> 
IsEndgameReached 
(  
Guid  $
gameSessionId% 2
)2 3
;3 4
Task		 
EndGameSession			 
(		 
Guid		 
gameSessionId		 *
,		* +
string		, 2

attackerId		3 =
)		= >
;		> ?
}

 ÷
BD:\dev\Battleships\Battleships\Services\IEndgameStrategyService.cs
	namespace 	
Battleships
 
. 
Services 
; 
public 
	interface #
IEndgameStrategyService (
{ 
Task		 
<		 	
IEndgameStrategy			 
>		 
GetEndgameStrategy		 -
(		- .
Guid		. 2
gameSessionId		3 @
)		@ A
;		A B
}

 ”
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
	namespace 	
Battleships
 
. 
Services 
. 
Players &
{ 
public 

class 
PlayersService 
:  !
IPlayersService" 1
{ 
private 
readonly  
IBattleshipsDatabase -
_db. 1
;1 2
private 
readonly 
UserManager $
<$ %
ApplicationUser% 4
>4 5
_userManager6 B
;B C
private 
readonly 
ICurrentUserService ,
_currentUserService- @
;@ A
public 
PlayersService 
(  
IBattleshipsDatabase  
database! )
,) *
UserManager 
< 
ApplicationUser '
>' (
userManager) 4
,4 5
ICurrentUserService 
currentUserService  2
)2 3
{ 	
_db 
= 
database 
; 
_userManager 
= 
userManager &
;& '
_currentUserService 
=  !
currentUserService" 4
;4 5
} 	
public 
async 
Task 
< 
List 
< 
UserDto &
>& '
>' (
GetAllUsers) 4
(4 5
)5 6
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
var## 
users## 
=## 
await## 
_userManager## *
.##* +
Users##+ 0
.$$ 
Where$$ 
($$ 
u$$ 
=>$$ 
u$$ 
.$$ 
Id$$  
!=$$! #
currentUserId$$$ 1
)$$1 2
.%% 
Select%% 
(%% 
u%% 
=>%% 
new%%  
UserDto%%! (
{&& 
Id'' 
='' 
u'' 
.'' 
Id'' 
,'' 
Name(( 
=(( 
u(( 
.(( 
UserName(( %
,((% &
GamesPlayedCount)) $
=))% &
u))' (
.))( )
Players))) 0
.))0 1
Count))1 6
,))6 7
GamesWonCount** !
=**" #
u**$ %
.**% &
WonGames**& .
.**. /
Count**/ 4
}++ 
)++ 
.,, 
ToListAsync,, 
(,, 
),, 
;,, 
return.. 
users.. 
;.. 
}// 	
public11 
async11 
Task11 
<11 
List11 
<11 
UserDto11 &
>11& '
>11' (
GetLobbyUsers11) 6
(116 7
Guid117 ;
gameSessionId11< I
)11I J
{22 	
var33 
users33 
=33 
await33 
_userManager33 *
.33* +
Users33+ 0
.44 
Where44 
(44 
u44 
=>44 
u44 
.44 
Players44 %
.44% &
All44& )
(44) *
p44* +
=>44, .
p44/ 0
.440 1
GameSessionId441 >
!=44? A
gameSessionId44B O
)44O P
)44P Q
.55 
Select55 
(55 
u55 
=>55 
new55  
UserDto55! (
{66 
Id77 
=77 
u77 
.77 
Id77 
,77 
Name88 
=88 
u88 
.88 
UserName88 %
,88% &
GamesPlayedCount99 $
=99% &
u99' (
.99( )
Players99) 0
.990 1
Count991 6
,996 7
GamesWonCount:: !
=::" #
u::$ %
.::% &
WonGames::& .
.::. /
Count::/ 4
};; 
);; 
.<< 
ToListAsync<< 
(<< 
)<< 
;<< 
return>> 
users>> 
;>> 
}?? 	
publicAA 
asyncAA 
TaskAA 
InviteUserToGameAA *
(AA* +
GuidAA+ /
gameSessionIdAA0 =
,AA= >
stringAA? E
userIdAAF L
)AAL M
{BB 	
varCC 
playerCC 
=CC 
newCC 
PlayerCC #
{DD 
GameSessionIdEE 
=EE 
gameSessionIdEE  -
,EE- .
UserIdFF 
=FF 
userIdFF 
}GG 
;GG 
awaitII 
_dbII 
.II 
PlayersRepositoryII '
.II' (
CreateII( .
(II. /
playerII/ 5
)II5 6
;II6 7
}JJ 	
}KK 
}LL ù
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
await 
Clients 
. 
Group 
(  
gameSessionIdString  3
)3 4
.4 5
	SendAsync5 >
(> ?
$str? Y
)Y Z
;Z [
await 
Groups 
. 
AddToGroupAsync (
(( )
Context) 0
.0 1
ConnectionId1 =
,= >
gameSessionIdString? R
)R S
;S T
} 	
public 
async 
Task %
DisconnectFromGameSession 3
(3 4
string4 :
gameSessionIdString; N
)N O
{ 	
await 
Groups 
.  
RemoveFromGroupAsync -
(- .
Context. 5
.5 6
ConnectionId6 B
,B C
gameSessionIdStringD W
)W X
;X Y
}   	
public"" 
async"" 
Task"" 
PublishAttack"" '
(""' (
AttackPayload""( 5
attack""6 <
)""< =
{## 	
await$$ #
_attackExecutionService$$ )
.$$) *
ExecuteAttack$$* 7
($$7 8
attack$$8 >
)$$> ?
;$$? @
await%% 
Clients%% 
.%% 
Group%% 
(%%  
attack%%  &
.%%& '
GameSessionId%%' 4
.%%4 5
ToString%%5 =
(%%= >
)%%> ?
)%%? @
.%%@ A
	SendAsync%%A J
(%%J K
$str%%K Z
,%%Z [
attack%%] c
)%%c d
;%%d e
}&& 	
}'' 
}(( ‘
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
)? @
{ 	
await 
_battleshipsHub !
.! "
Clients" )
.) *
Group* /
(/ 0
gameSessionId0 =
.= >
ToString> F
(F G
)G H
)H I
.I J
	SendAsyncJ S
(S T
$strT d
)d e
;e f
} 	
public 
async 
Task 
SendAttackMessage +
(+ ,
Guid, 0
gameSessionId1 >
,> ?
BattleshipsMessage@ R
<R S
AttackPayloadS `
>` a
messageb i
)i j
{ 	
await 
_battleshipsHub !
.! "
Clients" )
.) *
Group* /
(/ 0
gameSessionId0 =
.= >
ToString> F
(F G
)G H
)H I
.I J
	SendAsyncJ S
(S T
$strT a
,a b
messagec j
)j k
;k l
} 	
public 
async 
Task !
SendLaunchGameMessage /
(/ 0
Guid0 4
gameSessionId5 B
)B C
{ 	
await 
_battleshipsHub !
.! "
Clients" )
.) *
Group* /
(/ 0
gameSessionId0 =
.= >
ToString> F
(F G
)G H
)H I
.I J
	SendAsyncJ S
(S T
$strT b
,b c
newd g
{h i
gameSessionIdj w
}x y
)y z
;z {
} 	
public!! 
async!! 
Task!! 
InviteUserToGame!! *
(!!* +
Guid!!+ /
gameSessionId!!0 =
,!!= >
string!!? E
userId!!F L
)!!L M
{"" 	
var## 
group## 
=## 
_battleshipsHub## (
.##( )
Clients##) 0
.##0 1
Group##1 6
(##6 7
userId##7 =
)##= >
;##> ?
await$$ 
group$$ 
.$$ 
	SendAsync$$ !
($$! "
$str$$" +
,$$+ ,
new$$- 0
{$$1 2
gameSessionId$$3 @
}$$A B
)$$B C
;$$C D
}%% 	
}&& 
}'' …
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
)		2 3
;		3 4
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
} âh
)D:\dev\Battleships\Battleships\Startup.cs
	namespace 	
Battleships
 
{ 
public 

class 
Startup 
{   
public!! 
Startup!! 
(!! 
IConfiguration!! %
configuration!!& 3
)!!3 4
{"" 	
Configuration## 
=## 
configuration## )
;##) *
}$$ 	
public&& 
IConfiguration&& 
Configuration&& +
{&&, -
get&&. 1
;&&1 2
}&&3 4
public)) 
void)) 
ConfigureServices)) %
())% &
IServiceCollection))& 8
services))9 A
)))A B
{** 	
services++ 
.++ 
AddDbContext++ !
<++! " 
ApplicationDbContext++" 6
>++6 7
(++7 8
options++8 ?
=>++@ B
options,, 
.,, 
	UseNpgsql,, !
(,,! "
Configuration,," /
.,,/ 0
GetConnectionString,,0 C
(,,C D
$str,,D W
),,W X
),,X Y
),,Y Z
;,,Z [
services.. 
... 3
'AddDatabaseDeveloperPageExceptionFilter.. <
(..< =
)..= >
;..> ?
services00 
.00 
AddDefaultIdentity00 '
<00' (
ApplicationUser00( 7
>007 8
(008 9
options009 @
=>00A C
{11 
options22 
.22 
SignIn22 "
.22" ##
RequireConfirmedAccount22# :
=22; <
true22= A
;22A B
options33 
.33 
Password33 $
.33$ %
RequireDigit33% 1
=332 3
false334 9
;339 :
options44 
.44 
Password44 $
.44$ %
RequiredLength44% 3
=444 5
$num446 7
;447 8
options55 
.55 
Password55 $
.55$ %
RequireLowercase55% 5
=556 7
false558 =
;55= >
options66 
.66 
Password66 $
.66$ %
RequireUppercase66% 5
=666 7
false668 =
;66= >
options77 
.77 
Password77 $
.77$ %
RequiredUniqueChars77% 8
=779 :
$num77; <
;77< =
options88 
.88 
Password88 $
.88$ %"
RequireNonAlphanumeric88% ;
=88< =
false88> C
;88C D
}99 
)99 
.:: $
AddEntityFrameworkStores:: )
<::) * 
ApplicationDbContext::* >
>::> ?
(::? @
)::@ A
;::A B
services?? 
.?? 
AddAuthentication?? &
(??& '
options??' .
=>??/ 1
{@@ 
optionsAA 
.AA %
DefaultAuthenticateSchemeAA 5
=AA6 7
JwtBearerDefaultsAA8 I
.AAI J 
AuthenticationSchemeAAJ ^
;AA^ _
optionsBB 
.BB "
DefaultChallengeSchemeBB 2
=BB3 4
JwtBearerDefaultsBB5 F
.BBF G 
AuthenticationSchemeBBG [
;BB[ \
optionsCC 
.CC 
DefaultSchemeCC )
=CC* +
JwtBearerDefaultsCC, =
.CC= > 
AuthenticationSchemeCC> R
;CCR S
}DD 
)DD 
.EE 
AddJwtBearerEE 
(EE 
optionsEE %
=>EE& (
{FF 
optionsGG 
.GG  
RequireHttpsMetadataGG 0
=GG1 2
falseGG3 8
;GG8 9
optionsHH 
.HH 
	SaveTokenHH %
=HH& '
falseHH( -
;HH- .
optionsII 
.II %
TokenValidationParametersII 5
=II6 7
newII8 ;%
TokenValidationParametersII< U
{JJ $
ValidateIssuerSigningKeyKK 0
=KK1 2
trueKK3 7
,KK7 8
IssuerSigningKeyLL (
=LL) *!
AuthenticationUtilityLL+ @
.LL@ A#
GetSymmetricSecurityKeyLLA X
(LLX Y
)LLY Z
,LLZ [
ValidateIssuerMM &
=MM' (
falseMM) .
,MM. /
ValidateAudienceNN (
=NN) *
falseNN+ 0
,NN0 1
	ClockSkewOO !
=OO" #
TimeSpanOO$ ,
.OO, -
ZeroOO- 1
}PP 
;PP 
}QQ 
)QQ 
;QQ 
servicesSS 
.SS #
AddControllersWithViewsSS ,
(SS, -
)SS- .
;SS. /
servicesVV 
.VV 

AddSignalRVV 
(VV  
)VV  !
;VV! "
servicesWW 
.WW 
AddSpaStaticFilesWW &
(WW& '
configurationWW' 4
=>WW5 7
{WW8 9
configurationWW: G
.WWG H
RootPathWWH P
=WWQ R
$strWWS c
;WWc d
}WWe f
)WWf g
;WWg h
servicesYY 
.ZZ "
AddHttpContextAccessorZZ '
(ZZ' (
)ZZ( )
.[[ 
	AddScoped[[ 
([[ 
typeof[[ !
([[! "
IRepository[[" -
<[[- .
>[[. /
)[[/ 0
,[[0 1
typeof[[2 8
([[8 9
BaseRepository[[9 G
<[[G H
>[[H I
)[[I J
)[[J K
.\\ 
	AddScoped\\ 
<\\ *
IGameSessionSettingsRepository\\ 9
,\\9 :)
GameSessionSettingsRepository\\; X
>\\X Y
(\\Y Z
)\\Z [
.]] 
	AddScoped]] 
<]]  
IBattleshipsDatabase]] /
,]]/ 0
BattleshipsDatabase]]1 D
>]]D E
(]]E F
)]]F G
.^^ 
	AddScoped^^ 
<^^ 
IShipsRepository^^ +
,^^+ ,
ShipsRepository^^- <
>^^< =
(^^= >
)^^> ?
.__ 
	AddScoped__ 
<__ "
IAuthenticationService__ 1
,__1 2!
AuthenticationService__3 H
>__H I
(__I J
)__J K
.`` 
	AddScoped`` 
<`` 
ICurrentUserService`` .
,``. /
CurrentUserService``0 B
>``B C
(``C D
)``D E
.aa 
	AddScopedaa 
<aa 
IGameSessionServiceaa .
,aa. /
GameSessionServiceaa0 B
>aaB C
(aaC D
)aaD E
.bb 
	AddScopedbb 
<bb .
"IBattleshipsSynchronizationServicebb =
,bb= >-
!BattleshipsSynchronizationServicebb? `
>bb` a
(bba b
)bbb c
.cc 
	AddScopedcc 
<cc #
IGameSessionsRepositorycc 2
,cc2 3"
GameSessionsRepositorycc4 J
>ccJ K
(ccK L
)ccL M
.dd 
	AddScopeddd 
<dd 
IPlayersRepositorydd -
,dd- .
PlayersRepositorydd/ @
>dd@ A
(ddA B
)ddB C
.ee 
	AddScopedee 
<ee 
IPlayersServiceee *
,ee* +
PlayersServiceee, :
>ee: ;
(ee; <
)ee< =
.ff 
	AddScopedff 
<ff  
IShipTilesRepositoryff /
,ff/ 0
ShipTilesRepositoryff1 D
>ffD E
(ffE F
)ffF G
.gg 
	AddScopedgg 
<gg #
IAttackExecutionServicegg 2
,gg2 3"
AttackExecutionServicegg4 J
>ggJ K
(ggK L
)ggL M
.hh 
	AddScopedhh 
<hh 
IEndgameServicehh *
,hh* +
EndgameServicehh, :
>hh: ;
(hh; <
)hh< =
.ii 
	AddScopedii 
<ii #
IEndgameStrategyServiceii 2
,ii2 3"
EndgameStrategyServiceii4 J
>iiJ K
(iiK L
)iiL M
.jj 
	AddScopedjj 
<jj 
IEndgameStrategyjj +
,jj+ ,"
ClassicEndgameStrategyjj- C
>jjC D
(jjD E
)jjE F
.kk 
	AddScopedkk 
<kk 
IEndgameStrategykk +
,kk+ ,%
DeathMatchEndgameStrategykk- F
>kkF G
(kkG H
)kkH I
.ll 
	AddScopedll 
<ll 
IEndgameStrategyll +
,ll+ ,-
!DestroyedShipCountEndgameStrategyll- N
>llN O
(llO P
)llP Q
.mm 
	AddScopedmm 
<mm 
IEndgameStrategymm +
,mm+ ,*
RoundCountLimitEndgameStrategymm- K
>mmK L
(mmL M
)mmM N
.nn 
	AddScopednn 
<nn 
IAchievementServicenn .
,nn. /
AchievementServicenn0 B
>nnB C
(nnC D
)nnD E
.oo 
	AddScopedoo 
<oo 
IGameLaunchServiceoo -
,oo- .
GameLaunchServiceoo/ @
>oo@ A
(ooA B
)ooB C
.pp 
	AddScopedpp 
<pp (
IPlayerShipGenerationServicepp 7
,pp7 8'
PlayerShipGenerationServicepp9 T
>ppT U
(ppU V
)ppV W
.qq 
AddSingletonqq 
<qq "
NumberGeneratorFactoryqq 4
>qq4 5
(qq5 6
)qq6 7
;rr 
}ss 	
publicvv 
voidvv 
	Configurevv 
(vv 
IApplicationBuildervv 1
appvv2 5
,vv5 6
IWebHostEnvironmentvv7 J
envvvK N
)vvN O
{ww 	
ifxx 
(xx 
envxx 
.xx 
IsDevelopmentxx !
(xx! "
)xx" #
)xx# $
{yy 
appzz 
.zz %
UseDeveloperExceptionPagezz -
(zz- .
)zz. /
;zz/ 0
app{{ 
.{{ !
UseMigrationsEndPoint{{ )
({{) *
){{* +
;{{+ ,
}|| 
else}} 
{~~ 
app
ÅÅ 
.
ÅÅ 
UseHsts
ÅÅ 
(
ÅÅ 
)
ÅÅ 
;
ÅÅ 
}
ÇÇ 
app
ÑÑ 
.
ÑÑ !
UseHttpsRedirection
ÑÑ #
(
ÑÑ# $
)
ÑÑ$ %
;
ÑÑ% &
app
ÖÖ 
.
ÖÖ 
UseStaticFiles
ÖÖ 
(
ÖÖ 
)
ÖÖ  
;
ÖÖ  !
if
ÜÜ 
(
ÜÜ 
!
ÜÜ 
env
ÜÜ 
.
ÜÜ 
IsDevelopment
ÜÜ "
(
ÜÜ" #
)
ÜÜ# $
)
ÜÜ$ %
{
áá 
app
àà 
.
àà 
UseSpaStaticFiles
àà %
(
àà% &
)
àà& '
;
àà' (
}
ââ 
app
ãã 
.
ãã 

UseRouting
ãã 
(
ãã 
)
ãã 
;
ãã 
app
çç 
.
çç 
UseAuthentication
çç !
(
çç! "
)
çç" #
;
çç# $
app
èè 
.
èè 
UseAuthorization
èè  
(
èè  !
)
èè! "
;
èè" #
app
êê 
.
êê 
UseEndpoints
êê 
(
êê 
	endpoints
êê &
=>
êê' )
{
ëë 
	endpoints
íí 
.
íí  
MapControllerRoute
íí ,
(
íí, -
name
ìì 
:
ìì 
$str
ìì #
,
ìì# $
pattern
îî 
:
îî 
$str
îî @
)
îî@ A
;
îîA B
	endpoints
ïï 
.
ïï 
MapRazorPages
ïï '
(
ïï' (
)
ïï( )
;
ïï) *
	endpoints
ññ 
.
ññ 
MapHub
ññ  
<
ññ  !
BattleshipsHub
ññ! /
>
ññ/ 0
(
ññ0 1
$str
ññ1 B
,
ññB C
options
ññD K
=>
ññL N
{
óó 
options
òò 
.
òò 

Transports
òò &
=
òò' (
HttpTransportType
òò) :
.
òò: ;

WebSockets
òò; E
;
òòE F
}
ôô 
)
ôô 
;
ôô 
}
öö 
)
öö 
;
öö 
app
úú 
.
úú 
UseSpa
úú 
(
úú 
spa
úú 
=>
úú 
{
ùù 
spa
°° 
.
°° 
Options
°° 
.
°° 

SourcePath
°° &
=
°°' (
$str
°°) 4
;
°°4 5
if
££ 
(
££ 
env
££ 
.
££ 
IsDevelopment
££ %
(
££% &
)
££& '
)
££' (
{
§§ 
spa
•• 
.
•• !
UseAngularCliServer
•• +
(
••+ ,
	npmScript
••, 5
:
••5 6
$str
••7 >
)
••> ?
;
••? @
}
¶¶ 
}
ßß 
)
ßß 
;
ßß 

ShipSeeder
©© 
.
©© 
	SeedShips
©©  
(
©©  !
app
©©! $
.
©©$ %!
ApplicationServices
©©% 8
)
©©8 9
;
©©9 :
SeedAchievements
™™ 
.
™™ 
SeedAchs
™™ %
(
™™% &
app
™™& )
.
™™) *!
ApplicationServices
™™* =
)
™™= >
;
™™> ?
}
´´ 	
}
¨¨ 
}≠≠ ‘	
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