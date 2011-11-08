/* Everything */


/* License information */
#define QT_PRODUCT_LICENSEE "Open Source"
#define QT_PRODUCT_LICENSE "OpenSource"

// Qt Edition
#ifndef QT_EDITION
#  define QT_EDITION QT_EDITION_OPENSOURCE
#endif

#if (defined(_DEBUG) || defined(DEBUG))
# if (defined(WIN64) || defined(_WIN64) || defined(__WIN64__))
#  define QT_BUILD_KEY "Windows x64 mingw debug full-config"
# else
#  define QT_BUILD_KEY "Windows mingw debug full-config"
# endif
#else
# if (defined(WIN64) || defined(_WIN64) || defined(__WIN64__))
#  define QT_BUILD_KEY "Windows x64 mingw release full-config"
# else
#  define QT_BUILD_KEY "Windows mingw release full-config"
# endif
#endif

/* Machine byte-order */
#define Q_BIG_ENDIAN 4321
#define Q_LITTLE_ENDIAN 1234
#define Q_BYTE_ORDER Q_LITTLE_ENDIAN

// Compile time features
#define QT_ARCH_WINDOWS
#if defined(QT_BUILTIN_GIF_READER) && defined(QT_NO_BUILTIN_GIF_READER)
# undef QT_BUILTIN_GIF_READER
#elif !defined(QT_BUILTIN_GIF_READER)
# define QT_BUILTIN_GIF_READER 1
#endif

#if defined(QT_NO_COMPRESS) && defined(QT_COMPRESS)
# undef QT_NO_COMPRESS
#elif !defined(QT_NO_COMPRESS)
# define QT_NO_COMPRESS
#endif

#if defined(QT_NO_DIRECT3D) && defined(QT_DIRECT3D)
# undef QT_NO_DIRECT3D
#elif !defined(QT_NO_DIRECT3D)
# define QT_NO_DIRECT3D
#endif

#if defined(QT_NO_EXCEPTIONS) && defined(QT_EXCEPTIONS)
# undef QT_NO_EXCEPTIONS
#elif !defined(QT_NO_EXCEPTIONS)
# define QT_NO_EXCEPTIONS
#endif

#if defined(QT_NO_IMAGEFORMAT_MNG) && defined(QT_IMAGEFORMAT_MNG)
# undef QT_NO_IMAGEFORMAT_MNG
#elif !defined(QT_NO_IMAGEFORMAT_MNG)
# define QT_NO_IMAGEFORMAT_MNG
#endif

#if defined(QT_NO_IMAGEFORMAT_PNG) && defined(QT_IMAGEFORMAT_PNG)
# undef QT_NO_IMAGEFORMAT_PNG
#elif !defined(QT_NO_IMAGEFORMAT_PNG)
# define QT_NO_IMAGEFORMAT_PNG
#endif

#if defined(QT_NO_IMAGEFORMAT_TIFF) && defined(QT_IMAGEFORMAT_TIFF)
# undef QT_NO_IMAGEFORMAT_TIFF
#elif !defined(QT_NO_IMAGEFORMAT_TIFF)
# define QT_NO_IMAGEFORMAT_TIFF
#endif

#if defined(QT_NO_OPENSSL) && defined(QT_OPENSSL)
# undef QT_NO_OPENSSL
#elif !defined(QT_NO_OPENSSL)
# define QT_NO_OPENSSL
#endif

#if defined(QT_NO_QDBUS) && defined(QT_QDBUS)
# undef QT_NO_QDBUS
#elif !defined(QT_NO_QDBUS)
# define QT_NO_QDBUS
#endif

#if defined(QT_NO_QT3SUPPORT) && defined(QT_QT3SUPPORT)
# undef QT_NO_QT3SUPPORT
#elif !defined(QT_NO_QT3SUPPORT)
# define QT_NO_QT3SUPPORT
#endif

#if defined(QT_NO_ZLIB) && defined(QT_ZLIB)
# undef QT_NO_ZLIB
#elif !defined(QT_NO_ZLIB)
# define QT_NO_ZLIB
#endif

