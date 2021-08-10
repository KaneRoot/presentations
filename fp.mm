<map version="freeplane 1.9.0">
<!--To view this file, download free mind mapping software Freeplane from http://freeplane.sourceforge.net -->
<node TEXT="Functional Programming" FOLDED="false" ID="ID_1834083305" CREATED="1628020825702" MODIFIED="1628020837132"><hook NAME="MapStyle">
    <properties edgeColorConfiguration="#808080ff,#ff0000ff,#0000ffff,#00ff00ff,#ff00ffff,#00ffffff,#7c0000ff,#00007cff,#007c00ff,#7c007cff,#007c7cff,#7c7c00ff" fit_to_viewport="false"/>

<map_styles>
<stylenode LOCALIZED_TEXT="styles.root_node" STYLE="oval" UNIFORM_SHAPE="true" VGAP_QUANTITY="24 pt">
<font SIZE="24"/>
<stylenode LOCALIZED_TEXT="styles.predefined" POSITION="right" STYLE="bubble">
<stylenode LOCALIZED_TEXT="default" ID="ID_271890427" ICON_SIZE="12 pt" COLOR="#000000" STYLE="fork">
<arrowlink SHAPE="CUBIC_CURVE" COLOR="#000000" WIDTH="2" TRANSPARENCY="200" DASH="" FONT_SIZE="9" FONT_FAMILY="SansSerif" DESTINATION="ID_271890427" STARTARROW="DEFAULT" ENDARROW="NONE"/>
<font NAME="SansSerif" SIZE="10" BOLD="false" ITALIC="false"/>
<richcontent CONTENT-TYPE="plain/auto" TYPE="DETAILS"/>
<richcontent TYPE="NOTE" CONTENT-TYPE="plain/auto"/>
</stylenode>
<stylenode LOCALIZED_TEXT="defaultstyle.details"/>
<stylenode LOCALIZED_TEXT="defaultstyle.attributes">
<font SIZE="9"/>
</stylenode>
<stylenode LOCALIZED_TEXT="defaultstyle.note" COLOR="#000000" BACKGROUND_COLOR="#ffffff" TEXT_ALIGN="LEFT"/>
<stylenode LOCALIZED_TEXT="defaultstyle.floating">
<edge STYLE="hide_edge"/>
<cloud COLOR="#f0f0f0" SHAPE="ROUND_RECT"/>
</stylenode>
<stylenode LOCALIZED_TEXT="defaultstyle.selection" BACKGROUND_COLOR="#4e85f8" STYLE="bubble" BORDER_COLOR_LIKE_EDGE="false" BORDER_COLOR="#4e85f8"/>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.user-defined" POSITION="right" STYLE="bubble">
<stylenode LOCALIZED_TEXT="styles.topic" COLOR="#18898b" STYLE="fork">
<font NAME="Liberation Sans" SIZE="10" BOLD="true"/>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.subtopic" COLOR="#cc3300" STYLE="fork">
<font NAME="Liberation Sans" SIZE="10" BOLD="true"/>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.subsubtopic" COLOR="#669900">
<font NAME="Liberation Sans" SIZE="10" BOLD="true"/>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.important" ID="ID_67550811">
<icon BUILTIN="yes"/>
<arrowlink COLOR="#003399" TRANSPARENCY="255" DESTINATION="ID_67550811"/>
</stylenode>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.AutomaticLayout" POSITION="right" STYLE="bubble">
<stylenode LOCALIZED_TEXT="AutomaticLayout.level.root" COLOR="#000000" STYLE="oval" SHAPE_HORIZONTAL_MARGIN="10 pt" SHAPE_VERTICAL_MARGIN="10 pt">
<font SIZE="18"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,1" COLOR="#0033ff">
<font SIZE="16"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,2" COLOR="#00b439">
<font SIZE="14"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,3" COLOR="#990000">
<font SIZE="12"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,4" COLOR="#111111">
<font SIZE="10"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,5"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,6"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,7"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,8"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,9"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,10"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,11"/>
</stylenode>
</stylenode>
</map_styles>
</hook>
<node TEXT="Introduction" POSITION="left" ID="ID_1857187320" CREATED="1628603214834" MODIFIED="1628603217087">
<node TEXT="FP: what, how it helps write better software, small comparison with imperative" ID="ID_1904917568" CREATED="1628022159341" MODIFIED="1628023230282"/>
<node TEXT="Why this document" FOLDED="true" ID="ID_816719904" CREATED="1628514082838" MODIFIED="1628514086651">
<node TEXT="FP is great, let&apos;s talk about it." ID="ID_1230864538" CREATED="1628514092998" MODIFIED="1628514106114"/>
<node TEXT="Haskell is great because it helps express the code with more nuances than other languages, which implies an overwhelming amount of knowledge. Keeping track of everything is hard." ID="ID_1579264403" CREATED="1628514119798" MODIFIED="1628514606053"/>
<node TEXT="Everyone can learn something in this paper, even reading only the first pages and still writing in imperative languages." ID="ID_1852748301" CREATED="1628514618414" MODIFIED="1628514707382"/>
<node TEXT="Explain Haskell and its main API and a few useful modules." ID="ID_1490747105" CREATED="1628515505999" MODIFIED="1628515554858"/>
<node TEXT="Provide a few real-life examples." ID="ID_1777221644" CREATED="1628515555255" MODIFIED="1628515569352"/>
</node>
<node TEXT="Sections" ID="ID_175391010" CREATED="1628603243795" MODIFIED="1628603263704">
<node TEXT="Base concepts of FP and Haskell syntax" ID="ID_1523233298" CREATED="1628603287539" MODIFIED="1628603331615"/>
</node>
</node>
<node TEXT="Base concepts and Haskell syntax" POSITION="left" ID="ID_115078185" CREATED="1628023297543" MODIFIED="1628603342663">
<node TEXT="Functions" ID="ID_210236505" CREATED="1628122535425" MODIFIED="1628262015350">
<node TEXT="A function only takes a single argument... here&apos;s why" ID="ID_1633679369" CREATED="1628122743293" MODIFIED="1628122761205"/>
<node TEXT="Pattern Matching" ID="ID_1229541415" CREATED="1628122546692" MODIFIED="1628122551797"/>
<node TEXT="Guards" ID="ID_818327136" CREATED="1628122541332" MODIFIED="1628122544229"/>
<node TEXT="Case" ID="ID_388330669" CREATED="1628122552852" MODIFIED="1628122553751"/>
<node TEXT="Anonymous functions: lambdas" ID="ID_1144432022" CREATED="1628122691802" MODIFIED="1628122707789"/>
<node TEXT="where" ID="ID_516999280" CREATED="1628259928467" MODIFIED="1628259929792"/>
<node TEXT="let" ID="ID_346297232" CREATED="1628259930507" MODIFIED="1628259931224"/>
</node>
<node TEXT="Types" ID="ID_1679357003" CREATED="1628023039302" MODIFIED="1628262014317">
<node TEXT="Simple types" ID="ID_530950771" CREATED="1628023065011" MODIFIED="1628023067506"/>
<node TEXT="Type synonyms" ID="ID_643325209" CREATED="1628023393842" MODIFIED="1628023397266">
<node TEXT="Semantic matters!" ID="ID_177345887" CREATED="1628023400992" MODIFIED="1628023490642"/>
<node TEXT="refactoring has never been easier" ID="ID_576728264" CREATED="1628023526112" MODIFIED="1628023552471"/>
</node>
<node TEXT="What type should I use? Holes!" ID="ID_744240932" CREATED="1628070709725" MODIFIED="1628272143735"/>
<node TEXT="Data structures" ID="ID_1175899171" CREATED="1628605429061" MODIFIED="1628605438183">
<node TEXT="Sum" ID="ID_1341059538" CREATED="1628262323439" MODIFIED="1628607716052">
<node TEXT="Sum data type = list of values, as an enumeration." ID="ID_1611571259" CREATED="1628607678966" MODIFIED="1628607723547"/>
<node TEXT="Example: data Boolean = True | False" ID="ID_91202560" CREATED="1628023650942" MODIFIED="1628607673700"/>
<node TEXT="In this example, True and False are called Constructors" ID="ID_721648883" CREATED="1628609041367" MODIFIED="1628609053358">
<node TEXT="Keyword used to create a data." ID="ID_534122076" CREATED="1628516592152" MODIFIED="1628516826472"/>
<node TEXT="Used in pattern matching" ID="ID_896551645" CREATED="1628516580791" MODIFIED="1628516587685"/>
<node TEXT="Example:&#xa;not :: Boolean -&gt; Boolean&#xa;not True = False&#xa;not False = True" ID="ID_1192295534" CREATED="1628516947087" MODIFIED="1628516986356"/>
</node>
</node>
<node TEXT="Product" ID="ID_388800244" CREATED="1628607785782" MODIFIED="1628607787204">
<node TEXT="Example: data Figure = Rectangle Float Float" ID="ID_73628931" CREATED="1628270378894" MODIFIED="1628607783459"/>
<node TEXT="Constructors contain values" ID="ID_1462940697" CREATED="1628607749390" MODIFIED="1628607769709"/>
</node>
<node TEXT="Record" ID="ID_104134289" CREATED="1628607710214" MODIFIED="1628607796544">
<node TEXT="Constructor values have names." ID="ID_790054719" CREATED="1628607813830" MODIFIED="1628607823563"/>
<node TEXT="Example: data Figure = Rectangle { _height :: Float, _width :: Float }" ID="ID_745741784" CREATED="1628270480494" MODIFIED="1628607803704"/>
</node>
<node TEXT="Algebraic" ID="ID_927394513" CREATED="1628607835862" MODIFIED="1628607839867">
<node TEXT="Both sum and product data types: enumeration of constructors with values" ID="ID_616650112" CREATED="1628607861543" MODIFIED="1628607944767"/>
<node TEXT="Example: Figure = Circle Float | Rectangle Float Float&#xa;Algebraic = both sum and product data types" ID="ID_119853317" CREATED="1628270577514" MODIFIED="1628607850254"/>
</node>
<node TEXT="Recursive" ID="ID_409058499" CREATED="1628607955214" MODIFIED="1628607957215">
<node TEXT="Data structure refering to itself in its definition." ID="ID_167897305" CREATED="1628607975718" MODIFIED="1628608029485"/>
<node TEXT="Example: data List = Element Int List | End" ID="ID_929129029" CREATED="1628270699573" MODIFIED="1628607964579"/>
</node>
<node TEXT="Polymorphic" ID="ID_700717597" CREATED="1628023636311" MODIFIED="1628608047163">
<node TEXT="Constructors accept values without imposing the type. The type is then a parameter of the data structure." ID="ID_1979134022" CREATED="1628608073086" MODIFIED="1628608212493"/>
<node TEXT="Example: data List a = Element a (List a) | End" ID="ID_1820713813" CREATED="1628270776424" MODIFIED="1628608229211"/>
</node>
</node>
</node>
<node TEXT="Type classes" ID="ID_1789446540" CREATED="1628264887051" MODIFIED="1628607538571">
<node TEXT="Category of types" ID="ID_1349368880" CREATED="1628519066337" MODIFIED="1628519071557"/>
<node TEXT="Functions to implement" ID="ID_390471668" CREATED="1628511878415" MODIFIED="1628511889165">
<node TEXT="Called method" ID="ID_294160043" CREATED="1628265874173" MODIFIED="1628612221734"/>
<node TEXT="An implementation of the methods of a type class is an &quot;instance&quot;" ID="ID_483735211" CREATED="1628264890380" MODIFIED="1628612254916"/>
</node>
<node TEXT="Example: Show represents a class of types that can be serialized as a simple printable string. The class contains the function &quot;show&quot;." ID="ID_238287124" CREATED="1628608278966" MODIFIED="1628608898892"/>
<node TEXT="May imply constraints on types, exactly as in object oriented programming.&#xa;Example: class Vehicle f =&gt; Car f where ..." ID="ID_67834013" CREATED="1628511892071" MODIFIED="1628512756618"/>
<node TEXT="Can be seen as an interface in Java" ID="ID_96262848" CREATED="1628511841872" MODIFIED="1628511876505"/>
<node TEXT="The way it is used however is more pervasive: even chaining functions or parameters in a function call is related to classes." ID="ID_231058558" CREATED="1628512778309" MODIFIED="1628512869507"/>
</node>
<node TEXT="Data kinds" ID="ID_294880249" CREATED="1628023335561" MODIFIED="1628272143737"/>
</node>
<node TEXT="Complex data structures" POSITION="left" ID="ID_293357856" CREATED="1628607447054" MODIFIED="1628607489159">
<node TEXT="Generalized Algebraic Data Types" ID="ID_1422011453" CREATED="1628245087931" MODIFIED="1628245115074">
<node TEXT="Constructors are defined as functions" ID="ID_1388416519" CREATED="1628607568054" MODIFIED="1628607588020"/>
<node TEXT="Allows a fine-grained typing" ID="ID_366439125" CREATED="1628607604366" MODIFIED="1628607629735"/>
</node>
<node TEXT="Phantom type" ID="ID_1808796342" CREATED="1628612316770" MODIFIED="1628612324497"/>
<node TEXT="Tagless Final" ID="ID_1287161148" CREATED="1628272126595" MODIFIED="1628272131110">
<node TEXT="Final encoding: Constructors aren&apos;t in the data type anymore." ID="ID_268532538" CREATED="1628606557797" MODIFIED="1628612340048"/>
<node TEXT="Tagless Final approach: use type class instead of algebraic data type" ID="ID_1458978247" CREATED="1628606674581" MODIFIED="1628606741477"/>
</node>
<node TEXT="Free monads" ID="ID_1571983650" CREATED="1628607517741" MODIFIED="1628607520444"/>
</node>
<node TEXT="A few concepts" POSITION="left" ID="ID_1149671791" CREATED="1628264882387" MODIFIED="1628519277781">
<node TEXT="Prelude" ID="ID_711936720" CREATED="1628264972083" MODIFIED="1628264973956"/>
<node TEXT="Referential transparency, or &quot;purity&quot;" ID="ID_1489170120" CREATED="1628553427284" MODIFIED="1628553439528"/>
<node TEXT="Laziness" ID="ID_1344322433" CREATED="1628269776214" MODIFIED="1628269779262"/>
<node TEXT="High order functions" ID="ID_1018751819" CREATED="1628269716515" MODIFIED="1628269720655"/>
<node TEXT="Comprehension list" ID="ID_1504431904" CREATED="1628269740774" MODIFIED="1628269751360"/>
</node>
<node TEXT="Usual type classes" POSITION="right" ID="ID_458806914" CREATED="1628022172142" MODIFIED="1628262006703">
<node TEXT="Principle: Java&apos;s interfaces on steroids" ID="ID_1583199564" CREATED="1628261869809" MODIFIED="1628261883320"/>
<node TEXT="Other type classes (at least) to mention" ID="ID_740737950" CREATED="1628261839578" MODIFIED="1628261912414">
<node TEXT="Num" ID="ID_690764099" CREATED="1628263663730" MODIFIED="1628263664666"/>
<node TEXT="Eq" ID="ID_1945505969" CREATED="1628261812569" MODIFIED="1628261815189"/>
<node TEXT="Ord" ID="ID_237832292" CREATED="1628261815668" MODIFIED="1628261816385"/>
<node TEXT="Semigroup" ID="ID_1773761734" CREATED="1628261768080" MODIFIED="1628261770289"/>
<node TEXT="Monoid" ID="ID_771840871" CREATED="1628261820838" MODIFIED="1628261822651"/>
<node TEXT="Foldable" ID="ID_1363081267" CREATED="1628264034980" MODIFIED="1628264038462"/>
<node TEXT="Read" ID="ID_830035190" CREATED="1628261770858" MODIFIED="1628261773785"/>
<node TEXT="Alternative" ID="ID_1438690565" CREATED="1628257874288" MODIFIED="1628261836499"/>
</node>
<node TEXT="Functors" ID="ID_1170194747" CREATED="1628022213361" MODIFIED="1628022215410">
<node TEXT="Type class of stuff containing values" ID="ID_1465981498" CREATED="1628259985508" MODIFIED="1628259996330"/>
<node TEXT="A type f is a Functor if it provides a function fmap which, given any types a and b lets you apply any function from (a -&gt; b) to turn an f a into an f b, preserving the structure of f. Furthermore f needs to adhere to the following:" ID="ID_1719669156" CREATED="1628523423114" MODIFIED="1628523425437"/>
<node TEXT="Simple examples" ID="ID_1132701790" CREATED="1628259968978" MODIFIED="1628259972296">
<node TEXT="Lists" ID="ID_98089072" CREATED="1628259955727" MODIFIED="1628259976036"/>
<node TEXT="Maybe" ID="ID_1755402885" CREATED="1628259950907" MODIFIED="1628259976034"/>
</node>
<node TEXT="Must implement: fmap" ID="ID_681798732" CREATED="1628260006528" MODIFIED="1628260039539">
<font NAME="SansSerif" SIZE="12"/>
</node>
</node>
<node TEXT="Applicative" ID="ID_1409982258" CREATED="1628022205321" MODIFIED="1628022210457">
<node TEXT="All parameters don&apos;t have to be instances of Applicative, we can use &quot;pure&quot;&#xa;g &lt;$&gt; x1 &lt;*&gt; pure x2 &lt;*&gt; x3" ID="ID_747149158" CREATED="1628258122371" MODIFIED="1628258218883"/>
</node>
<node TEXT="Alternative" ID="ID_69352603" CREATED="1628438867291" MODIFIED="1628438872447">
<node TEXT="Inherits from Applicative" ID="ID_1101500539" CREATED="1628438881058" MODIFIED="1628438914214"/>
<node TEXT="character = letter &lt;|&gt; digit" ID="ID_199204787" CREATED="1628438917242" MODIFIED="1628439035553"/>
</node>
<node TEXT="Monads" ID="ID_1980255089" CREATED="1628022216851" MODIFIED="1628022220345">
<node TEXT="Principle" ID="ID_1758504911" CREATED="1628260192248" MODIFIED="1628300306420">
<node TEXT="chaining function calls" ID="ID_466029407" CREATED="1628300290506" MODIFIED="1628300299444"/>
<node TEXT="Bind and Then" ID="ID_161417065" CREATED="1628300063976" MODIFIED="1628300067466"/>
<node TEXT="do notation: syntactic sugar" ID="ID_770616503" CREATED="1628260220898" MODIFIED="1628300083308"/>
</node>
<node TEXT="Maybe and Either" ID="ID_1548792587" CREATED="1628070206765" MODIFIED="1628070215289"/>
<node TEXT="IO/Effect" ID="ID_385016461" CREATED="1628022222591" MODIFIED="1628022228242"/>
<node TEXT="Reader" ID="ID_1354315768" CREATED="1628070186974" MODIFIED="1628070188257"/>
<node TEXT="Show" ID="ID_173605475" CREATED="1628300407706" MODIFIED="1628300408852"/>
<node TEXT="Writer" ID="ID_1811924847" CREATED="1628070188865" MODIFIED="1628070190297"/>
<node TEXT="ST" ID="ID_352772120" CREATED="1628070184005" MODIFIED="1628070185137">
<node TEXT="thaw immutable arrays into mutable ones" ID="ID_231387970" CREATED="1628070585205" MODIFIED="1628070618057"/>
<node TEXT="mutable references over the array" ID="ID_401121331" CREATED="1628070641855" MODIFIED="1628070649066"/>
</node>
</node>
<node TEXT="Monad Transformers" ID="ID_20587516" CREATED="1628259120051" MODIFIED="1628259126053"/>
</node>
<node TEXT="Profiling" POSITION="right" ID="ID_990221750" CREATED="1628262094169" MODIFIED="1628262096265"/>
<node TEXT="Parallelism and Concurency" POSITION="right" ID="ID_1972011530" CREATED="1628299989875" MODIFIED="1628300000444">
<node TEXT="Threading" ID="ID_1959812870" CREATED="1628262073688" MODIFIED="1628262083271">
<node TEXT="sparkles" ID="ID_247424396" CREATED="1628439206434" MODIFIED="1628543883670"/>
<node TEXT="pseq" ID="ID_216593186" CREATED="1628439186178" MODIFIED="1628439188033"/>
</node>
</node>
<node TEXT="Networking" POSITION="right" ID="ID_47100260" CREATED="1628264983461" MODIFIED="1628264985076"/>
<node TEXT="See Also" POSITION="right" ID="ID_148032193" CREATED="1628256698087" MODIFIED="1628262005974">
<node TEXT="FP languages" ID="ID_1516488124" CREATED="1628256547767" MODIFIED="1628256551735"/>
<node TEXT="Modules" ID="ID_1531666136" CREATED="1628256529228" MODIFIED="1628256544944">
<node TEXT="Data.Text" ID="ID_1999844249" CREATED="1628256560087" MODIFIED="1628256563462"/>
<node TEXT="Data.ByteString" ID="ID_1586054697" CREATED="1628256563817" MODIFIED="1628256573768"/>
<node TEXT="MegaParsec" ID="ID_771108746" CREATED="1628256719117" MODIFIED="1628256721688"/>
<node TEXT="lenses" ID="ID_494122288" CREATED="1628022199701" MODIFIED="1628256556869"/>
</node>
</node>
<node TEXT="Annex: vocabulary" POSITION="right" ID="ID_1165950049" CREATED="1628518365121" MODIFIED="1628518370957"/>
<node TEXT="Old" FOLDED="true" POSITION="right" ID="ID_264798981" CREATED="1628261928639" MODIFIED="1628261994861">
<node TEXT="Introduction" ID="ID_450775614" CREATED="1628020839167" MODIFIED="1628261935760">
<node TEXT="Examples" ID="ID_923261774" CREATED="1628021004141" MODIFIED="1628021006395"/>
<node TEXT="What&apos;s great in FP" ID="ID_1255156364" CREATED="1628020972671" MODIFIED="1628021229274"/>
</node>
<node TEXT="Functors" ID="ID_1968276907" CREATED="1628020843741" MODIFIED="1628261935756">
<node TEXT="Functors" ID="ID_684317578" CREATED="1628020898231" MODIFIED="1628020903185"/>
<node TEXT="Applicatives" ID="ID_1867587456" CREATED="1628020882482" MODIFIED="1628020892537"/>
<node TEXT="Monads" ID="ID_1570967122" CREATED="1628020904541" MODIFIED="1628020907361"/>
</node>
<node TEXT="Notes: quick and dirty" ID="ID_282081787" CREATED="1628021178611" MODIFIED="1628261935750"/>
<node TEXT="Pure Theory" ID="ID_1751367173" CREATED="1628021037861" MODIFIED="1628261935748">
<node TEXT="Covariant Functors" ID="ID_1999314053" CREATED="1628021052501" MODIFIED="1628021064945"/>
<node TEXT="Contravariant Functors" ID="ID_839829509" CREATED="1628021067661" MODIFIED="1628021072514"/>
<node TEXT="BiFunctor" ID="ID_924580591" CREATED="1628021072891" MODIFIED="1628021081032"/>
<node TEXT="ProFunctor" ID="ID_796070930" CREATED="1628021083043" MODIFIED="1628021085474"/>
</node>
<node TEXT="Lenses: manipulate nested structures easily" ID="ID_1968451495" CREATED="1628021090290" MODIFIED="1628261935741"/>
</node>
</node>
</map>
