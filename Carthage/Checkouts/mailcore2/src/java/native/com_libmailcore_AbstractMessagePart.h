/* DO NOT EDIT THIS FILE - it is machine generated */
#include <jni.h>
/* Header for class com_libmailcore_AbstractMessagePart */

#ifndef _Included_com_libmailcore_AbstractMessagePart
#define _Included_com_libmailcore_AbstractMessagePart
#ifdef __cplusplus
extern "C" {
#endif
#undef com_libmailcore_AbstractMessagePart_serialVersionUID
#define com_libmailcore_AbstractMessagePart_serialVersionUID 1LL
/*
 * Class:     com_libmailcore_AbstractMessagePart
 * Method:    header
 * Signature: ()Lcom/libmailcore/MessageHeader;
 */
JNIEXPORT jobject JNICALL Java_com_libmailcore_AbstractMessagePart_header
  (JNIEnv *, jobject);

/*
 * Class:     com_libmailcore_AbstractMessagePart
 * Method:    setHeader
 * Signature: (Lcom/libmailcore/MessageHeader;)V
 */
JNIEXPORT void JNICALL Java_com_libmailcore_AbstractMessagePart_setHeader
  (JNIEnv *, jobject, jobject);

/*
 * Class:     com_libmailcore_AbstractMessagePart
 * Method:    mainPart
 * Signature: ()Lcom/libmailcore/AbstractPart;
 */
JNIEXPORT jobject JNICALL Java_com_libmailcore_AbstractMessagePart_mainPart
  (JNIEnv *, jobject);

/*
 * Class:     com_libmailcore_AbstractMessagePart
 * Method:    setMainPart
 * Signature: (Lcom/libmailcore/AbstractPart;)V
 */
JNIEXPORT void JNICALL Java_com_libmailcore_AbstractMessagePart_setMainPart
  (JNIEnv *, jobject, jobject);

#ifdef __cplusplus
}
#endif
#endif