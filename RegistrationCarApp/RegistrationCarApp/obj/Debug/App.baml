   M S B A M L   `   `   `  ����M  IRegistrationCarApp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null7 clr-namespace:RegistrationCarAppRegistrationCarApp  5          RegistrationCarApp.App   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      2local clr-namespace:RegistrationCarApp     5        �� 	Resources  5         TextBox.Static.Border �� Color  TextBox.MouseOver.Border  TextBox.Focus.Border  TextBoxStyle1 �� 
TargetType �� Property �� Value-  'System.Windows.Input.KeyboardNavigation �� 
TargetType ��Name J� SnapsToDevicePixels ��Name	 �� Triggers
 P� Property P� Value �� 
TargetName �� Triggers ]� 
Conditions �� Property �� Value��%�  &	        &	 #     &	 F     &	 i     7   7  7  �� 5   
   $ 	#FFABAdB3��68   �� 5	   
   $ 	#FF7EB4EA��6;   �� 5
   
   $ 	#FF569DE5��67   �� 5   
   " ��6&   .�5      ��  � ��# � ��6+   �� 5       � ��8   6,   �� 5       � ��# � ��6+   �� 5       � ��$ 1q�60   �� 5       �@ TabNavigation$
 None=�6A   �� 5       � ��$
 Left=�6;   �� 5       �@�FocusVisualStyle 61   Z� �� 5       �@J�	AllowDrop . 6*   �� 5       �@��PanningMode$ VerticalFirst=�69   �� 5       �@��IsFlicksEnabled .  67   �� 5       � �� 5      �� 5      " ��6&   .R�5      �� $ border��6!   #��z��61   #��z��6]   #��z��6�    . ._�5      �� $ PART_ContentHost��6+   |�.  $��Hidden=�6W   $��Hidden=�6~   5      	 5      P� 5      
 � {� .  . �5   "   �� $ border��6<    �@J�Opacity$
 0.56Q�6P   5      P� 5       
 �@J�IsMouseOver . . �5!   "   �� $ border��6@   8   � ��6T   5"      P� 5#      
 �@J�IsKeyboardFocused . . �5$   "   �� $ border��6@   8   � ��6T   5%      5'      5)       5*      ]� 5+       5,      �� 5-      + �@��#IsInactiveSelectionHighlightEnabled . 6S   �� 5.       �@��IsSelectionActive .  6A   ./�50      ��  �@��SelectionBrush# � /�67   51      53      55      56      