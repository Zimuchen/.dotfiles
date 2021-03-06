FasdUAS 1.101.10   ��   ��    k             l      ��  ��   

	Automatically open items linked from an OmniFocus Task Note.
	
	This script is designed to be assigned to a hotkey using an app such as FastScripts, Alfred, or Keyboard Maestro. To use it, simply select a task in OmniFocus and hit the assigned key. 
	
	If the task's note contains a URI of any kind, it will be automatically opened in the appropriate app. This is a handy way to open not only web pages, but other OmniFocus perspectives (using the omnifocus:///perspective/perspective-name URI), sending an email (mailto:// URI) or even placing calls via Handoff using the tel:// URI). 
	
	Since most apps on OS X don't offer URI handlers, however, an extra routine looks for a note beginning with the prefix "App:" followed by the name of an OS X app, as it appears in your Applications folder. This allows specific apps to be launched directly from a task in OmniFocus. 


	Original Script	Copyright � 2016 Jesse David Hollington (jesse@hollington.ca)
	Licensed under MIT License (http://www.opensource.org/licenses/mit-license.php)	
     � 	 	 
 
 	 A u t o m a t i c a l l y   o p e n   i t e m s   l i n k e d   f r o m   a n   O m n i F o c u s   T a s k   N o t e . 
 	 
 	 T h i s   s c r i p t   i s   d e s i g n e d   t o   b e   a s s i g n e d   t o   a   h o t k e y   u s i n g   a n   a p p   s u c h   a s   F a s t S c r i p t s ,   A l f r e d ,   o r   K e y b o a r d   M a e s t r o .   T o   u s e   i t ,   s i m p l y   s e l e c t   a   t a s k   i n   O m n i F o c u s   a n d   h i t   t h e   a s s i g n e d   k e y .   
 	 
 	 I f   t h e   t a s k ' s   n o t e   c o n t a i n s   a   U R I   o f   a n y   k i n d ,   i t   w i l l   b e   a u t o m a t i c a l l y   o p e n e d   i n   t h e   a p p r o p r i a t e   a p p .   T h i s   i s   a   h a n d y   w a y   t o   o p e n   n o t   o n l y   w e b   p a g e s ,   b u t   o t h e r   O m n i F o c u s   p e r s p e c t i v e s   ( u s i n g   t h e   o m n i f o c u s : / / / p e r s p e c t i v e / p e r s p e c t i v e - n a m e   U R I ) ,   s e n d i n g   a n   e m a i l   ( m a i l t o : / /   U R I )   o r   e v e n   p l a c i n g   c a l l s   v i a   H a n d o f f   u s i n g   t h e   t e l : / /   U R I ) .   
 	 
 	 S i n c e   m o s t   a p p s   o n   O S   X   d o n ' t   o f f e r   U R I   h a n d l e r s ,   h o w e v e r ,   a n   e x t r a   r o u t i n e   l o o k s   f o r   a   n o t e   b e g i n n i n g   w i t h   t h e   p r e f i x   " A p p : "   f o l l o w e d   b y   t h e   n a m e   o f   a n   O S   X   a p p ,   a s   i t   a p p e a r s   i n   y o u r   A p p l i c a t i o n s   f o l d e r .   T h i s   a l l o w s   s p e c i f i c   a p p s   t o   b e   l a u n c h e d   d i r e c t l y   f r o m   a   t a s k   i n   O m n i F o c u s .   
 
 
 	 O r i g i n a l   S c r i p t 	 C o p y r i g h t   �   2 0 1 6   J e s s e   D a v i d   H o l l i n g t o n   ( j e s s e @ h o l l i n g t o n . c a ) 
 	 L i c e n s e d   u n d e r   M I T   L i c e n s e   ( h t t p : / / w w w . o p e n s o u r c e . o r g / l i c e n s e s / m i t - l i c e n s e . p h p ) 	 
   
  
 l     ��������  ��  ��        l     ��������  ��  ��        l     ��������  ��  ��        l     ��������  ��  ��        l     ��  ��    / ) The name of your "Dashboard" perspective     �   R   T h e   n a m e   o f   y o u r   " D a s h b o a r d "   p e r s p e c t i v e      l     ����  r         m        �    H o t l i s t  o      ���� 0 dashboard_perspective  ��  ��        l     ��������  ��  ��       !   l     �� " #��   " Q K This just initializes some variables, since we may not set them otherwise.    # � $ $ �   T h i s   j u s t   i n i t i a l i z e s   s o m e   v a r i a b l e s ,   s i n c e   w e   m a y   n o t   s e t   t h e m   o t h e r w i s e . !  % & % l    '���� ' r     ( ) ( m     * * � + +   ) o      ���� 
