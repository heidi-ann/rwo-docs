Caml2013E001����  �   Q  �  0�(Async_gc/lib/async_gc.ml�����@@��A@���@@����-add_finalizer�  , ���1add_finalizer f x��) is like ��/Gc.finalise f x��	�, except that the finalizer is guaranteed
    to run as an Async job (i.e. without interrupting other Async jobs).  Unprotected use
    of ��0Caml.Gc.finalise��$ or ��5Core.Gc.add_finalizer��	� in Async programs is wrong, because
    the finalizers won't hold the async lock, and thus could interleave arbitrarily with
    async jobs.@@@@@@@@@@@����1add_finalizer_exn@�-�.��B�  , ���1add_finalizer f x��) is like ��/Gc.finalise f x��	�, except that the finalizer is guaranteed
    to run as an Async job (i.e. without interrupting other Async jobs).  Unprotected use
    of ��0Caml.Gc.finalise��$ or ��5Core.Gc.add_finalizer��	� in Async programs is wrong, because
    the finalizers won't hold the async lock, and thus could interleave arbitrarily with
    async jobs.@@@@@@@@@@@@@