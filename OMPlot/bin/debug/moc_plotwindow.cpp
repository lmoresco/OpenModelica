/****************************************************************************
** Meta object code from reading C++ file 'plotwindow.h'
**
** Created: Thu 3. Mar 17:08:23 2011
**      by: The Qt Meta Object Compiler version 62 (Qt 4.7.0)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../OMPlotGUI/plotwindow.h"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'plotwindow.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 62
#error "This file was generated using the moc from 4.7.0. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_PlotWindow[] = {

 // content:
       5,       // revision
       0,       // classname
       0,    0, // classinfo
       6,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // slots: signature, parameters, type, tag, flags
      12,   11,   11,   11, 0x0a,
      33,   11,   11,   11, 0x0a,
      53,   11,   11,   11, 0x0a,
      70,   11,   11,   11, 0x0a,
      79,   11,   11,   11, 0x0a,
      93,   11,   11,   11, 0x0a,

       0        // eod
};

static const char qt_meta_stringdata_PlotWindow[] = {
    "PlotWindow\0\0enableZoomMode(bool)\0"
    "enablePanMode(bool)\0exportDocument()\0"
    "setLog()\0setGrid(bool)\0setOriginal()\0"
};

const QMetaObject PlotWindow::staticMetaObject = {
    { &QMainWindow::staticMetaObject, qt_meta_stringdata_PlotWindow,
      qt_meta_data_PlotWindow, 0 }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &PlotWindow::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *PlotWindow::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *PlotWindow::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_PlotWindow))
        return static_cast<void*>(const_cast< PlotWindow*>(this));
    return QMainWindow::qt_metacast(_clname);
}

int PlotWindow::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QMainWindow::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        switch (_id) {
        case 0: enableZoomMode((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 1: enablePanMode((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 2: exportDocument(); break;
        case 3: setLog(); break;
        case 4: setGrid((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 5: setOriginal(); break;
        default: ;
        }
        _id -= 6;
    }
    return _id;
}
QT_END_MOC_NAMESPACE
