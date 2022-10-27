π
=D:\dev\Battleships\Battleships\Builders\GameSessionBuilder.cs
	namespace 	
Battleships
 
. 
Builders 
; 
public 
class 
GameSessionBuilder 
:  !
IGameSessionBuilder" 5
{ 
private		 
GameSession		 
session		 
=		  !
new		" %
GameSession		& 1
(		1 2
)		2 3
;		3 4
public 

GameSessionBuilder 
WithIcon &
(& '
string' -
icon. 2
)2 3
{ 
session 
. 
Icon 
= 
icon 
; 
return 
this 
; 
} 
public 

GameSessionBuilder 
WithName &
(& '
string' -
name. 2
)2 3
{ 
session 
. 
Name 
= 
name 
; 
return 
this 
; 
} 
public 

GameSessionBuilder 
WithDateCreated -
(- .
DateTime. 6
dateCreated7 B
)B C
{ 
session 
. 
DateCreated 
= 
dateCreated )
;) *
return 
this 
; 
} 
public 

GameSessionBuilder 
WithGameLength ,
(, -
TimeSpan- 5

gameLength6 @
)@ A
{ 
session 
. 

GameLength 
= 

gameLength '
;' (
return   
this   
;   
}!! 
public## 

GameSessionBuilder## 
WithWinnerId## *
(##* +
Guid##+ /
id##0 2
)##2 3
{$$ 
session%% 
.%% 
WinnerId%% 
=%% 
id%% 
;%% 
return&& 
this&& 
;&& 
}'' 
public)) 

GameSessionBuilder)) 
WithPlayers)) )
())) *
List))* .
<)). /
Player))/ 5
>))5 6
players))7 >
)))> ?
{** 
session++ 
.++ 
Players++ 
=++ 
players++ !
;++! "
return,, 
this,, 
;,, 
}-- 
public// 

GameSessionBuilder// 
WithSessionSettings// 1
(//1 2
GameSessionSettings//2 E
settings//F N
)//N O
{00 
session11 
.11 
Settings11 
=11 
settings11 #
;11# $
return22 
this22 
;22 
}33 
public55 

GameSession55 
Build55 
(55 
)55 
{66 
return77 
this77 
.77 
session77 
;77 
}88 
}99 á

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
} é
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
GameSessionBuilder 
WithWinnerId #
(# $
Guid$ (
id) +
)+ ,
;, -
GameSessionBuilder 
WithPlayers "
(" #
List# '
<' (
Player( .
>. /
players0 7
)7 8
;8 9
GameSessionBuilder 
WithSessionSettings *
(* +
GameSessionSettings+ >
settings? G
)G H
;H I
GameSession 
Build 
( 
) 
; 
} õ
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
}## ¬
CD:\dev\Battleships\Battleships\Controllers\GameSessionController.cs
	namespace 	
Battleships
 
. 
Controllers !
{ 
[		 
ApiController		 
]		 
[

 
Route

 

(


 
$str

 
)

 
]

 
public 

class !
GameSessionController &
:& '
ControllerBase( 6
{ 
private 
readonly 
IGameSessionService ,
_gameSessionService- @
;@ A
public !
GameSessionController $
($ %
IGameSessionService% 8
gameSessionService9 K
)K L
{ 	
_gameSessionService 
=  !
gameSessionService" 4
;4 5
} 	
[ 	
HttpPost	 
( 
$str !
)! "
]" #
public 
async 
Task 
< 
IActionResult '
>' (
CreateSessions) 7
(7 8
[8 9
FromBody9 A
]A B!
GameSessionRequestDtoC X
gameSessionDtoY g
)g h
{ 	
Console 
. 
	WriteLine 
( 
$str 3
)3 4
;4 5
Console 
. 
	WriteLine 
( 
gameSessionDto ,
., -
Name- 1
)1 2
;2 3
Console 
. 
	WriteLine 
( 
gameSessionDto ,
., -
SettingsDto- 8
.8 9
GridSize9 A
)A B
;B C
return 
Ok 
( 
await 
_gameSessionService /
./ 0
CreateSession0 =
(= >
gameSessionDto> L
)L M
)M N
;N O
} 	
[ 	
HttpGet	 
( 
$str 
)  
]  !
public   
async   
Task   
<   
IActionResult   '
>  ' (
ListSessions  ) 5
(  5 6
)  6 7
{!! 	
Console"" 
."" 
	WriteLine"" 
("" 
$str"" )
)"") *
;""* +
var## 
gameSessions## 
=## 
await## $
_gameSessionService##% 8
.##8 9
ListAllSessions##9 H
(##H I
)##I J
;##J K
return%% 
Ok%% 
(%% 
gameSessions%% "
)%%" #
;%%# $
}&& 	
}'' 
}(( î
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
$str 
) 
]  
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
var 
players 
= 
await 
_playersService  /
./ 0
ListPlayers0 ;
(; <
)< =
;= >
return 
Ok 
( 
players 
) 
; 
} 	
} 
} ∞
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
. 
Seed 
( 
) 
;  
modelBuilder 
. 
Entity 
<  
Ship  $
>$ %
(% &
)& '
. 
HasDiscriminator !
(! "
ship" &
=>' )
ship* .
.. /!
ShipTypeDiscriminator/ D
)D E
. 
HasValue 
< 
BattleshipShip (
>( )
() *
nameof* 0
(0 1
BattleshipShip1 ?
)? @
)@ A
. 
HasValue 
< 
CarrierShip %
>% &
(& '
nameof' -
(- .
CarrierShip. 9
)9 :
): ;
. 
HasValue 
< 
CruiserShip %
>% &
(& '
nameof' -
(- .
CruiserShip. 9
)9 :
): ;
. 
HasValue 
< 
DestroyerShip '
>' (
(( )
nameof) /
(/ 0
DestroyerShip0 =
)= >
)> ?
. 
HasValue 
< 
SubmarineShip '
>' (
(( )
nameof) /
(/ 0
SubmarineShip0 =
)= >
)> ?
; 
base 
. 
OnModelCreating  
(  !
modelBuilder! -
)- .
;. /
} 	
} 
} ¥
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
} ¬
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
;		3 4
}

 
} ÿ

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
public 
	GameTypes 
GameType !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string 
HostName 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
Guid 
HostId 
{ 
get  
;  !
set" %
;% &
}' (
} 
} í
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
}		 
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
public 
string 
GridSize 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
	GameTypes 
