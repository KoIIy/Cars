   M S B A M L   `   `   `  ����M  IRegistrationCarApp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullK*clr-namespace:RegistrationCarApp.View.PageRegistrationCarApp.View.Page  5      7    1RegistrationCarApp.View.Page.SearchCarOnCarNumber   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      <local*clr-namespace:RegistrationCarApp.View.Page     5        N� Title$  SearchCarOnCarNumber��5	       N� 
Background
 �����.��5      �  � ColumnDefinitions 5   
   �� 5      $��9* �6   �� 5      $	��23* �6    � RowDefinitions 5   
   �� 5      �� 5      �� 5      �� 5      .+�5   
   �� $"��/Image/Icon/logo_450x443.png��6   $��2��66   $��	0,0,567,0q�6J   �� 5   
   $>��8Поиск автомобиля по Гос.Номеру��6   $
��Left=�69   $��Center=�6T   $��27(�6o   $��1��6}   $��20.2,33,0,33q�6�   $��46��6�   $	��433��6�   �� 5   
   $��Номер:��6   $��1��6!   $��0��6.   $��Right=�6>   $��Center=�6Z   $��25(�6u   $��2��6�   $��43��6�   $��0,35,567,34.8q�6�   $��93��6�   �� 5   
   $��1��6*   $��1��67    �� 	MaxLength$ 6��6G   $��20.2,31,100,31.8q�6U   $��Center=�6o   $��25(�6�   ��6   �� *Number+6�   �� 5   
   $��Регион:��6   $��2��6"   $��0��6/   $��Right=�6?   $��Center=�6[   $��25(�6v   $��2��6�   $��43��6�   $��0,35.2,567,34.6q�6�   $��96��6�   �� 5   
   $��2��6*   $��1��67   $ 3��6G   $��20.2,31.2,100,31.6q�6U   $��Center=�6q   $��25(�6�   ��6   �� *Region+6�   �� 5   
   $��
Найти��64   $��1��6D   $��Right=�6T   $��Center=�6p   $��0,31.4,100,30.6q�6�   $��3��6�   $	��150��6�   $��50��6�   $��25(�6�   ��6   �� *SearchOnNumber+ � 	Resources 5       �� 
TargetType �� Property �� Value��%_   '��       �� 5      " ��6   .�5      ��  �@��CornerRadius$ 10��65   5       5!      5"      5#      5$      