
#ifndef _DYN_LINK_H
#define _DYN_LINK_H

#if defined (READLINE_STATIC)
  #define _RL_DLL
#elif defined (_WIN32)
  #if defined (BUILDING_DLL)
    #define _RL_DLL __declspec(dllexport)
  #else
    #define _RL_DLL __declspec(dllimport)
  #endif	/* BUILDING_DLL  */
#endif	/* _WIN32 ... _DYNAMIC_LINK  */

#define RL_EXTERN      extern _RL_DLL

#endif /* _DYN_LINK_H  */