GameType !
{" #
get$ '
;' (
set) ,
;, -
}. /
}		 
}

 Ú
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
}- .
} 
} ‚
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
} Õ4
/D:\dev\Battleships\Battleships\Data\SeedData.cs
	namespace 	
Battleships
 
. 
Data 
{ 
public 

static 
class 
SeedData  
{ 
public		 
static		 
void		 
Seed		 
(		  
this		  $
ModelBuilder		% 1
modelBuilder		2 >
)		> ?
{

 	
modelBuilder 
. 
Entity 
<  
Achievement  +
>+ ,
(, -
)- .
.. /
HasData/ 6
(6 7
new7 :
Achievement; F
{ 
Id 
= 
Guid 
. 
Parse 
(  
$str  F
)F G
,G H
Name 
= 
$str $
,$ %
Description 
= 
$str >
,> ?
RequiredAction 
=  
$str! /
,/ 0 
ActionPerformedCount $
=% &
$num' (
,( )(
RequiredActionPerformedCount ,
=- .
$num/ 0
} 
, 
new 
Achievement 
{ 
Id 
= 
Guid 
. 
Parse 
(  
$str  F
)F G
,G H
Name 
= 
$str "
," #
Description 
= 
$str 4
,4 5
RequiredAction 
=  
$str! ,
,, - 
ActionPerformedCount $
=% &
$num' (
,( )(
RequiredActionPerformedCount ,
=- .
$num/ 0
} 
, 
new 
Achievement 
{ 
Id 
= 
Guid 
. 
Parse 
(  
$str  F
)F G
,G H
Name   
=   
$str    
,    !
Description!! 
=!! 
$str!! M
,!!M N
RequiredAction"" 
=""  
$str""! @
,""@ A 
ActionPerformedCount## $
=##% &
$num##' (
,##( )(
RequiredActionPerformedCount$$ ,
=$$- .
$num$$/ 0
}%% 
,%% 
new&& 
Achievement&& 
{'' 
Id(( 
=(( 
Guid(( 
.(( 
Parse(( 
(((  
$str((  F
)((F G
,((G H
Name)) 
=)) 
$str)) 
,)) 
Description** 
=** 
$str** B
,**B C
RequiredAction++ 
=++  
$str++! 6
,++6 7 
ActionPerformedCount,, $
=,,% &
$num,,' (
,,,( )(
RequiredActionPerformedCount-- ,
=--- .
$num--/ 0
}.. 
,.. 
new// 
Achievement// 
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
$str22 "
,22" #
Description33 
=33 
$str33 F
,33F G
RequiredAction44 
=44  
$str44! .
,44. / 
ActionPerformedCount55 $
=55% &
$num55' (
,55( )(
RequiredActionPerformedCount66 ,
=66- .
$num66/ 0
}77 
,77 
new88 
Achievement88 
{99 
Id:: 
=:: 
Guid:: 
.:: 
Parse:: 
(::  
$str::  F
)::F G
,::G H
Name;; 
=;; 
$str;; 
,;; 
Description<< 
=<< 
$str<< G
,<<G H
RequiredAction== 
===  
$str==! /
,==/ 0 
ActionPerformedCount>> $
=>>% &
$num>>' (
,>>( )(
RequiredActionPerformedCount?? ,
=??- .
$num??/ 0
}@@ 
,@@ 
newAA 
AchievementAA 
{BB 
IdCC 
=CC 
GuidCC 
.CC 
ParseCC 
(CC  
$strCC  F
)CCF G
,CCG H
NameDD 
=DD 
$strDD !
,DD! "
DescriptionEE 
=EE 
$strEE <
,EE< =
RequiredActionFF 
=FF  
$strFF! -
,FF- . 
ActionPerformedCountGG $
=GG% &
$numGG' (
,GG( )(
RequiredActionPerformedCountHH ,
=HH- .
$numHH/ 0
}II 
,II 
newJJ 
AchievementJJ 
{KK 
IdLL 
=LL 
GuidLL 
.LL 
ParseLL 
(LL  
$strLL  F
)LLF G
,LLG H
NameMM 
=MM 
$strMM  
,MM  !
DescriptionNN 
=NN 
$strNN 6
,NN6 7
RequiredActionOO 
=OO  
$strOO! .
,OO. / 
ActionPerformedCountPP $
=PP% &
$numPP' (
,PP( )(
RequiredActionPerformedCountQQ ,
=QQ- .
$numQQ/ 0
}RR 
,RR 
newSS 
AchievementSS 
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
$strVV  
,VV  !
DescriptionWW 
=WW 
$strWW :
,WW: ;
RequiredActionXX 
=XX  
$strXX! /
,XX/ 0 
ActionPerformedCountYY $
=YY% &
$numYY' (
,YY( )(
RequiredActionPerformedCountZZ ,
=ZZ- .
$numZZ/ 0
}[[ 
,[[ 
new\\ 
Achievement\\ 
{]] 
Id^^ 
=^^ 
Guid^^ 
.^^ 
Parse^^ 
(^^  
$str^^  F
)^^F G
,^^G H
Name__ 
=__ 
$str__ $
,__$ %
Description`` 
=`` 
$str`` .
,``. /
RequiredActionaa 
=aa  
$straa! 1
,aa1 2 
ActionPerformedCountbb $
=bb% &
$numbb' (
,bb( )(
RequiredActionPerformedCountcc ,
=cc- .
$numcc/ 1
}dd 
)dd 
;dd 
}ee 	
}ff 
}gg ∆
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
var !
defensiveShipsFactory %
=& '
factoryProducer( 7
.7 8
ProduceFactory8 F
(F G
trueG K
)K L
;L M
var !
offensiveShipsFactory %
=& '
factoryProducer( 7
.7 8
ProduceFactory8 F
(F G
falseG L
)L M
;M N
var 
ships 
= 
new 
List  
<  !
Ship! %
>% &
(& '
)' (
{ !
defensiveShipsFactory %
.% &
GenerateShip& 2
(2 3
	ShipTypes3 <
.< =
Carrier= D
)D E
,E F!
defensiveShipsFactory %
.% &
GenerateShip& 2
(2 3
	ShipTypes3 <
.< =
Cruiser= D
)D E
,E F!
offensiveShipsFactory %
.% &
GenerateShip& 2
(2 3
	ShipTypes3 <
.< =

Battleship= G
)G H
,H I!
offensiveShipsFactory %
.% &
GenerateShip& 2
(2 3
	ShipTypes3 <
.< =
	Destroyer= F
)F G
,G H!
offensiveShipsFactory %
.% &
GenerateShip& 2
(2 3
	ShipTypes3 <
.< =
	Submarine= F
)F G
,G H
}   
;   
battleshipsDatabase"" 
.""  
ShipsRepository""  /
.""/ 0

CreateMany""0 :
("": ;
ships""; @
)""@ A
.""A B
Wait""B F
(""F G
)""G H
;""H I
}## 	
}$$ 
}%% ÿ
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
}		 Ë
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
(& '
)' (
;( )
} 
if 
( 
shipType 
== 
	ShipTypes %
.% &
Cruiser& -
)- .
{ 
return 
new 
CruiserShip &
(& '
)' (
;( )
} 
return 
null 
; 
} 	
} 
} é
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
() *
)* +
;+ ,
} 
if 
( 
shipType 
== 
	ShipTypes %
.% &
	Submarine& /
)/ 0
{ 
return 
new 
SubmarineShip (
(( )
)) *
;* +
} 
if 
( 
shipType 
== 
	ShipTypes %
.% &
	Destroyer& /
)/ 0
{ 
return 
new 
DestroyerShip (
(( )
)) *
;* +
} 
return 
null 
; 
} 	
} 
} ö
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
bool2 6
isDefensive7 B
)B C
{ 	
if		 
(		 
isDefensive		 
)		 
{

 
return 
new  
DefensiveShipFactory /
(/ 0
)0 1
;1 2
} 
return 
new  
OffensiveShipFactory +
(+ ,
), -
;- .
} 	
} 
} ¢

4D:\dev\Battleships\Battleships\Models\Achievement.cs
	namespace 	
Battleships
 
. 
Models 
{ 
public 

class 
Achievement 
: 
	BaseModel (
{ 
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
Description !
{" #
get$ '
;' (
set) ,
;, -
}. /
public		 
string		 
RequiredAction		 $
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
ActionPerformedCount

 '
{

( )
get

* -
;

- .
set

/ 2
;

2 3
}

4 5
public 
int (
RequiredActionPerformedCount /
{0 1
get2 5
;5 6
set7 :
;: ;
}< =
public 
List 
< 
ApplicationUser #
># $
Users% *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
} 
} ﬁ	
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
}B C
} 
} æ
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
} ©
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
{ 
Classic 
, 

Deathmatch 
, 
Custom 
, 
LimitedTime 
}		 
}

 
4D:\dev\Battleships\Battleships\Models\GameSession.cs
	namespace 	
Battleships
 
. 
Models 
{ 
public 

class 
GameSession 
: 
	BaseModel (
{		 
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
public 
DateTime 
DateCreated #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
TimeSpan 

GameLength "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
Guid 
WinnerId 
{ 
get "
;" #
set$ '
;' (
}) *
public 
List 
< 
Player 
> 
Players #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
GameSessionSettings "
Settings# +
{, -
get. 1
;1 2
set3 6
;6 7
}8 9
public 
GameSessionDto 
toDto #
(# $
)$ %
{ 	
var 
dto 
= 
new 
GameSessionDto (
(( )
)) *
;* +
dto 
. 
Id 
= 
this 
. 
Id 
; 
dto 
. 
HostId 
= 
this 
. 
Players %
[% &
$num& '
]' (
.( )
Id) +
;+ ,
dto 
. 
HostName 
= 
this 
.  
Players  '
[' (
$num( )
]) *
.* +
User+ /
./ 0
Name0 4
;4 5
dto 
. 
Icon 
= 
this 
. 
Icon  
;  !
dto 
. 
Name 
= 
this 
. 
Name  
;  !
dto 
. 
GridSize 
= 
this 
.  
Settings  (
.( )
GridSize) 1
;1 2
dto 
. 
GameType 
= 
this 
.  
Settings  (
.( )
GameType) 1
;1 2
return 
dto 
; 
} 	
public   
GameSession   
(   
)   
{!! 	
}## 	
public%% 
override%% 
string%% 
ToString%% '
(%%' (
)%%( )
{&& 	
return'' 
this'' 
.'' 
Id'' 
.'' 
ToString'' #
(''# $
)''$ %
+''& '
$str''( +
+'', -
this''. 2
.''2 3
Name''3 7
+''8 9
$str'': =
+''> ?
this''? C
.''C D
Icon''D H
;''H I
}(( 	
})) 
}** ˆ	
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
 
	GameTypes

 
