FasdUAS 1.101.10   ��   ��    k             w          k       	 	  
  
 i         I      �� ���� "0 documentdidsave documentDidSave   ��  o      ���� 0 doc  ��  ��    Z     t  ����  =         l     ����  n         1    ��
�� 
oDsk  o     ���� 0 doc  ��  ��    m    ��
�� boovtrue  k    p       r        I    �������� 0 getscriptpath getScriptPath��  ��    o      ���� 0 
scriptpath 
scriptPath      r        n       !   1    ��
�� 
SoLn ! o    ���� 0 doc    o      ���� 0 thelanguage theLanguage   " # " r     $ % $ n     & ' & m    ��
�� 
file ' o    ���� 0 doc   % o      ���� 0 filepath filePath #  ( ) ( r    5 * + * b    3 , - , b    - . / . l   + 0���� 0 c    + 1 2 1 b    ) 3 4 3 b    % 5 6 5 b    # 7 8 7 m     9 9 � : : 
 r u b y   8 n    " ; < ; 1     "��
�� 
strq < n      = > = 1     ��
�� 
psxp > o    ���� 0 
scriptpath 
scriptPath 6 m   # $ ? ? � @ @    4 n   % ( A B A 1   & (��
�� 
strq B o   % &���� 0 thelanguage theLanguage 2 m   ) *��
�� 
TEXT��  ��   / m   + , C C � D D    o n _ s a v e   - n   - 2 E F E 1   0 2��
�� 
strq F n   - 0 G H G 1   . 0��
�� 
psxp H o   - .���� 0 filepath filePath + o      ���� 0 
thecommand 
theCommand )  I J I r   6 = K L K I  6 ;�� M��
�� .sysoexecTEXT���     TEXT M o   6 7���� 0 
thecommand 
theCommand��   L o      ���� 0 	theresult 	theResult J  N O N l  > >��������  ��  ��   O  P�� P Z   > p Q���� R Q =   > A S T S o   > ?���� 0 	theresult 	theResult T m   ? @ U U � V V  ��  ��   R k   H p W W  X Y X r   H Q Z [ Z I   H O�� \���� 	0 split   \  ] ^ ] o   I J���� 0 	theresult 	theResult ^  _�� _ m   J K ` ` � a a  : : :��  ��   [ o      ���� 0 	theresult 	theResult Y  b c b l  R R��������  ��  ��   c  d e d r   R X f g f n   R V h i h 4   S V�� j
�� 
cobj j m   T U����  i o   R S���� 0 	theresult 	theResult g o      ���� 0 
themessage 
theMessage e  k l k r   Y _ m n m n   Y ] o p o 4   Z ]�� q
�� 
cobj q m   [ \����  p o   Y Z���� 0 	theresult 	theResult n o      ���� 0 
thedetails 
theDetails l  r s r r   ` f t u t n   ` d v w v 4   a d�� x
�� 
cobj x m   b c����  w o   ` a���� 0 	theresult 	theResult u o      ���� 0 thetitle theTitle s  y z y l  g g��������  ��  ��   z  { | { l  g g�� } ~��   } � �set theDialogResult to display dialog theMessage buttons {"Ignore", "Details"} default button "Details" cancel button "Ignore" with title theTitle    ~ �  $ s e t   t h e D i a l o g R e s u l t   t o   d i s p l a y   d i a l o g   t h e M e s s a g e   b u t t o n s   { " I g n o r e " ,   " D e t a i l s " }   d e f a u l t   b u t t o n   " D e t a i l s "   c a n c e l   b u t t o n   " I g n o r e "   w i t h   t i t l e   t h e T i t l e |  � � � l  g g�� � ���   � > 8if (button returned of theDialogResult) = "Details" then    � � � � p i f   ( b u t t o n   r e t u r n e d   o f   t h e D i a l o g R e s u l t )   =   " D e t a i l s "   t h e n �  � � � l  g g�� � ���   � 6 0set theDetailsDocument to (make new text window)    � � � � ` s e t   t h e D e t a i l s D o c u m e n t   t o   ( m a k e   n e w   t e x t   w i n d o w ) �  � � � l  g g�� � ���   � 2 ,set text of theDetailsDocument to theDetails    � � � � X s e t   t e x t   o f   t h e D e t a i l s D o c u m e n t   t o   t h e D e t a i l s �  � � � l  g g�� � ���   �  end if    � � � �  e n d   i f �  � � � l  g g��������  ��  ��   �  ��� � I  g p�� ���
�� .sysodisAaleR        TEXT � b   g l � � � b   g j � � � o   g h���� 0 
themessage 
theMessage � m   h i � � � � �  
 
 � o   j k���� 0 
thedetails 
theDetails��  ��  ��  ��  ��     � � � l     ��������  ��  ��   �  � � � i     � � � I      �� ����� 	0 split   �  � � � o      ���� 0 str   �  ��� � o      ���� 	0 delim  ��  ��   � k      � �  � � � r      � � � n     � � � 1    ��
�� 
txdl � 1     ��
�� 
ascr � o      ���� 0 savetid saveTID �  � � � r     � � � J    	 � �  ��� � o    ���� 	0 delim  ��   � n      � � � 1   
 ��
�� 
txdl � 1   	 
��
�� 
ascr �  � � � r     � � � n     � � � 2   ��
�� 
citm � o    ���� 0 str   � o      ���� 0 str2   �  � � � r     � � � o    ���� 0 savetid saveTID � n      � � � 1    ��
�� 
txdl � 1    ��
�� 
ascr �  ��� � L     � � o    ���� 0 str2  ��   �  � � � l     ��������  ��  ��   �  � � � i     � � � I      �� ����� 0 join   �  � � � o      ���� 0 str   �  ��� � o      ���� 
0 joiner  ��  ��   � k      � �  � � � r      � � � n     � � � 1    ��
�� 
txdl � 1     ��
�� 
ascr � o      ���� 0 savetid saveTID �  � � � r     � � � J    	 � �  ��� � o    ���� 
0 joiner  ��   � n      � � � 1   
 ��
�� 
txdl � 1   	 
��
�� 
ascr �  � � � r     � � � c     � � � o    ���� 0 str   � m    ��
�� 
TEXT � o      ���� 0 str2   �  � � � r     � � � o    ���� 0 savetid saveTID � n      � � � 1    ��
�� 
txdl � 1    ��
�� 
ascr �  ��� � L     � � o    ���� 0 str2  ��   �  � � � l     ����~��  �  �~   �  ��} � i     � � � I      �|�{�z�| 0 getscriptpath getScriptPath�{  �z   � k     + � �  � � � r     	 � � � c      � � � l     ��y�x � I    �w ��v
�w .earsffdralis        afdr �  f     �v  �y  �x   � m    �u
�u 
alis � o      �t�t 0 
scriptpath 
scriptPath �  � � � r   
  � � � I   
 �s ��r�s 	0 split   �  �  � c     o    �q�q 0 
scriptpath 
scriptPath m    �p
�p 
TEXT  �o m     �  :�o  �r   � o      �n�n 0 
scriptpath 
scriptPath �  r    	 m    

 �  r u n _ h o o k s . r b	 l     �m�l n       4   �k
�k 
cobj m    �j�j�� o    �i�i 0 
scriptpath 
scriptPath�m  �l    r    & I    $�h�g�h 0 join    o    �f�f 0 
scriptpath 
scriptPath �e m      �  :�e  �g   o      �d�d 0 
scriptpath 
scriptPath �c L   ' + c   ' * o   ' (�b�b 0 
scriptpath 
scriptPath m   ( )�a
�a 
alis�c  �}   �                                                                                  R*ch  alis    N  Macintosh HD               �pH+     r
BBEdit.app                                                     �r.���        ����  	                Applications    �V�      ��'X       r  %Macintosh HD:Applications: BBEdit.app    
 B B E d i t . a p p    M a c i n t o s h   H D  Applications/BBEdit.app   / ��     l     �`�_�^�`  �_  �^    �]  l     �\�[�Z�\  �[  �Z  �]       �Y!"#$%�Y  ! �X�W�V�U�X "0 documentdidsave documentDidSave�W 	0 split  �V 0 join  �U 0 getscriptpath getScriptPath" �T �S�R&'�Q�T "0 documentdidsave documentDidSave�S �P(�P (  �O�O 0 doc  �R  & 	�N�M�L�K�J�I�H�G�F�N 0 doc  �M 0 
scriptpath 
scriptPath�L 0 thelanguage theLanguage�K 0 filepath filePath�J 0 
thecommand 
theCommand�I 0 	theresult 	theResult�H 0 
themessage 
theMessage�G 0 
thedetails 
theDetails�F 0 thetitle theTitle' �E�D�C�B 9�A�@ ?�? C�> U `�=�< ��;
�E 
oDsk�D 0 getscriptpath getScriptPath
�C 
SoLn
�B 
file
�A 
psxp
�@ 
strq
�? 
TEXT
�> .sysoexecTEXT���     TEXT�= 	0 split  
�< 
cobj
�; .sysodisAaleR        TEXT�Q u��,e  m*j+ E�O��,E�O��,E�O��,�,%�%��,%�&�%��,�,%E�O�j 
E�O��  hY **��l+ E�O��k/E�O��l/E�O��m/E�O��%�%j Y h# �: ��9�8)*�7�: 	0 split  �9 �6+�6 +  �5�4�5 0 str  �4 	0 delim  �8  ) �3�2�1�0�3 0 str  �2 	0 delim  �1 0 savetid saveTID�0 0 str2  * �/�.�-
�/ 
ascr
�. 
txdl
�- 
citm�7 ��,E�O�kv��,FO��-E�O���,FO�$ �, ��+�*,-�)�, 0 join  �+ �(.�( .  �'�&�' 0 str  �& 
0 joiner  �*  , �%�$�#�"�% 0 str  �$ 
0 joiner  �# 0 savetid saveTID�" 0 str2  - �!� �
�! 
ascr
�  
txdl
� 
TEXT�) ��,E�O�kv��,FO��&E�O���,FO�% � ���/0�� 0 getscriptpath getScriptPath�  �  / �� 0 
scriptpath 
scriptPath0 	����
��
� .earsffdralis        afdr
� 
alis
� 
TEXT� 	0 split  
� 
cobj� 0 join  � ,)j  �&E�O*��&�l+ E�O��i/FO*��l+ E�O��& ascr  ��ޭ