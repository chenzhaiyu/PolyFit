#-------------------------------------------------
#
# Project created by QtCreator 2014-11-28T00:30:46
#
#-------------------------------------------------

CONFIG -= qt

TARGET = math
TEMPLATE = lib

DEFINES += MATH_EXPORTS
win32 { DEFINES += WIN32 WIN64 }

CONFIG(debug, debug|release) { DEFINES += _DEBUG }
CONFIG(release, debug|release) { DEFINES += NDEBUG }

QMAKE_CXXFLAGS += -std=c++11  # for unordered_map


SOURCES += \
    math_types.cpp \
    polygon2d.cpp \
    principal_axes.cpp \
    quaternion.cpp \
    semi_definite_symmetric_eigen.cpp \
    linear_program_solver.cpp \
    linear_program_solver_CBC.cpp \
    linear_program_solver_GLPK.cpp \
    linear_program_solver_LPSOLVE.cpp \
    linear_program_solver_SCIP.cpp \
    linear_program_solver_GUROBI.cpp


HEADERS += \
    box.h \
    line.h \
    math_common.h \
    math_types.h \
    matrix.h \
    plane.h \
    polygon2d.h \
    principal_axes.h \
    quaternion.h \
    semi_definite_symmetric_eigen.h \
    vecg.h \
    linear_program.h \
    linear_program_solver.h

INCLUDEPATH += . \
#    $$quote($(CGAL_DIR)/include) \
#    $$quote($(CGAL_DIR)/include) \
     $$PWD/../3rd_scip/scip \
     $$quote($(GUROBI_DIR)/include)

DEPENDPATH += . \
     $$quote($(GUROBI_DIR)/include)



unix:!symbian {
    maemo5 {
        target.path = /opt/usr/lib
    } else {
        target.path = /usr/lib
    }
    INSTALLS += target
}



win32:CONFIG(release, debug|release): LIBS += -L$$OUT_PWD/../basic/release/ -lbasic
else:win32:CONFIG(debug, debug|release): LIBS += -L$$OUT_PWD/../basic/debug/ -lbasic
else:unix: LIBS += -L$$OUT_PWD/../basic/ -lbasic

INCLUDEPATH += $$PWD/../basic
DEPENDPATH += $$PWD/../basic



    # Gurobi


#QMAKE_CXXFLAGS += -stdlib=libc++
#QMAKE_CXXFLAGS += -stdlib=libstdc++

#QMAKE_MACOSX_DEPLOYMENT_TARGET = 10.11  # seems it does not work with higher version macOS?

macx: LIBS += -L$$PWD/../../../../../../Library/gurobi800/mac64/lib/ -lgurobi_stdc++

INCLUDEPATH += $$PWD/../../../../../../Library/gurobi800/mac64/include
DEPENDPATH += $$PWD/../../../../../../Library/gurobi800/mac64/include

macx: PRE_TARGETDEPS += $$PWD/../../../../../../Library/gurobi800/mac64/lib/libgurobi_stdc++.a

win32:CONFIG(release, debug|release): LIBS += -L$$OUT_PWD/../3rd_lpsolve/release/ -l3rd_lpsolve
else:win32:CONFIG(debug, debug|release): LIBS += -L$$OUT_PWD/../3rd_lpsolve/debug/ -l3rd_lpsolve
else:unix: LIBS += -L$$OUT_PWD/../3rd_lpsolve/ -l3rd_lpsolve

INCLUDEPATH += $$PWD/../3rd_lpsolve
DEPENDPATH += $$PWD/../3rd_lpsolve

win32-g++:CONFIG(release, debug|release): PRE_TARGETDEPS += $$OUT_PWD/../3rd_lpsolve/release/lib3rd_lpsolve.a
else:win32-g++:CONFIG(debug, debug|release): PRE_TARGETDEPS += $$OUT_PWD/../3rd_lpsolve/debug/lib3rd_lpsolve.a
else:win32:!win32-g++:CONFIG(release, debug|release): PRE_TARGETDEPS += $$OUT_PWD/../3rd_lpsolve/release/3rd_lpsolve.lib
else:win32:!win32-g++:CONFIG(debug, debug|release): PRE_TARGETDEPS += $$OUT_PWD/../3rd_lpsolve/debug/3rd_lpsolve.lib
else:unix: PRE_TARGETDEPS += $$OUT_PWD/../3rd_lpsolve/lib3rd_lpsolve.a

win32:CONFIG(release, debug|release): LIBS += -L$$OUT_PWD/../3rd_scip/scip/release/ -l3rd_scip
else:win32:CONFIG(debug, debug|release): LIBS += -L$$OUT_PWD/../3rd_scip/scip/debug/ -l3rd_scip
else:unix: LIBS += -L$$OUT_PWD/../3rd_scip/scip/ -l3rd_scip

INCLUDEPATH += $$PWD/../3rd_scip/scip
DEPENDPATH += $$PWD/../3rd_scip/scip

win32-g++:CONFIG(release, debug|release): PRE_TARGETDEPS += $$OUT_PWD/../3rd_scip/scip/release/lib3rd_scip.a
else:win32-g++:CONFIG(debug, debug|release): PRE_TARGETDEPS += $$OUT_PWD/../3rd_scip/scip/debug/lib3rd_scip.a
else:win32:!win32-g++:CONFIG(release, debug|release): PRE_TARGETDEPS += $$OUT_PWD/../3rd_scip/scip/release/3rd_scip.lib
else:win32:!win32-g++:CONFIG(debug, debug|release): PRE_TARGETDEPS += $$OUT_PWD/../3rd_scip/scip/debug/3rd_scip.lib
else:unix: PRE_TARGETDEPS += $$OUT_PWD/../3rd_scip/scip/lib3rd_scip.a

win32:CONFIG(release, debug|release): LIBS += -L$$OUT_PWD/../3rd_glpk/release/ -l3rd_glpk
else:win32:CONFIG(debug, debug|release): LIBS += -L$$OUT_PWD/../3rd_glpk/debug/ -l3rd_glpk
else:unix: LIBS += -L$$OUT_PWD/../3rd_glpk/ -l3rd_glpk

INCLUDEPATH += $$PWD/../3rd_glpk
DEPENDPATH += $$PWD/../3rd_glpk

win32-g++:CONFIG(release, debug|release): PRE_TARGETDEPS += $$OUT_PWD/../3rd_glpk/release/lib3rd_glpk.a
else:win32-g++:CONFIG(debug, debug|release): PRE_TARGETDEPS += $$OUT_PWD/../3rd_glpk/debug/lib3rd_glpk.a
else:win32:!win32-g++:CONFIG(release, debug|release): PRE_TARGETDEPS += $$OUT_PWD/../3rd_glpk/release/3rd_glpk.lib
else:win32:!win32-g++:CONFIG(debug, debug|release): PRE_TARGETDEPS += $$OUT_PWD/../3rd_glpk/debug/3rd_glpk.lib
else:unix: PRE_TARGETDEPS += $$OUT_PWD/../3rd_glpk/lib3rd_glpk.a
