GDPC                0                                                                         \   res://.godot/exported/133200997/export-13b65e6c11de6e0a4e0a57cd5d4bc6af-TextureDownload.scn �-      <      _�d�{�+c�^����X�    P   res://.godot/exported/133200997/export-bcb0d2eb5949c52b6a65bfe9de3e985b-Main.scn 	      ,      |�7g��1:�DS�T�վ    ,   res://.godot/global_script_class_cache.cfg  2      �       �>Ĺ��3=�&���       res://.godot/uid_cache.bin  �2      d       [��u0�(4U`��o�       res://Default.theme         w      �޽���Q��؞9��       res://Downloader.gd �      �      y69���l�82�+       res://Header.gd p      �       ��"Y:�H�C�       res://LerpMatch.gd  0      �       u%��6Ӫ�{�I�       res://Main.tscn.remap   01      a       3 J�M�B�b��}�       res://TabSelect.gd  P%      C      y��0fOMX4+�1�       res://TextureDownload.gd�'      J      ����PjZ �2�&?>\        res://TextureDownload.tscn.remap�1      l       pL�$��Q6>Bz˩       res://project.binary 3      �      ��Y�!�7�>�a��s                RSCC      Q  _  (�/�`Q� vV?@o���B'����������M
��"r��vkDn��w7�t�7k��V�Uu�Z�=*�P�= @ ? �c�ubJ��6\�?�*%�B��m���>�P��5��/ᎃP�8�?�URO��5�g����ek�X� �)�2��0~�A}��K����X���~�bU���q�B���O��v/G���q1�i��%�b}&��)�M�5Nl��M�� 7җ3��~TF�&��8�K��r-�ն�p��`NFHF"@؄x��ʊ�KG�
)ThX 4��@�Ϥ��М���(��kTTXhPPLXb�k��F��G.�@�x%U��4|V�d�����u�ѵ���QX�
�P!�
�`�T�	V�Q�2�g�d���Q&t� ��|�>w:01u�� �G� ��n$�Q����`<I �W�쳚D�f���9��A`b��|�_o��^m�eb�?�D�Y�j�3I��(�ֱn�<	�r���|�G�0j���)�b*.Nu�����t��9B����a��2XN-,Fj�����_��L^G��T� ��݇8����0��y%0J�}}�C�ޕn[�?V�6A?
�RSCC         @tool
extends HTTPRequest

var DownloadQueue : Array[Dictionary]
var ItemInProgress : Dictionary = {}

var SuccessfulDownloads : Dictionary = {}

func _ready():
	request_completed.connect(finish_download)

func _process(delta):
	if ItemInProgress.is_empty():
		if len(DownloadQueue) > 0:
			try_download(DownloadQueue.pop_front())

func try_download(item : Dictionary):
	if !item.Force:
		var Existing : PackedByteArray = SuccessfulDownloads.get(item.URL, [])
		if !Existing.is_empty():
			item.Method.call("Success", Existing)
			return
	ItemInProgress = item
	var Err : int = request(item.URL)
	if Err != OK:
		print("HTTPS Request Error. [%s]" % error_string(Err))

func finish_download(result, responseCode, headers, body):
	if result == HTTPRequest.RESULT_SUCCESS:
		ItemInProgress.Method.call("Success", body)
		SuccessfulDownloads[ItemInProgress.URL] = body
	else:
		ItemInProgress.Method.call("Failure", body)
	ItemInProgress = {}

func queue_download(url : String, method : Callable, force : bool = false):
	if !force:
		var Existing : PackedByteArray = SuccessfulDownloads.get(url, [])
		if !Existing.is_empty():
			method.call("Success", Existing)
			return
	
	DownloadQueue.append({
		"URL" : url,
		"Method": method,
		"Force": force,
	})
            extends Panel

@export var MoveDist : float = 90
@export var Scroll : ScrollContainer

func _process(delta):
	position.y = lerpf(position.y, -minf(Scroll.scroll_vertical, MoveDist), 0.2)
     extends Control

@export var Match : Control
@export_range(0.01,1,0.01) var LerpSpeed : float = 0.2

func _process(delta):
	global_position = global_position.lerp(Match.global_position, LerpSpeed)
	size = size.lerp(Match.size, LerpSpeed)
  RSRC                    PackedScene            ��������                                            -      ..    ScrollContainer    HBox    HomeButton    GamesButton 
   ExpButton    VBox    FooterSpacer    resource_local_to_scene    resource_name    line_spacing    font 
   font_size    font_color    outline_size    outline_color    shadow_size    shadow_color    shadow_offset    script    content_margin_left    content_margin_top    content_margin_right    content_margin_bottom 	   bg_color    draw_center    skew    border_width_left    border_width_top    border_width_right    border_width_bottom    border_color    border_blend    corner_radius_top_left    corner_radius_top_right    corner_radius_bottom_right    corner_radius_bottom_left    corner_detail    expand_margin_left    expand_margin_top    expand_margin_right    expand_margin_bottom    anti_aliasing    anti_aliasing_size 	   _bundled       Script    res://Header.gd ��������   Script    res://TabSelect.gd ��������   Script    res://LerpMatch.gd ��������      local://LabelSettings_m8tsd �         local://StyleBoxFlat_ejssy �         local://PackedScene_hwwfa 6         LabelSettings          (            StyleBoxFlat                                 ��g?  �?  �?*                   PackedScene    ,      	         names "   J      View    layout_mode    anchors_preset    anchor_right    anchor_bottom    grow_horizontal    grow_vertical    Control    ScrollContainer    follow_focus    horizontal_scroll_mode    VBox    size_flags_horizontal    size_flags_vertical    VBoxContainer    HeaderSpacer    custom_minimum_size    Margin %   theme_override_constants/margin_left $   theme_override_constants/margin_top &   theme_override_constants/margin_right '   theme_override_constants/margin_bottom    MarginContainer 	   CoreText    focus_mode    bbcode_enabled    text    fit_content    scroll_active    selection_enabled    deselect_on_focus_loss_enabled    visible_characters_behavior    RichTextLabel    FooterSpacer    Header    offset_right    offset_bottom    script    Scroll    Panel    Label    label_settings    horizontal_alignment 
   TabSelect    mouse_filter    theme_override_styles/panel    Buttons    self_modulate    show_behind_parent    offset_top    HBox    anchor_top 
   alignment    HBoxContainer    HomeButton    toggle_mode    button_pressed    flat    Button    GamesButton 
   ExpButton    Footer    Match $   theme_override_constants/separation    size_flags_stretch_ratio 
   EmailLink 
   underline    uri    LinkButton    TwitterLink    BlueskyLink    GithubLink    ItchioLink    LinkedInLink    	   variants    6                    �?                         
         �B         �  [center][font_size=24][b][u]
TITLE 1
[/u][/b][/font_size]
Paragraph 1 Blah Blah Blah Blah Blah Blah Blah Blah Blah...
Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah...
Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah...
Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah...
Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah...
Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah...
Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah...
Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah...
[font_size=24][b][u]
TITLE 2
[/u][/b][/font_size]
Paragraph 2 Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah...
Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah...
Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah...
Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah...
Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah...
Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah...
Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah...
Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah...
[font_size=24][b][u]
TITLE 3
[/u][/b][/font_size]
Paragraph 3 Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah...
Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah...
Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah...
Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah...
Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah...
Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah...
Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah...
Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah...

        
          B   
         �     �B                          
   Jay Sharp                �B      B                                                                                       ��S?     �@     ��           ��      Home       Games       Experiments      D     �D     "D                                 �A      
         �A         Y   [left][rainbow freq=0.1 sat=0.3][wave amp=25 freq=7][font_size=10]  Site Developed by Me             Email       mailto:jaysharp.lee@gmail.com       Twitter / X       https://x.com/DorcatDev       Bluesky    ,   https://bsky.app/profile/dorcat.bsky.social       GitHub       https://github.com/Jay-Dorcat       Itch.io       https://dorcat.itch.io    	   LinkedIn       node_count             nodes     �  ��������       ����                                                          ����                                       	      
                       ����                                        ����                                ����                                                   ����	                        	            
            
                       !   ����                           '   "   ����	                           #      $            %      &  @              (   (   ����
                                                   )      *                 '   +   ����         #      $      ,      -      %      .  @       	       '   '   ����
   /      0                              1      $                             5   2   ����	               3                  1                  4                 :   6   ����               7      8            9                 :   ;   ����               7            9                 :   <   ����               7            9                  '   =   ����         1       #   !   $   "   %   #   >  @$              5   2   ����                           $   %         ?   &   4                     (   ����      '                   (   @               )      
              D   A   ����            *      (      +   B      C   ,              D   E   ����            *      (      -   B      C   .              D   F   ����            *      (      /   B      C   0              D   G   ����            *      (      1   B      C   2              D   H   ����            *      (      3   B      C   4              D   I   ����            *      (      5   B                conn_count              conns               node_paths              editable_instances              version             RSRC    extends Panel

@export var Buttons : Array[Button]
var ActiveButton : Button

func _ready():
	var ButtonG := ButtonGroup.new()
	for i in Buttons:
		i.button_group = ButtonG
	ButtonG.pressed.connect(set_button)
	ActiveButton = Buttons[0]
	await get_tree().process_frame
	global_position = ActiveButton.global_position
	size = ActiveButton.size

func set_button(newButton : Button):
	ActiveButton = newButton

func _process(delta):
	position = position.lerp(ActiveButton.global_position - get_parent().global_position, 0.3)
	size = size.lerp(ActiveButton.size + Vector2(0,5), 0.3)
             extends TextureRect
class_name TextureDownload

const DL_SOURCE : String = "https://raw.githubusercontent.com/Jay-Dorcat/HTMLImages/main/Portfolio/"

@export var DownloadFile : String = ".png"
@export var MaxAttempts : int = 3

@export var Colour1 : Color
@export var Colour2 : Color
var Attempt : int = 0

var Downloaded : bool = false
var DrawLoop : float = 0.0

func _ready():
	Downloader.queue_download(DL_SOURCE + DownloadFile, download_response)

func _process(delta):
	if !Downloaded:
		queue_redraw()
		DrawLoop += delta * 0.5
		if DrawLoop > 1.0:
			DrawLoop -= 1.0

func download_response(code : String, result : PackedByteArray):
	match code:
		"Failure":
			Attempt += 1
			print("Att.%s Failure." % Attempt)
			if Attempt < MaxAttempts:
				Downloader.queue_download(DL_SOURCE + DownloadFile, download_response, true)
		"Success":
			var Img := Image.new()
			var Err : int = Img.load_png_from_buffer(result)
			if Err != OK:
				Attempt += 1
				print("Att.%s Image Load Error. [%s]" % [Attempt, error_string(Err)])
				if Attempt < MaxAttempts:
					Downloader.queue_download(DL_SOURCE + DownloadFile, download_response, true)
			else:
				Downloaded = true
				texture = ImageTexture.create_from_image(Img)
				queue_redraw()

func _draw():
	if Downloaded:
		return
	if DrawLoop < 0.5:
		draw_rect(Rect2(0,0,size.x,size.y), Colour1)
		var Percent : float = DrawLoop * 2.0
		draw_rect(Rect2(Vector2(), size * Percent), Colour2)
	else:
		draw_rect(Rect2(0,0,size.x,size.y), Colour2)
		var Percent : float = (DrawLoop - 0.5) * 2.0
		draw_rect(Rect2(size * (1 - Percent), size * Percent), Colour1)
      RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script       Script    res://TextureDownload.gd ��������      local://PackedScene_00xqr          PackedScene          	         names "         TextureDownload    offset_right    offset_bottom    script    DownloadFile    Colour1    Colour2    TextureRect    	   variants             B                SpringCat.png    ��d>��p>���>  �?   ���>���>���>  �?      node_count             nodes        ��������       ����                                                   conn_count              conns               node_paths              editable_instances              version             RSRC    [remap]

path="res://.godot/exported/133200997/export-bcb0d2eb5949c52b6a65bfe9de3e985b-Main.scn"
               [remap]

path="res://.godot/exported/133200997/export-13b65e6c11de6e0a4e0a57cd5d4bc6af-TextureDownload.scn"
    list=Array[Dictionary]([{
"base": &"TextureRect",
"class": &"TextureDownload",
"icon": "",
"language": &"GDScript",
"path": "res://TextureDownload.gd"
}])
        ���`Qi   res://Default.theme=q ��S   res://Main.tscn�VA�j�Q%   res://TextureDownload.tscn            ECFG
      application/config/name      	   Portfolio      application/run/main_scene         res://Main.tscn    application/config/features(   "         4.1    GL Compatibility       autoload/Downloader         *res://Downloader.gd)   display/window/size/initial_position_type            editor_plugins/enabled8   "      *   res://addons/coi_serviceworker/plugin.cfg      gui/theme/custom         res://Default.theme #   rendering/renderer/rendering_method         gl_compatibility*   rendering/renderer/rendering_method.mobile         gl_compatibility2   rendering/environment/defaults/default_clear_color      ���=���=���=  �?           