   M S B A M L   `   `   `  ����M  IRegistrationCarApp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullK*clr-namespace:RegistrationCarApp.View.PageRegistrationCarApp.View.Page  5      7    1RegistrationCarApp.View.Page.SearchCarOnVinNumber   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      <local*clr-namespace:RegistrationCarApp.View.Page     5        N� Title$  SearchCarOnVinNumber��5	       N� 
Background
 �����.��5      �  � ColumnDefinitions 5   
   �� 5      $��9* �6   �� 5      $	��23* �6    � RowDefinitions 5   
   �� 5      �� 5      �� 5      �� 5      .+�5   
   �� $"��/Image/Icon/logo_450x443.png��6   $��2��66   $��	0,0,567,0q�6J   �� 5   
   $;��5Поиск автомобиля по VIN Номеру��6   $
��Left=�69   $��Center=�6T   $��27(�6o   $��1��6}   $��20.2,33,0,33q�6�   $��46��6�   $	��491��6�   �� 5   
   $��2��6   $��VIN номер:��6!   $��1��66   $��0��6C   $��Right=�6S   $��Center=�6o   $��25(�6�   $��2��6�   $��43��6�   $��0,91,567,91.6q�6�   $	��136��6�   �� 5   
   $��2��6   $��50��6>   $��1��6J   $��1��6W   $��20.2,31,100,31.8q�6h   $��Center=�6�   $��25(�6�   ��6#   �� *	VinNumber+6�   �� 5   
   $��
Найти��67   $��1��6G   $��Right=�6W   $��Center=�6s   $��0,31.4,100,30.6q�6�   $��3��6�   $	��150��6�   $��50��6�   $��25(�6�   ��6   �� *SearchOnVinNumber+ � 	Resources 5       �� 
TargetType �� Property �� Value��%_   '��       �� 5      " ��6   .�5      ��  �@��CornerRadius$ 10��65   5      5       5!      5"      5#      