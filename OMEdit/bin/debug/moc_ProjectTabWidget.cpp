/****************************************************************************
** Meta object code from reading C++ file 'ProjectTabWidget.h'
**
** Created: Fri 1. Oct 22:55:02 2010
**      by: The Qt Meta Object Compiler version 62 (Qt 4.7.0)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../OMEditGUI/ProjectTabWidget.h"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'ProjectTabWidget.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 62
#error "This file was generated using the moc from 4.7.0. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_GraphicsScene[] = {

 // content:
       5,       // revision
       0,       // classname
       0,    0, // classinfo
       0,    0, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

       0        // eod
};

static const char qt_meta_stringdata_GraphicsScene[] = {
    "GraphicsScene\0"
};

const QMetaObject GraphicsScene::staticMetaObject = {
    { &QGraphicsScene::staticMetaObject, qt_meta_stringdata_GraphicsScene,
      qt_meta_data_GraphicsScene, 0 }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &GraphicsScene::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *GraphicsScene::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *GraphicsScene::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_GraphicsScene))
        return static_cast<void*>(const_cast< GraphicsScene*>(this));
    return QGraphicsScene::qt_metacast(_clname);
}

int GraphicsScene::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QGraphicsScene::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
static const uint qt_meta_data_GraphicsView[] = {

 // content:
       5,       // revision
       0,       // classname
       0,    0, // classinfo
       5,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // slots: signature, parameters, type, tag, flags
      25,   14,   13,   13, 0x0a,
      60,   13,   13,   13, 0x0a,
      72,   13,   13,   13, 0x0a,
      81,   13,   13,   13, 0x0a,
     101,   91,   13,   13, 0x0a,

       0        // eod
};

static const char qt_meta_stringdata_GraphicsView[] = {
    "GraphicsView\0\0pComponent\0"
    "addConnector(ComponentAnnotation*)\0"
    "resetZoom()\0zoomIn()\0zoomOut()\0showLines\0"
    "showGridLines(bool)\0"
};

const QMetaObject GraphicsView::staticMetaObject = {
    { &QGraphicsView::staticMetaObject, qt_meta_stringdata_GraphicsView,
      qt_meta_data_GraphicsView, 0 }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &GraphicsView::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *GraphicsView::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *GraphicsView::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_GraphicsView))
        return static_cast<void*>(const_cast< GraphicsView*>(this));
    return QGraphicsView::qt_metacast(_clname);
}

int GraphicsView::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QGraphicsView::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        switch (_id) {
        case 0: addConnector((*reinterpret_cast< ComponentAnnotation*(*)>(_a[1]))); break;
        case 1: resetZoom(); break;
        case 2: zoomIn(); break;
        case 3: zoomOut(); break;
        case 4: showGridLines((*reinterpret_cast< bool(*)>(_a[1]))); break;
        default: ;
        }
        _id -= 5;
    }
    return _id;
}
static const uint qt_meta_data_ProjectTab[] = {

 // content:
       5,       // revision
       0,       // classname
       0,    0, // classinfo
       2,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // slots: signature, parameters, type, tag, flags
      12,   11,   11,   11, 0x0a,
      32,   11,   11,   11, 0x0a,

       0        // eod
};

static const char qt_meta_stringdata_ProjectTab[] = {
    "ProjectTab\0\0showModelicaModel()\0"
    "showModelicaText()\0"
};

const QMetaObject ProjectTab::staticMetaObject = {
    { &QWidget::staticMetaObject, qt_meta_stringdata_ProjectTab,
      qt_meta_data_ProjectTab, 0 }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &ProjectTab::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *ProjectTab::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *ProjectTab::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_ProjectTab))
        return static_cast<void*>(const_cast< ProjectTab*>(this));
    return QWidget::qt_metacast(_clname);
}

int ProjectTab::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QWidget::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        switch (_id) {
        case 0: showModelicaModel(); break;
        case 1: showModelicaText(); break;
        default: ;
        }
        _id -= 2;
    }
    return _id;
}
static const uint qt_meta_data_ProjectTabWidget[] = {

 // content:
       5,       // revision
       0,       // classname
       0,    0, // classinfo
       9,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // slots: signature, parameters, type, tag, flags
      37,   18,   17,   17, 0x0a,
      83,   72,   17,   17, 0x2a,
     133,  110,   17,   17, 0x0a,
     178,  172,  167,   17, 0x0a,
     199,   17,  167,   17, 0x0a,
     221,   17,   17,   17, 0x0a,
     233,   17,   17,   17, 0x0a,
     245,   17,   17,   17, 0x0a,
     254,   17,   17,   17, 0x0a,

       0        // eod
};

static const char qt_meta_stringdata_ProjectTabWidget[] = {
    "ProjectTabWidget\0\0projectTab,tabName\0"
    "addProjectTab(ProjectTab*,QString)\0"
    "projectTab\0addProjectTab(ProjectTab*)\0"
    "tabName,modelStructure\0"
    "addNewProjectTab(QString,QString)\0"
    "bool\0index\0closeProjectTab(int)\0"
    "closeAllProjectTabs()\0loadModel()\0"
    "resetZoom()\0zoomIn()\0zoomOut()\0"
};

const QMetaObject ProjectTabWidget::staticMetaObject = {
    { &QTabWidget::staticMetaObject, qt_meta_stringdata_ProjectTabWidget,
      qt_meta_data_ProjectTabWidget, 0 }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &ProjectTabWidget::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *ProjectTabWidget::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *ProjectTabWidget::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_ProjectTabWidget))
        return static_cast<void*>(const_cast< ProjectTabWidget*>(this));
    return QTabWidget::qt_metacast(_clname);
}

int ProjectTabWidget::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QTabWidget::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        switch (_id) {
        case 0: addProjectTab((*reinterpret_cast< ProjectTab*(*)>(_a[1])),(*reinterpret_cast< QString(*)>(_a[2]))); break;
        case 1: addProjectTab((*reinterpret_cast< ProjectTab*(*)>(_a[1]))); break;
        case 2: addNewProjectTab((*reinterpret_cast< QString(*)>(_a[1])),(*reinterpret_cast< QString(*)>(_a[2]))); break;
        case 3: { bool _r = closeProjectTab((*reinterpret_cast< int(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< bool*>(_a[0]) = _r; }  break;
        case 4: { bool _r = closeAllProjectTabs();
            if (_a[0]) *reinterpret_cast< bool*>(_a[0]) = _r; }  break;
        case 5: loadModel(); break;
        case 6: resetZoom(); break;
        case 7: zoomIn(); break;
        case 8: zoomOut(); break;
        default: ;
        }
        _id -= 9;
    }
    return _id;
}
QT_END_MOC_NAMESPACE