0 target  ��  ��   &  , - , l    .���� . r     / 0 / m    	 1 1 � 2 2   0 o      ���� 0 theitem theItem��  ��   -  3 4 3 l     ��������  ��  ��   4  5 6 5 l     ��������  ��  ��   6  7 8 7 l   � 9���� 9 O    � : ; : k    � < <  = > = l   ��������  ��  ��   >  ? @ ? l   �� A B��   A &   Get the currently selected item    B � C C @   G e t   t h e   c u r r e n t l y   s e l e c t e d   i t e m @  D E D l   ��������  ��  ��   E  F G F O    � H I H k    � J J  K L K Q    � M N�� M k    � O O  P Q P r    @ R S R n    > T U T 1   < >��
�� 
valL U n    < V W V 4  9 <�� X
�� 
cobj X m   : ;����  W l   9 Y���� Y 6  9 Z [ Z 2   "��
�� 
OTst [ F   # 8 \ ] \ >  $ - ^ _ ^ n   % ) ` a ` m   ' )��
�� 
pcls a n  % ' b c b 1   % '��
�� 
valL c  g   % % _ m   * ,��
�� 
cobj ] >  . 7 d e d n   / 3 f g f m   1 3��
�� 
pcls g n  / 1 h i h 1   / 1��
�� 
valL i  g   / / e m   4 6��
�� 
FCAr��  ��   S o      ���� 0 theitem theItem Q  j k j l  A A��������  ��  ��   k  l m l l  A A�� n o��   n ? 9 Only do something if there's a note in the selected item    o � p p r   O n l y   d o   s o m e t h i n g   i f   t h e r e ' s   a   n o t e   i n   t h e   s e l e c t e d   i t e m m  q r q l  A A��������  ��  ��   r  s�� s Z   A � t u���� t >  A J v w v n   A F x y x 1   B F��
�� 
FCno y o   A B���� 0 theitem theItem w m   F I z z � { {   u Z   M � | }�� ~ | >  M k  �  n   M g � � � 1   e g��
�� 
valL � n   M e � � � 5   [ e�� ���
�� 
OSsa � m   ^ a � � � � �  l i n k
�� kfrmname � n   M [ � � � m   W [��
�� 
OSst � n   M W � � � 4   R W�� �
�� 
cpar � m   U V����  � n   M R � � � 1   N R��
�� 
FCno � o   M N���� 0 theitem theItem � m   g j � � � � �   } r   n � � � � n   n � � � � 1   � ���
�� 
valL � n   n � � � � 5   | ��� ���
�� 
OSsa � m    � � � � � �  l i n k
�� kfrmname � n   n | � � � m   x |��
�� 
OSst � n   n x � � � 4   s x�� �
�� 
cpar � m   v w����  � n   n s � � � 1   o s��
�� 
FCno � o   n o���� 0 theitem theItem � o      ���� 
0 target  ��   ~ r   � � � � � n   � � � � � 1   � ���
�� 
FCno � o   � ����� 0 theitem theItem � o      ���� 
0 target  ��  ��  ��   N R      ������
�� .ascrerr ****      � ****��  ��  ��   L  ��� � l  � ���������  ��  ��  ��   I n     � � � 1    ��
�� 
FCcn � n     � � � 4   �� �
�� 
FCdw � m    ����  � 4   �� �
�� 
docu � m    ����  G  � � � l  � ���������  ��  ��   �  � � � l  � ��� � ���   � � � If NO item is selected, return to the Hotlist context. This provides an easy way to switch back and forth between the "dashboard" list using the same hotkey.    � � � �<   I f   N O   i t e m   i s   s e l e c t e d ,   r e t u r n   t o   t h e   H o t l i s t   c o n t e x t .   T h i s   p r o v i d e s   a n   e a s y   w a y   t o   s w i t c h   b a c k   a n d   f o r t h   b e t w e e n   t h e   " d a s h b o a r d "   l i s t   u s i n g   t h e   s a m e   h o t k e y . �  � � � l  � ���������  ��  ��   �  � � � Z  � � � ����� � =  � � � � � o   � ����� 0 theitem theItem � m   � � � � � � �   � O  � � � � � O  � � � � � r   � � � � � o   � ����� 0 dashboard_perspective   � 1   � ���
�� 
FCPn � l  � � ����� � 4  � ��� �
�� 
FCdw � m   � ����� ��  ��   � l  � � ����� � 1   � ���
�� 
FCDo��  ��  ��  ��   �  ��� � l  � ���������  ��  ��  ��   ; m     � ��                                                                                  OFOC  alis    X  Macintosh HD               �u�H+  -_OmniFocus.app                                                  U���!�q        ����  	                Applications    �u�      �"a�    -_  (Macintosh HD:Applications: OmniFocus.app    O m n i F o c u s . a p p    M a c i n t o s h   H D  Applications/OmniFocus.app  / ��  ��  ��   8  � � � l     ��������  ��  ��   �  � � � l     � � ��   �  If the note begins with the word "App:" then we can assume anything after that is an application name to be launched or brought to the forefront. Anything that looks like a URI gets launched with the standard OS X "Open" command. Anything else in the note field is simply ignored.     � � � �4   I f   t h e   n o t e   b e g i n s   w i t h   t h e   w o r d   " A p p : "   t h e n   w e   c a n   a s s u m e   a n y t h i n g   a f t e r   t h a t   i s   a n   a p p l i c a t i o n   n a m e   t o   b e   l a u n c h e d   o r   b r o u g h t   t o   t h e   f o r e f r o n t .   A n y t h i n g   t h a t   l o o k s   l i k e   a   U R I   g e t s   l a u n c h e d   w i t h   t h e   s t a n d a r d   O S   X   " O p e n "   c o m m a n d .   A n y t h i n g   e l s e   i n   t h e   n o t e   f i e l d   i s   s i m p l y   i g n o r e d .   �  � � � l     �~�}�|�~  �}  �|   �  � � � l     �{�z�y�{  �z  �y   �  ��x � l  � � ��w�v � Z   � � � ��u�t � C  � � � � � o   � ��s�s 
0 target   � m   � � � � � � �  A p p : � k   � � � �  � � � l  � ��r�q�p�r  �q  �p   �  � � � r   � � � � � c   � � � � � n   � � � � � 7  � ��o � �
�o 
ctxt � m   � ��n�n  � m   � ��m�m�� � o   � ��l�l 
0 target   � m   � ��k
�k 
TEXT � o      �j�j 
0 target   �  � � � I  � ��i ��h
�i .sysoexecTEXT���     TEXT � b   � � � � � m   � � � � � � � 
 o p e n   � o   � ��g�g 
0 target  �h   �  � � � l  � ��f � ��f   � ) #tell application target to activate    � � � � F t e l l   a p p l i c a t i o n   t a r g e t   t o   a c t i v a t e �  � � � l  � ��e � ��e   �  	    � � � �  	 �  � � � l  � ��d � ��d   � ( "else if target contains "://" then    � � � � D e l s e   i f   t a r g e t   c o n t a i n s   " : / / "   t h e n �  � � � l  � ��c �c     	    �  	 �  l  � ��b�b   ' !	do shell script "open " & target    � B 	 d o   s h e l l   s c r i p t   " o p e n   "   &   t a r g e t �a l  � ��`�_�^�`  �_  �^  �a  �u  �t  �w  �v  �x       �]	
 �]  	 �\�[�Z�Y
�\ .aevtoappnull  �   � ****�[ 0 dashboard_perspective  �Z 
0 target  �Y 0 theitem theItem
 �X�W�V�U
�X .aevtoappnull  �   � **** k     �    %  ,  7  ��T�T  �W  �V     $ �S *�R 1�Q ��P�O�N�M�L�K�J�I�H z�G�F�E ��D � ��C�B ��A�@ ��?�>�= ��<�S 0 dashboard_perspective  �R 
0 target  �Q 0 theitem theItem
�P 
docu
�O 
FCdw
�N 
FCcn
�M 
OTst  
�L 
valL
�K 
pcls
�J 
cobj
�I 
FCAr
�H 
FCno
�G 
cpar
�F 
OSst
�E 
OSsa
�D kfrmname�C  �B  
�A 
FCDo
�@ 
FCPn
�? 
ctxt�> 
�= 
TEXT
�< .sysoexecTEXT���     TEXT�U ��E�O�E�O�E�O� �*�k/�k/�, � ~*�-�[[�,�,\Z�9\[�,�,\Z�9A1�k/�,E�O�a ,a  L�a ,a k/a ,a a a 0�,a  !�a ,a k/a ,a a a 0�,E�Y 	�a ,E�Y hW X  hOPUO�a   *a , *�k/ 	�*a ,FUUY hOPUO�a  &�[a \[Za  \Zi2a !&E�Oa "�%j #OPY h � � / U s e r s / z m c h a r y / D o c u m e n t s / D a t a b a s e / P e r s o n a l . d t B a s e 2 / F i l e s . n o i n d e x / m d / 2 / w o r k f l o w . m d  �;�:  ��9
�9 
FCDo
�; 
FCpr �  h Z I T x J i 6 i Q E
�: kfrmID   ascr  ��ޭ