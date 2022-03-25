// ignore_for_file: file_names

import 'bootstrap.dart';

class GestureDetector extends Widget {
  final Key? key;
  Widget child;
  Cursor? cursorType;
  //--------------------------------added
  final VoidCallback? onPressed;
  final VoidCallback? onTap;
  final VoidCallback? onDoubleTap;
  //----------------------------------end
  final VoidCallback? onAbort;
  final VoidCallback? onBeforeCopy;
  final VoidCallback? onBeforeCut;
  final VoidCallback? onBeforePaste;
  final VoidCallback? onBlur;
  final VoidCallback? onClick;
  final VoidCallback? onContextMenu;
  final VoidCallback? onDoubleClick;
  final VoidCallback? onDrag;
  final VoidCallback? onDragEnd;
  final VoidCallback? onDragEnter;
  final VoidCallback? onDragLeave;
  final VoidCallback? onDragOver;
  final VoidCallback? onDragStart;
  final VoidCallback? onDrop;
  final VoidCallback? onError;
  final VoidCallback? onFocus;
  final VoidCallback? onKeyDown;
  final VoidCallback? onKeyPress;
  final VoidCallback? onKeyUp;
  final VoidCallback? onMouseDown;
  final VoidCallback? onMouseEnter;
  final VoidCallback? onMouseLeave;
  final VoidCallback? onMouseMove;
  final VoidCallback? onMouseOut;
  final VoidCallback? onMouseOver;
  final VoidCallback? onMouseUp;
  final VoidCallback? onPaste;
  final VoidCallback? onScroll;
  final VoidCallback? onSubmit;
  final VoidCallback? onTouchCancel;
  final VoidCallback? onTouchEnd;
  final VoidCallback? onTouchMove;
  final VoidCallback? onTouchStart;
  final VoidCallback? onWheel;
  GestureDetector({
    this.key,
    required this.child,
    this.cursorType,
    //added
    this.onPressed,
    this.onTap,
    this.onDoubleTap,
    //
    this.onAbort,
    this.onBeforeCopy,
    this.onBeforeCut,
    this.onBeforePaste,
    this.onBlur,
    this.onClick,
    this.onContextMenu,
    this.onDoubleClick,
    this.onDrag,
    this.onDragEnd,
    this.onDragEnter,
    this.onDragLeave,
    this.onDragOver,
    this.onDragStart,
    this.onDrop,
    this.onError,
    this.onFocus,
    this.onKeyDown,
    this.onKeyPress,
    this.onKeyUp,
    this.onMouseDown,
    this.onMouseEnter,
    this.onMouseLeave,
    this.onMouseMove,
    this.onMouseOut,
    this.onMouseOver,
    this.onMouseUp,
    this.onPaste,
    this.onScroll,
    this.onSubmit,
    this.onTouchCancel,
    this.onTouchEnd,
    this.onTouchMove,
    this.onTouchStart,
    this.onWheel,
  });
  @override
  Element toElement() {
    Element element = Element.span();
    element.children.add(child.toElement());
    if (key != null) {
      element.id = key!.value;
    }
    if (cursorType != null) {
      element.style.cursor = cursorType?.value;
    }

    //---------------Gestures functions
    //--------------------------------------added
    if (onPressed != null) {
      element.onClick.listen((_) => onPressed!());
    }
    if (onTap != null) {
      element.onClick.listen((_) => onTap!());
    }
    if (onDoubleTap != null) {
      element.onDoubleClick.listen((_) => onDoubleTap!());
    }
    // -------------------------------------end
    if (onAbort != null) {
      element.onAbort.listen((_) => onAbort!());
    }
    if (onBeforeCopy != null) {
      element.onBeforeCopy.listen((_) => onBeforeCopy!());
    }
    if (onBeforeCut != null) {
      element.onBeforeCut.listen((_) => onBeforeCut!());
    }
    if (onBeforePaste != null) {
      element.onBeforePaste.listen((_) => onBeforePaste!());
    }
    if (onBlur != null) {
      element.onBlur.listen((_) => onBlur!());
    }
    if (onClick != null) {
      element.onClick.listen((_) => onClick!());
    }
    if (onContextMenu != null) {
      element.onContextMenu.listen((_) => onContextMenu!());
    }
    if (onDoubleClick != null) {
      element.onDoubleClick.listen((_) => onDoubleClick!());
    }
    if (onDrag != null) {
      element.onDrag.listen((_) => onDrag!());
    }
    if (onDragEnd != null) {
      element.onDragEnd.listen((_) => onDragEnd!());
    }
    if (onDragEnter != null) {
      element.onDragEnter.listen((_) => onDragEnter!());
    }
    if (onDragLeave != null) {
      element.onDragLeave.listen((_) => onDragLeave!());
    }
    if (onDragOver != null) {
      element.onDragOver.listen((_) => onDragOver!());
    }
    if (onDragStart != null) {
      element.onDragStart.listen((_) => onDragStart!());
    }
    if (onDrop != null) {
      element.onDrop.listen((_) => onDrop!());
    }
    if (onError != null) {
      element.onError.listen((_) => onError!());
    }
    if (onFocus != null) {
      element.onFocus.listen((_) => onFocus!());
    }
    if (onKeyDown != null) {
      element.onKeyDown.listen((_) => onKeyDown!());
    }
    if (onKeyPress != null) {
      element.onKeyPress.listen((_) => onKeyPress!());
    }
    if (onKeyUp != null) {
      element.onKeyUp.listen((_) => onKeyUp!());
    }
    if (onMouseDown != null) {
      element.onMouseDown.listen((_) => onMouseDown!());
    }
    if (onMouseEnter != null) {
      element.onMouseEnter.listen((_) => onMouseEnter!());
    }
    if (onMouseLeave != null) {
      element.onMouseLeave.listen((_) => onMouseLeave!());
    }
    if (onMouseMove != null) {
      element.onMouseMove.listen((_) => onMouseMove!());
    }
    if (onMouseOut != null) {
      element.onMouseOut.listen((_) => onMouseOut!());
    }
    if (onMouseOver != null) {
      element.onMouseOver.listen((_) => onMouseOver!());
    }
    if (onMouseUp != null) {
      element.onMouseUp.listen((_) => onMouseUp!());
    }
    if (onPaste != null) {
      element.onPaste.listen((_) => onPaste!());
    }
    if (onScroll != null) {
      element.onScroll.listen((_) => onScroll!());
    }
    if (onSubmit != null) {
      element.onSubmit.listen((_) => onSubmit!());
    }
    if (onTouchCancel != null) {
      element.onTouchCancel.listen((_) => onTouchCancel!());
    }
    if (onTouchEnd != null) {
      element.onTouchEnd.listen((_) => onTouchEnd!());
    }
    if (onTouchMove != null) {
      element.onTouchMove.listen((_) => onTouchMove!());
    }
    if (onTouchStart != null) {
      element.onTouchStart.listen((_) => onTouchStart!());
    }
    if (onWheel != null) {
      element.onWheel.listen((_) => onWheel!());
    }
    return element;
  }
}

