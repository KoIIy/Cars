   M S B A M L   `   `   `  ����M  IRegistrationCarApp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullO,clr-namespace:RegistrationCarApp.View.WindowRegistrationCarApp.View.Window  5   	   6    0RegistrationCarApp.View.Window.AddMarkOrModelCar   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   >local,clr-namespace:RegistrationCarApp.View.Window     5   	     � Title$<  6Добавление Модели Автомобиля��5   	   $��271.847��6.    � Icon$  /Image/Icon/logo_91x90.png��6?   $��517.595��6a    � WindowStartupLocation$ CenterScreen=�6q    � 
ResizeMode$ NoResize=�6�   .��5	      �  � ColumnDefinitions 5
   
   �� 5      $	��18* �6   �� 5      $	��55* �6    � RowDefinitions 5   
   �� 5      �� 5      �� 5      �� 5      .+�5   
   �� $��Марка:��6   $��0��6!   $��Right=�6.   $��Center=�6J   $��10q�6e   $��15(�6q   $
��Auto��6   $
��Auto��6�   �� 5   
   $��0��6   $��1��6   $��10q�6/   $��Center=�6;   $��15(�6]   ��6k   �� *Mark+�� 5   
   $��Модель:��6   $��1��6"   $��Right=�6/   $��Center=�6K   $��10q�6f   $��15(�6r   $
��Auto��6�   $
��Auto��6�   �� 5   
   $��1��6   $��1��6   $��10q�6/   $��Center=�6;   $��15(�6]   ��6k   �� *Model+�� 5   
   $��Год:��6   $��2��6   $��Right=�6,   $��Center=�6H   $��10q�6c   $��15(�6o   $
��Auto��6}   $
��Auto��6�   �� 5   
   $��2��6   $��1��6   $��10q�6/   $��Center=�6;   $��15(�6]   ��6k   �� *Year+� 5   
   $��2��6   $��3��6#    5      �� 5      �� 5      .+�5       �� $��0��6   $��Отмена��6%   $	��150��66   $��40��6B   ��6N   �� *Cancel+ � 	Resources 5!       �� 
TargetType �� Property	 �� Value��%_   '��       �� 5"      " ��6   .�5#      ��  �@��CornerRadius$	 15��69   5$      5%      5&      �� 5'      $��1��6   $��Добавить��6%   $	��150��68   $��40��6D   ��6P   �� *Add+ 5(      ��%_   '��       �� 5)      " ��6   .�5*      ��  �@��CornerRadius$	 15��69   5+      5,      5-      5/      50      51      