GameType

 !
{

" #
get

$ '
;

' (
set

) ,
;

, -
}

. /
public 
int 

RoundCount 
{ 
get  #
;# $
set% (
;( )
}* +
public 
int #
DestroyedShipPercentage *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
public 
GameSession 
GameSession &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
} 
} ∆
/D:\dev\Battleships\Battleships\Models\Player.cs
	namespace 	
Battleships
 
. 
Models 
{ 
public 

class 
Player 
: 
	BaseModel #
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
public		 
GameSession		 
GameSession		 &
{		' (
get		) ,
;		, -
set		. 1
;		1 2
}		3 4
public

 
bool

 
IsHost

 
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
public 
string 
UserId 
{ 
get "
;" #
set$ '
;' (
}) *
public 
ApplicationUser 
User #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
List 
< 

PlayerShip 
> 
PlayerShips  +
{, -
get. 1
;1 2
set3 6
;6 7
}8 9
public 
Player 
( 
) 
{ 	
} 	
public 
Player 
( 
GameSession !
gameSession" -
,- .
bool/ 3
isHost4 :
,: ;
string< B
userIdC I
)I J
{ 	
GameSession 
= 
gameSession %
;% &
IsHost 
= 
isHost 
; 
UserId 
= 
userId 
; 
} 	
} 
} –
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
} Œ
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
{ 
} 
} »
:D:\dev\Battleships\Battleships\Models\Ships\CarrierShip.cs
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
CarrierShip 
: 
Ship #
{ 
} 
} »
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
{ 
} 
} Ã
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
{ 
} 
} …	
3D:\dev\Battleships\Battleships\Models\Ships\Ship.cs
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
class 
Ship 
: 
	BaseModel !
{ 
public 
string !
ShipTypeDiscriminator +
{, -
get. 1
;1 2
set3 6
;6 7
}8 9
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
 
string

 
Description

 !
{

" #
get

$ '
;

' (
set

) ,
;

, -
}