class Cursor {
  final String value;
  const Cursor(this.value);
}

class Cursors {
  static const Cursor defaultCursor = Cursor('default');
  static const Cursor pointer = Cursor('pointer');
  static const Cursor text = Cursor('text');
  static const Cursor move = Cursor('move');
  static const Cursor notAllowed = Cursor('not-allowed');
  static const Cursor help = Cursor('help');
  static const Cursor wait = Cursor('wait');
  static const Cursor cell = Cursor('cell');
  static const Cursor crosshair = Cursor('crosshair');
  static const Cursor colResize = Cursor('col-resize');
  static const Cursor contextMenu = Cursor('context-menu');
  static const Cursor copy = Cursor('copy');
  static const Cursor alias = Cursor('alias');
  static const Cursor eResize = Cursor('e-resize');
  static const Cursor nResize = Cursor('n-resize');
  static const Cursor neResize = Cursor('ne-resize');
  static const Cursor nwResize = Cursor('nw-resize');
  static const Cursor rowResize = Cursor('row-resize');
  static const Cursor sResize = Cursor('s-resize');
  static const Cursor seResize = Cursor('se-resize');
  static const Cursor swResize = Cursor('sw-resize');
  static const Cursor wResize = Cursor('w-resize');
  static const Cursor verticalText = Cursor('vertical-text');
  static const Cursor ewResize = Cursor('ew-resize');
  static const Cursor neswResize = Cursor('nesw-resize');
  static const Cursor nsResize = Cursor('ns-resize');
  static const Cursor nwseResize = Cursor('nwse-resize');
  static const Cursor zoomIn = Cursor('zoom-in');
  static const Cursor zoomOut = Cursor('zoom-out');
}
