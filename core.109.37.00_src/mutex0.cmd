Caml2013E001¦Ύ  Ω   h    O°&Mutex0-lib/mutex0.ml   @@  A@  @@  B  ,  &create & like  Ή@,Mutex.create@ 	΅, but creates an error-checking mutex.
    Locking a mutex twice from the same thread, unlocking an unlocked mutex,
    or unlocking a mutex not held by the thread will result in a  )Sys_error /
    exception.@@@@@@@@@@@  &create@  &create@  *phys_equal@  %equal@  0critical_section@  +synchronize@  -update_signal@  0update_broadcast@  (try_lock@ K  B  ,  &create & like  Ή@,Mutex.create@ 	΅, but creates an error-checking mutex.
    Locking a mutex twice from the same thread, unlocking an unlocked mutex,
    or unlocking a mutex not held by the thread will result in a  )Sys_error /
    exception.@@@@@@@@@@@@@