. /
public 
List 
< 
UserCosmetic  
>  !
UserCosmetics" /
{0 1
get2 5
;5 6
set7 :
;: ;
}< =
public 
List 
< 

PlayerShip 
> 
PlayerShips  +
{, -
get. 1
;1 2
set3 6
;6 7
}8 9
} 
} Ã
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
{ 
} 
} ¥
1D:\dev\Battleships\Battleships\Models\ShipTile.cs
	namespace 	
Battleships
 
. 
Models 
{ 
public 

class 
ShipTile 
: 
	BaseModel %
{ 
public 
int 
XCoordinate 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
int 
YCoordinate 
{  
get! $
;$ %
set& )
;) *
}+ ,
public		 
bool		 
IsDestroyed		 
{		  !
get		" %
;		% &
set		' *
;		* +
}		, -
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
}1 2
} 
} ´
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
} î5
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
;6 7
private 
DbSet 
< 
TModel 
> 
ItemSet %
=>& (
_context) 1
.1 2
Set2 5
<5 6
TModel6 <
>< =
(= >
)> ?
;? @
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
public 
async 
Task 
< 
TModel  
>  !
GetById" )
() *
Guid* .
id/ 1
)1 2
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
public!! 
async!! 
Task!! 
<!! 
List!! 
<!! 
TModel!! %
>!!% &
>!!& '
GetAll!!( .
(!!. /
)!!/ 0
{"" 	
return## 
await## 
ItemSet##  
.##  !
ToListAsync##! ,
(##, -
)##- .
;##. /
}$$ 	
public&& 
async&& 
Task&& 
<&& 
Guid&& 
>&& 
Create&&  &
(&&& '
TModel&&' -
model&&. 3
)&&3 4
{'' 	
await(( 
ItemSet(( 
.(( 
AddAsync(( "
(((" #
model((# (
)((( )
;(() *
await)) 
SaveChanges)) 
()) 
))) 
;))  
return++ 
model++ 
.++ 
Id++ 
;++ 
},, 	
public.. 
async.. 
Task.. 
Update..  
(..  !
TModel..! '
model..( -
)..- .
{// 	
ItemSet00 
.00 
Update00 
(00 
model00  
)00  !
;00! "
await11 
SaveChanges11 
(11 
)11 
;11  
}22 	
public44 
async44 
Task44 
Delete44  
(44  !
TModel44! '
model44( -
)44- .
{55 	
ItemSet66 
.66 
Remove66 
(66 
model66  
)66  !
;66! "
await77 
SaveChanges77 
(77 
)77 
;77  
}88 	
public:: 
async:: 
Task:: 
<:: 
List:: 
<:: 
Guid:: #
>::# $
>::$ %

CreateMany::& 0
(::0 1
List::1 5
<::5 6
TModel::6 <
>::< =
models::> D
)::D E
{;; 	
await<< 
ItemSet<< 
.<< 
AddRangeAsync<< '
(<<' (
models<<( .
)<<. /
;<</ 0
await== 
SaveChanges== 
(== 
)== 
;==  
return?? 
models?? 
.?? 
Select??  
(??  !
m??! "
=>??# %
m??& '
.??' (
Id??( *
)??* +
.??+ ,
ToList??, 2
(??2 3
)??3 4
;??4 5
}@@ 	
publicBB 
asyncBB 
TaskBB 

UpdateManyBB $
(BB$ %
ListBB% )
<BB) *
TModelBB* 0
>BB0 1
modelsBB2 8
)BB8 9
{CC 	
ItemSetDD 
.DD 
UpdateRangeDD 
(DD  
modelsDD  &
)DD& '
;DD' (
awaitEE 
SaveChangesEE 
(EE 
)EE 
;EE  
}FF 	
publicHH 
asyncHH 
TaskHH 

DeleteManyHH $
(HH$ %
ListHH% )
<HH) *
TModelHH* 0
>HH0 1
modelsHH2 8
)HH8 9
{II 	
ItemSetJJ 
.JJ 
RemoveRangeJJ 
(JJ  
modelsJJ  &
)JJ& '
;JJ' (
awaitKK 
SaveChangesKK 
(KK 
)KK 
;KK  
}LL 	
publicNN 
boolNN 
IsEmptyNN 
(NN 
)NN 
{OO 	
varPP 
anyExistPP 
=PP 
ItemSetPP "
.PP" #
AnyPP# &
(PP& '
)PP' (
;PP( )
returnQQ 
!QQ 
anyExistQQ 
;QQ 
}RR 	
publicTT 

IQueryableTT 
<TT 
TModelTT  
>TT  !
GetQueryableTT" .
(TT. /
)TT/ 0
{UU 	
returnVV 
ItemSetVV 
.VV 
AsQueryableVV &
(VV& '
)VV' (
;VV( )
}WW 	
privateYY 
asyncYY 
TaskYY 
SaveChangesYY &
(YY& '
)YY' (
{ZZ 	
await[[ 
_context[[ 
.[[ 
SaveChangesAsync[[ +
([[+ ,
)[[, -
;[[- .
}\\ 	
internal^^ 
Task^^ 
GetWhere^^ 
(^^ 
)^^  
{__ 	
throw`` 
new`` #
NotImplementedException`` -
(``- .
)``. /
;``/ 0
}aa 	
}bb 
}cc ¯
BD:\dev\Battleships\Battleships\Repositories\BattleshipsDatabase.cs
	namespace 	
Battleships
 
. 
Repositories "
{ 
public 

class 
BattleshipsDatabase $
:% & 
IBattleshipsDatabase' ;
{ 
public 
BattleshipsDatabase "
(" #
IRepository		 
<		 
Achievement		 #
>		# $"
achievementsRepository		% ;
,		; <
IRepository

 
<

 
GameSession

 #
>

# $"
gameSessionsRepository

% ;
,

; <
IRepository 
< 
GameSessionSettings +
>+ ,)
gameSessionSettingsRepository- J
,J K
IRepository 
< 
Player 
> 
playersRepository  1
,1 2
IRepository 
< 

PlayerShip "
>" #!
playerShipsRepository$ 9
,9 :
IRepository 
< 
Ship 
> 
shipsRepository -
,- .
IRepository 
< 
UserCosmetic $
>$ %#
userCosmeticsRepository& =
,= >
IRepository 
< 
ShipTile  
>  !
shipTilesRepository" 5
)5 6
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
} 	
public 
IRepository 
< 
Achievement &
>& '"
AchievementsRepository( >
{? @
getA D
;D E
}F G
public 
IRepository 
< 
GameSession &
>& '"
GameSessionsRepository( >
{? @
getA D
;D E
}F G
public 
IRepository 
< 
GameSessionSettings .
>. /)
GameSessionSettingsRepository0 M
{N O
getP S
;S T
}U V
public 
IRepository 
< 
Player !
>! "
PlayersRepository# 4
{5 6
get7 :
;: ;
}< =
public   
IRepository   
<   

PlayerShip   %
>  % &!
PlayerShipsRepository  ' <
{  = >
get  ? B
;  B C
}  D E
public!! 
IRepository!! 
<!! 
ShipTile!! #
>!!# $
ShipTilesRepository!!% 8
{!!9 :
get!!; >
;!!> ?
}!!@ A
public"" 
IRepository"" 
<"" 
Ship"" 
>""  
ShipsRepository""! 0
{""1 2
get""3 6
;""6 7
}""8 9
public## 
IRepository## 
<## 
UserCosmetic## '
>##' (#
UserCosmeticsRepository##) @
{##A B
get##C F
;##F G
}##H I
}$$ 
}%% ¸
DD:\dev\Battleships\Battleships\Repositories\GameSessionRepository.cs
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
 !
GameSessionRepository

 &
:

& '
BaseRepository

( 6
<

6 7
GameSession

7 B
>

B C
,

C D"
IGameSessionRepository

E [
{ 
private 
readonly  
ApplicationDbContext -
_context. 6
;6 7
private 
DbSet 
< 
GameSession !
>! "
ItemSet# *
=>+ -
_context. 6
.6 7
Set7 :
<: ;
GameSession; F
>F G
(G H
)H I
;I J
public 
new 
async 
Task 
< 
List "
<" #
GameSession# .
>. /
>/ 0
GetAll1 7
(7 8
)8 9
{ 	
return 
await 
ItemSet  
.  !
Include! (
(( )
x) *
=>+ -
x. /
./ 0
Players0 7
)7 8
. 
ThenInclude 
( 
x 
=> !
x" #
.# $
User$ (
)( )
. 
Include 
( 
x 
=> 
x 
.  
Settings  (
)( )
. 
ToListAsync 
( 
) 
; 
} 	
public !
GameSessionRepository $
($ % 
ApplicationDbContext% 9
context: A
)A B
:C D
baseE I
(I J
contextJ Q
)Q R
{ 	
this 
. 
_context 
= 
context #
;# $
}   	
}!! 
}"" ¬
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
public		 
IRepository		 
<		 
GameSession		 &
>		& '"
GameSessionsRepository		( >
{		? @
get		A D
;		D E
}		F G
public

 
IRepository

 
<

 
GameSessionSettings

 .
>

. /)
GameSessionSettingsRepository

0 M
{

N O
get

P S
;

S T
}

U V
public 
IRepository 
< 
Player !
>! "
PlayersRepository# 4
{5 6
get7 :
;: ;
}< =
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
public 
IRepository 
< 
ShipTile #
># $
ShipTilesRepository% 8
{9 :
get; >
;> ?
}@ A
public 
IRepository 
< 
Ship 
>  
ShipsRepository! 0
{1 2
get3 6
;6 7
}8 9
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
} ﬂ
ED:\dev\Battleships\Battleships\Repositories\IGameSessionRepository.cs
	namespace 	
Battleships
 
. 
Repositories "
{ 
public 

	interface "
IGameSessionRepository +
{ 
Task		 
<		 
List		 
<		 
GameSession		 
>		 
>		 
GetAll		  &
(		& '
)		' (
;		( )
}

 
} ¡
:D:\dev\Battleships\Battleships\Repositories\IRepository.cs
	namespace 	
Battleships
 
. 
Repositories "
{		 
public

 

	interface

 
IRepository

  
<

  !
TModel

! '
>

' (
where

) .
TModel

/ 5
:

6 7
	BaseModel

8 A
{ 
Task 
< 
TModel 
> 
GetById 
( 
Guid !
id" $
)$ %
;% &
Task 
< 
List 
< 
TModel 
> 
> 
GetAll !
(! "
)" #
;# $
Task 
< 
List 
< 
TModel 
> 
> 
GetWhere #
(# $

Expression$ .
<. /
Func/ 3
<3 4
TModel4 :
,: ;
bool< @
>@ A
>A B
filterC I
)I J
;J K
Task 
< 
Guid 
> 
Create 
( 
TModel  
model! &
)& '
;' (
Task 
Update 
( 
TModel 
model  
)  !
;! "
Task 
Delete 
( 
TModel 
model  
)  !
;! "
Task 
< 
List 
< 
Guid 
> 
> 

CreateMany #
(# $
List$ (
<( )
TModel) /
>/ 0
models1 7
)7 8
;8 9
Task 

UpdateMany 
( 
List 
< 
TModel #
># $
models% +
)+ ,
;, -
Task 

DeleteMany 
( 
List 
< 
TModel #
># $
models% +
)+ ,
;, -
bool 
IsEmpty 
( 
) 
; 

IQueryable 
< 
TModel 
> 
GetQueryable '
(' (
)( )
;) *
} 
} Ê
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
;B C
public "
AttackExecutionService %
(% & 
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
Task 
ExecuteAttack '
(' (
AttackPayload( 5
attack6 <
)< =
{ 	
var 
destroyedTile 
= 
(  !
await! & 
_battleshipsDatabase' ;
.; <
ShipTilesRepository< O
.O P
GetWhereP X
(X Y
tileY ]
=>^ `
tile 
. 
XCoordinate  
==! #
attack$ *
.* +
TargetXCoordinate+ <
&&= ?
tile@ D
.D E
YCoordinateE P
==Q S
attackT Z
.Z [
TargetYCoordinate[ l
&&m o
tile 
. 

PlayerShip 
.  
Player  &
.& '
UserId' -
!=. 0
attack1 7
.7 8
AttackingUserId8 G
&&H J
tile 
. 

PlayerShip 
.  
Player  &
.& '
GameSessionId' 4
==5 7
attack8 >
.> ?
GameSessionId? L
) 
) 
. 
SingleOrDefault 
( 
)  
;  !
if 
( 
destroyedTile 
is  
not! $
null% )
)) *
{ 
destroyedTile 
. 
IsDestroyed )
=* +
true, 0
;0 1
await  
_battleshipsDatabase *
.* +
ShipTilesRepository+ >
.> ?
Update? E
(E F
destroyedTileF S
)S T
;T U
}   
}!! 	
}"" 
}## ã6
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
} â"
ID:\dev\Battleships\Battleships\Services\GameSession\GameSessionService.cs
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
class 
GameSessionService #
:$ %
IGameSessionService& 9
{ 
private 
readonly  
IBattleshipsDatabase -
	_database. 7
;7 8
private 
readonly 
ICurrentUserService ,
_currentUserService- @
;@ A
private 
readonly "
IGameSessionRepository /"
_gameSessionRepository0 F
;F G
public 
GameSessionService !
(! " 
IBattleshipsDatabase" 6
database7 ?
,? @
ICurrentUserServiceA T
userServiceU `
,` a"
IGameSessionRepositoryb x"
gameSessionRepository	y é
)
é è
{ 	
	_database 
= 
database  
;  !
_currentUserService 
=  !
userService" -
;- ."
_gameSessionRepository "
=# $!
gameSessionRepository% :
;: ;
} 	
public 
async 
Task 
< 
Guid 
> 
CreateSession  -
(- .!
GameSessionRequestDto. C
dtoD G
)G H
{ 	
var 
userId 
= 
_currentUserService ,
., -
GetCurrentUserId- =
(= >
)> ?
;? @
var 
gameSettings 
= 
new "
GameSessionSettings# 6
{   
GridSize!! 
=!! 
dto!! 
.!! 
SettingsDto!! *
.!!* +
GridSize!!+ 3
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
}** 
}++ 
;++ 
var;; 
gameSession;; 
=;; 
new;; !
GameSessionBuilder;;" 4
(;;4 5
);;5 6
.<< 
WithIcon<< 
(<< 
dto<< 
.<< 
Icon<< "
)<<" #
.== 
WithName== 
(== 
dto== 
.== 
Name== "
)==" #
.>> 
WithDateCreated>>  
(>>  !
DateTime>>! )
.>>) *
Now>>* -
)>>- .
.?? 
WithSessionSettings?? $
(??$ %
gameSettings??% 1
)??1 2
.@@ 
WithPlayers@@ 
(@@ 
players@@ $
)@@$ %
.AA 
BuildAA 
(AA 
)AA 
;AA 
varCC 
idCC 
=CC 
awaitCC 
	_databaseCC $
.CC$ %"
GameSessionsRepositoryCC% ;
.CC; <
CreateCC< B
(CCB C
gameSessionCCC N
)CCN O
;CCO P
returnEE 
idEE 
;EE 
}FF 	
publicHH 
asyncHH 
TaskHH 
<HH 
ListHH 
<HH 
GameSessionDtoHH -
>HH- .
>HH. /
ListAllSessionsHH0 ?
(HH? @
)HH@ A
{II 	
varJJ 
modelsJJ 
=JJ 
awaitJJ "
_gameSessionRepositoryJJ 5
.JJ5 6
GetAllJJ6 <
(JJ< =
)JJ= >
;JJ> ?
returnKK 
modelsKK 
.KK 
SelectKK  
(KK  !
xKK! "
=>KK# %
xKK& '
.KK' (
toDtoKK( -
(KK- .
)KK. /
)KK/ 0
.KK0 1
ToListKK1 7
(KK7 8
)KK8 9
;KK9 :
}LL 	
}MM 
}NN å
UD:\dev\Battleships\Battleships\Services\GameSession\Interfaces\IGameSessionService.cs
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
	interface 
IGameSessionService (
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
 
GameSessionDto

  
>

  !
>

! "
ListAllSessions

# 2
(

2 3
)

3 4
;

4 5
Task 
< 
Guid 
> 
CreateSession  
(  !!
GameSessionRequestDto! 6
gameSessionDto7 E
)E F
;F G
} 
} ®
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
 ™
MD:\dev\Battleships\Battleships\Services\Players\Interfaces\IPlayersService.cs
	namespace 	
Battleships
 
. 
Services 
. 
Players &
.& '

Interfaces' 1
{ 
public 

	interface 
IPlayersService $
{ 
Task		 
<		 
List		 
<		 
	PlayerDto		 
>		 
>		 
ListPlayers		 )
(		) *
)		* +
;		+ ,
}

 
} „
AD:\dev\Battleships\Battleships\Services\Players\PlayersService.cs
	namespace 	
Battleships
 
. 
Services 
. 
Players &
{ 
public 

class 
PlayersService 
:  !
IPlayersService" 1
{ 
private 
readonly  
IBattleshipsDatabase -
_db. 1
;1 2
private 
readonly 
UserManager $
<$ %
ApplicationUser% 4
>4 5
_userManager6 B
;B C
public 
PlayersService 
(  
IBattleshipsDatabase 3
database4 <
,< =
UserManager> I
<I J
ApplicationUserJ Y
>Y Z
userManager[ f
)f g
{ 	
_db 
= 
database 
; 
_userManager 
= 
userManager &
;& '
} 	
public 
async 
Task 
< 
List 
< 
	PlayerDto (
>( )
>) *
ListPlayers+ 6
(6 7
)7 8
{ 	
Random 
random 
= 
new 
Random  &
(& '
)' (
;( )
var 
allUsers 
= 
_userManager '
.' (
Users( -
.- .
ToList. 4
(4 5
)5 6
;6 7
var 
test 
= 
new 
List 
<  
	PlayerDto  )
>) *
(* +
)+ ,
;, -
foreach!! 
(!! 
var!! 
user!! 
in!! !
allUsers!!" *
)!!+ ,
{"" 
var## 
player## 
=## 
new##  
	PlayerDto##! *
(##* +
)##+ ,
{$$ 
Name%% 
=%% 
user%% 
.%%  
UserName%%  (
,%%( )
GamesPlayedCount&& $
=&&% &
random&&' -
.&&- .
Next&&. 2
(&&2 3
$num&&3 5
,&&5 6
$num&&6 8
)&&8 9
,&&9 :
GamesWonCount'' !
=''" #
random''$ *
.''* +
Next''+ /
(''/ 0
$num''0 1
,''1 2
$num''3 5
)''5 6
}(( 
;(( 
test** 
.** 
Add** 
(** 
player** 
)**  
;**  !
}++ 
return-- 
test-- 
;-- 
}.. 	
}// 
}00 ≥
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
Task  
ConnectToGameSession .
(. /
string/ 5
gameSessionIdString6 I
)I J
{ 	
await 
Clients 
. 
Group 
(  
$"  "
$str" /
{/ 0
gameSessionIdString0 C
}C D
"D E
)E F
.F G
	SendAsyncG P
(P Q
$strQ k
)k l
;l m
await 
Groups 
. 
AddToGroupAsync (
(( )
Context) 0
.0 1
ConnectionId1 =
,= >
$"? A
$strA N
{N O
gameSessionIdStringO b
}b c
"c d
)d e
;e f
await 
Clients 
. 
Caller  
.  !
	SendAsync! *
(* +
$"+ -
$str- F
{F G
gameSessionIdStringG Z
}Z [
"[ \
)\ ]
;] ^
await 
base 
. 
OnConnectedAsync '
(' (
)( )
;) *
} 	
public 
async 
Task %
DisconnectFromGameSession 3
(3 4
string4 :
gameSessionIdString; N
)N O
{ 	
await 
Groups 
.  
RemoveFromGroupAsync -
(- .
Context. 5
.5 6
ConnectionId6 B
,B C
$"D F
$strF S
{S T
gameSessionIdStringT g
}g h
"h i
)i j
;j k
} 	
public 
async 
Task 
PublishAttack '
(' (
string( .
gameSessionIdString/ B
,B C
AttackPayloadD Q
attackR X
)X Y
{ 	
await   #
_attackExecutionService   )
.  ) *
ExecuteAttack  * 7
(  7 8
attack  8 >
)  > ?
;  ? @
await!! 
Clients!! 
.!! 
Group!! 
(!!  
$"!!  "
$str!!" /
{!!/ 0
gameSessionIdString!!0 C
}!!C D
"!!D E
)!!E F
.!!F G
	SendAsync!!G P
(!!P Q
$str!!Q `
,!!` a
attack!!c i
)!!i j
;!!j k
}"" 	
}## 
}$$ î
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
SendAttackMessage +
(+ ,
Guid, 0
gameSessionId1 >
,> ?
BattleshipsMessage@ R
<R S
AttackPayloadS `
>` a
messageb i
)i j
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
$strT a
,a b
messagec j
)j k
;k l
} 	
} 
} Ì
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
SendAttackMessage		 
(		 
Guid		 #
gameSessionId		$ 1
,		1 2
BattleshipsMessage		3 E
<		E F
AttackPayload		F S
>		S T
message		U \
)		\ ]
;		] ^
}

 
} µ
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
} ≥P
)D:\dev\Battleships\Battleships\Startup.cs
	namespace 	
Battleships
 
{ 
public 

class 
Startup 
{ 
public 
Startup 
( 
IConfiguration %
configuration& 3
)3 4
{ 	
Configuration 
= 
configuration )
;) *
} 	
public!! 
IConfiguration!! 
Configuration!! +
{!!, -
get!!. 1
;!!1 2
}!!3 4
public$$ 
void$$ 
ConfigureServices$$ %
($$% &
IServiceCollection$$& 8
services$$9 A
)$$A B
{%% 	
services&& 
.&& 
AddDbContext&& !
<&&! " 
ApplicationDbContext&&" 6
>&&6 7
(&&7 8
options&&8 ?
=>&&@ B
options'' 
.'' 
	UseNpgsql'' !
(''! "
Configuration''" /
.''/ 0
GetConnectionString''0 C
(''C D
$str''D W
)''W X
)''X Y
)''Y Z
;''Z [
services)) 
.)) 3
'AddDatabaseDeveloperPageExceptionFilter)) <
())< =
)))= >
;))> ?
services++ 
.++ 
AddDefaultIdentity++ '
<++' (
ApplicationUser++( 7
>++7 8
(++8 9
options++9 @
=>++A C
{,, 
options-- 
.-- 
SignIn-- "
.--" ##
RequireConfirmedAccount--# :
=--; <
true--= A
;--A B
options.. 
... 
Password.. $
...$ %
RequireDigit..% 1
=..2 3
false..4 9
;..9 :
options// 
.// 
Password// $
.//$ %
RequiredLength//% 3
=//4 5
$num//6 7
;//7 8
options00 
.00 
Password00 $
.00$ %
RequireLowercase00% 5
=006 7
false008 =
;00= >
options11 
.11 
Password11 $
.11$ %
RequireUppercase11% 5
=116 7
false118 =
;11= >
options22 
.22 
Password22 $
.22$ %
RequiredUniqueChars22% 8
=229 :
$num22; <
;22< =
options33 
.33 
Password33 $
.33$ %"
RequireNonAlphanumeric33% ;
=33< =
false33> C
;33C D
}44 
)44 
.55 $
AddEntityFrameworkStores55 )
<55) * 
ApplicationDbContext55* >
>55> ?
(55? @
)55@ A
;55A B
services:: 
.:: 
AddAuthentication:: &
(::& '
options::' .
=>::/ 1
{;; 
options<< 
.<< %
DefaultAuthenticateScheme<< 5
=<<6 7
JwtBearerDefaults<<8 I
.<<I J 
AuthenticationScheme<<J ^
;<<^ _
options== 
.== "
DefaultChallengeScheme== 2
===3 4
JwtBearerDefaults==5 F
.==F G 
AuthenticationScheme==G [
;==[ \
options>> 
.>> 
DefaultScheme>> )
=>>* +
JwtBearerDefaults>>, =
.>>= > 
AuthenticationScheme>>> R
;>>R S
}?? 
)?? 
.@@ 
AddJwtBearer@@ 
(@@ 
options@@ %
=>@@& (
{AA 
optionsBB 
.BB  
RequireHttpsMetadataBB 0
=BB1 2
falseBB3 8
;BB8 9
optionsCC 
.CC 
	SaveTokenCC %
=CC& '
falseCC( -
;CC- .
optionsDD 
.DD %
TokenValidationParametersDD 5
=DD6 7
newDD8 ;%
TokenValidationParametersDD< U
{EE $
ValidateIssuerSigningKeyFF 0
=FF1 2
trueFF3 7
,FF7 8
IssuerSigningKeyGG (
=GG) *!
AuthenticationUtilityGG+ @
.GG@ A#
GetSymmetricSecurityKeyGGA X
(GGX Y
)GGY Z
,GGZ [
ValidateIssuerHH &
=HH' (
falseHH) .
,HH. /
ValidateAudienceII (
=II) *
falseII+ 0
,II0 1
	ClockSkewJJ !
=JJ" #
TimeSpanJJ$ ,
.JJ, -
ZeroJJ- 1
}KK 
;KK 
}LL 
)LL 
;LL 
servicesNN 
.NN #
AddControllersWithViewsNN ,
(NN, -
)NN- .
;NN. /
servicesQQ 
.QQ 

AddSignalRQQ 
(QQ  
)QQ  !
;QQ! "
servicesRR 
.RR 
AddSpaStaticFilesRR &
(RR& '
configurationRR' 4
=>RR5 7
{RR8 9
configurationRR: G
.RRG H
RootPathRRH P
=RRQ R
$strRRS c
;RRc d
}RRe f
)RRf g
;RRg h
servicesTT 
.UU "
AddHttpContextAccessorUU '
(UU' (
)UU( )
.VV 
	AddScopedVV 
(VV 
typeofVV !
(VV! "
IRepositoryVV" -
<VV- .
>VV. /
)VV/ 0
,VV0 1
typeofVV2 8
(VV8 9
BaseRepositoryVV9 G
<VVG H
>VVH I
)VVI J
)VVJ K
.WW 
	AddScopedWW 
<WW  
IBattleshipsDatabaseWW /
,WW/ 0
BattleshipsDatabaseWW1 D
>WWD E
(WWE F
)WWF G
.XX 
	AddScopedXX 
<XX "
IAuthenticationServiceXX 1
,XX1 2!
AuthenticationServiceXX3 H
>XXH I
(XXI J
)XXJ K
.YY 
	AddScopedYY 
<YY 
ICurrentUserServiceYY .
,YY. /
CurrentUserServiceYY0 B
>YYB C
(YYC D
)YYD E
.ZZ 
	AddScopedZZ 
<ZZ 
IGameSessionServiceZZ .
,ZZ. /
GameSessionServiceZZ0 B
>ZZB C
(ZZC D
)ZZD E
.[[ 
	AddScoped[[ 
<[[ .
"IBattleshipsSynchronizationService[[ =
,[[= >-
!BattleshipsSynchronizationService[[? `
>[[` a
([[a b
)[[b c
.\\ 
	AddScoped\\ 
<\\ "
IGameSessionRepository\\ 1
,\\1 2!
GameSessionRepository\\3 H
>\\H I
(\\I J
)\\J K
.]] 
	AddScoped]] 
<]] 
IPlayersService]] *
,]]* +
PlayersService]], :
>]]: ;
(]]; <
)]]< =
;^^ 
}__ 	
publicbb 
voidbb 
	Configurebb 
(bb 
IApplicationBuilderbb 1
appbb2 5
,bb5 6
IWebHostEnvironmentbb7 J
envbbK N
)bbN O
{cc 	
ifdd 
(dd 
envdd 
.dd 
IsDevelopmentdd !
(dd! "
)dd" #
)dd# $
{ee 
appff 
.ff %
UseDeveloperExceptionPageff -
(ff- .
)ff. /
;ff/ 0
appgg 
.gg !
UseMigrationsEndPointgg )
(gg) *
)gg* +
;gg+ ,
}hh 
elseii 
{jj 
appmm 
.mm 
UseHstsmm 
(mm 
)mm 
;mm 
}nn 
apppp 
.pp 
UseHttpsRedirectionpp #
(pp# $
)pp$ %
;pp% &
appqq 
.qq 
UseStaticFilesqq 
(qq 
)qq  
;qq  !
ifrr 
(rr 
!rr 
envrr 
.rr 
IsDevelopmentrr "
(rr" #
)rr# $
)rr$ %
{ss 
apptt 
.tt 
UseSpaStaticFilestt %
(tt% &
)tt& '
;tt' (
}uu 
appww 
.ww 

UseRoutingww 
(ww 
)ww 
;ww 
appyy 
.yy 
UseAuthenticationyy !
(yy! "
)yy" #
;yy# $
app{{ 
.{{ 
UseAuthorization{{  
({{  !
){{! "
;{{" #
app|| 
.|| 
UseEndpoints|| 
(|| 
	endpoints|| &
=>||' )
{}} 
	endpoints~~ 
.~~ 
MapControllerRoute~~ ,
(~~, -
name 
: 
$str #
,# $
pattern
ÄÄ 
:
ÄÄ 
$str
ÄÄ @
)
ÄÄ@ A
;
ÄÄA B
	endpoints
ÅÅ 
.
ÅÅ 
MapRazorPages
ÅÅ '
(
ÅÅ' (
)
ÅÅ( )
;
ÅÅ) *
	endpoints
ÇÇ 
.
ÇÇ 
MapHub
ÇÇ  
<
ÇÇ  !
BattleshipsHub
ÇÇ! /
>
ÇÇ/ 0
(
ÇÇ0 1
$str
ÇÇ1 B
,
ÇÇB C
options
ÇÇD K
=>
ÇÇL N
{
ÉÉ 
options
ÑÑ 
.
ÑÑ 

Transports
ÑÑ &
=
ÑÑ' (
HttpTransportType
ÑÑ) :
.
ÑÑ: ;

WebSockets
ÑÑ; E
;
ÑÑE F
}
ÖÖ 
)
ÖÖ 
;
ÖÖ 
}
ÜÜ 
)
ÜÜ 
;
ÜÜ 
app
àà 
.
àà 
UseSpa
àà 
(
àà 
spa
àà 
=>
àà 
{
ââ 
spa
çç 
.
çç 
Options
çç 
.
çç 

SourcePath
çç &
=
çç' (
$str
çç) 4
;
çç4 5
if
èè 
(
èè 
env
èè 
.
èè 
IsDevelopment
èè %
(
èè% &
)
èè& '
)
èè' (
{
êê 
spa
ëë 
.
ëë !
UseAngularCliServer
ëë +
(
ëë+ ,
	npmScript
ëë, 5
:
ëë5 6
$str
ëë7 >
)
ëë> ?
;
ëë? @
}
íí 
}
ìì 
)
ìì 
;
ìì 

ShipSeeder
ïï 
.
ïï 
	SeedShips
ïï  
(
ïï  !
app
ïï! $
.
ïï$ %!
ApplicationServices
ïï% 8
)
ïï8 9
;
ïï9 :
}
ññ 	
}
óó 
}òò ‘	
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