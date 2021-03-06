Caml2013E001����  ��  �  V$  B��1Timing_wheel_intf8lib/timing_wheel_intf.ml�����@@��B�  , ���	<A specialized priority queue for a set of time-based alarms.�@��
  =    A timing wheel is a data structure that maintains a clock with the current time and a
    set of alarms scheduled to fire in the future.  One can add and remove alarms, and
    advance the clock to cause alarms to fire.  There is nothing asynchronous about a
    timing wheel.  Alarms only fire in response to an ��-advance_clock��& call.�@��-    When one ��&create��	0s a timing wheel, one supplies an initial time, ��%start��-, and an
    ��/alarm_precision��	).  The timing wheel breaks all time from ��%start��	. onwards into
    half-open intervals of size ��/alarm_precision��	�, with the bottom half of each interval
    closed, and the top half open.  Alarms in the same interval fire in the same call to
    ��-advance_clock��-, as soon as ��%now t��	B is greater than all the times in the interval.
    When an alarm ��!a��9 fires on a timing wheel ��!t��	%, the implementation guarantees that:�@��$    ��>
      Alarm.at a < now t
    �@��	�    That is, alarms never fire early.  Furthermore, the implementation guarantees that
    alarms don't go off too late.  More precisely, for all alarms ��!a��$ in ��!t��!:�@��$    ��	E
      interval_start t (Alarm.at a) >= interval_start t (now t)
    �@��	%    This implies that for all alarms ��!a��$ in ��!t��!:�@��$    ��	3
      Alarm.at a >= now t - alarm_precision t
    �@��	2    One would like to have the strict inequality, ��	*Alarm.at a > now t - alarm_precision
    t��	;, but that does not hold due to floating-point imprecision.�@��2    Of course, an ��-advance_clock��	� call can advance the clock to an arbitrary time in the
    future, and thus alarms may fire at a clock time arbitrarily far beyond the time for
    which they were set.  But the implementation has no control over the times supplied to
    ��-advance_clock��	3; it can only guarantee that alarms will fire when ��-advance_clock��	$ is
    called with a time at least ��/alarm_precision��	# greater than their scheduled time.�@��$    ��A@��.Implementation@��	�
    ==================
    A timing wheel is implemented using a specialized priority queue in which the
    half-open intervals from ��%start��
  Z onwards are numbered 0, 1, 2, etc.  Each time is
    stored in the priority queue with the key of its interval number.  Thus all alarms
    with a time in the same interval get the same key, and hence fire at the same time.
    More specifically, an alarm is fired when the clock reaches or passes the time at the
    start of the next interval.�@��
  l    The priority queue is implemented with an array of levels of decreasing precision,
    with the lowest level having the most precision and storing the closest upcoming
    alarms, while the highest level has the least precision and stores the alarms farthest
    in the future.  As time increases, the timing wheel does a lazy radix sort of the
    alarm keys.�@��>    This implementation makes ��)add_alarm��% and ��,remove_alarm��: constant time, while
    ��-advance_clock��	� takes time proportional to the amount of time the clock is advanced.
    With a sufficient number of alarms, this is more efficient than a log(N) heap
    implementation of a priority queue.�@��$    ��A@��3Representable times@��	0
    =======================
    A timing wheel ��!t��	c can only handle a (typically large) bounded range of times as
    determined by the current time, ��%now t��*, and the ��*level_bits��% and ��/alarm_precision��;
    arguments supplied to ��&create��	H.  Various functions raise if they are supplied a time
    smaller than ��%now t��$ or ��6>= alarm_upper_bound t��	A.  This situation likely indicates a
    misconfiguration of the ��*level_bits��( and/or ��/alarm_precision��	..  Here are some examples
    of the duration ��;alarm_upper_bound t - now t��	6 for 32-bit and 64-bit machines using the
    default ��*level_bits��!.�@��$    ��
         | word size | # intervals | alarm_precision | duration |
      |-----------+-------------+-----------------+----------|
      |        32 |        2^29 | millisecond     | 7 days   |
      |        64 |        2^61 | nanosecond      | 73 years |
    @@@@@@@@@@@���$Time����@@���%Ofday@@���$Span@@���$Zone@@@@���!S����!t@@@���,timing_wheel@@@���%Alarm����!t@@@���"at�  , ���'In all ��%Alarm��	H functions, one must supply the timing wheel that the alarm was
        ��#add��	:ed to.  It is an error to supply a different timing wheel.@@@@@@@@@@@@���#key@@���%value@@���)sexp_of_t@@��A�  , ���'In all ��%Alarm��	H functions, one must supply the timing wheel that the alarm was
        ��#add��	:ed to.  It is an error to supply a different timing wheel.@@@@@@@@@@@@@@@����@@@���*Level_bits����!t@�  , ���	GThe timing-wheel implementation uses an array of "levels", where level ��!i��? is an
        array of length ��%2^b_i��,, where the ��#b_i��	, are the "level bits" specified via
        ��	%Level_bits.create_exn [b_0, b_1; ...]��!.�@��	0        A timing wheel can handle approximately ��/2 ** num_bits t��	C intervals/keys beyond
        the current minimum time/key, where ��<num_bits t = b_0 + b_1 + ...��!.�@��6        One can use a ��,Level_bits.t��	O to trade off run time and space usage of a timing
        wheel.  For a fixed ��(num_bits��	�, as the number of levels increases, the length of
        the levels decreases and the timing wheel uses less space, but the constant factor
        for the running time of ��#add��% and ��8increase_min_allowed_key��+ increases.@@@@@@@@@@@@����@@@���,max_num_bits@@���*create_exn�  , ���#In ��/create_exn bits��?, it is an error if any of the ��#b_i��$ in ��$bits��% has ��(b_i <= 0��?,
        or if the sum of the ��#b_i��$ in ��$bits��1 is greater than ��,max_num_bits��!.@@@@@@@@@@@@���'default�  , ���'default��> returns the default value of ��*level_bits��) used by ��3Timing_wheel.create��-
        and ��	"Timing_wheel.Priority_queue.create��	�.  It varies based on the machine's word
        size.  Here are the the values and the amount of space used for the level arrays.�@��	�        | word | bits used | level_bits               | space used  |
        |------+-----------+--------------------------+-------------|
        |   32 |        29 | ��)10; 10; 9��	;              | < 4k words  |
        |   64 |        61 | ��611; 10; 10; 10; 10; 10��0 | < 10k words |@@@@@@@@@@@@���(num_bits�  , ���*num_bits t��3 is the sum of the ��#b_i��$ in ��!t��!.@@@@@@@@@@@@���)durations�  , ���<durations t ~alarm_precision��	( returns the durations of the levels in ��!t��	3,
        assuming that each interval has duration ��/alarm_precision��!.@@@@@@@@@@@@���)t_of_sexp@@���)sexp_of_t@@��A�  , ���#In ��/create_exn bits��?, it is an error if any of the ��#b_i��$ in ��$bits��% has ��(b_i <= 0��?,
        or if the sum of the ��#b_i��$ in ��$bits��1 is greater than ��,max_num_bits��!.@@@@@@@@@@@@��A�  , ���'default��> returns the default value of ��*level_bits��) used by ��3Timing_wheel.create��-
        and ��	"Timing_wheel.Priority_queue.create��	�.  It varies based on the machine's word
        size.  Here are the the values and the amount of space used for the level arrays.�@��	�        | word | bits used | level_bits               | space used  |
        |------+-----------+--------------------------+-------------|
        |   32 |        29 | ��)10; 10; 9��	;              | < 4k words  |
        |   64 |        61 | ��611; 10; 10; 10; 10; 10��0 | < 10k words |@@@@@@@@@@@@��A�  , ���*num_bits t��3 is the sum of the ��#b_i��$ in ��!t��!.@@@@@@@@@@@@��A�  , ���<durations t ~alarm_precision��	( returns the durations of the levels in ��!t��	3,
        assuming that each interval has duration ��/alarm_precision��!.@@@@@@@@@@@@@@@���&create�  , ���	(create ~start ~alarm_precision ~dummy ()��	4 creates a new timing wheel with current
      time ��%start��'.  The ��%dummy��	d value is a performance optimization; it would be a bug if
      the timing wheel ever returned the ��%dummy��6 value to client code.�@��2      For a fixed ��*level_bits��	 , a smaller (i.e. more precise) ��/alarm_precision��	c decreases
      the representable range of times/keys and increases the constant factor for
      ��-advance_clock��!.�@��&      ��&create��+ raises if ��4alarm_precision <= 0��!.@@@@@@@@@@@@���/alarm_precision�  , ���)Accessors@@@@@@@@@@@@���#now@@���%start@@���(is_empty�  , ���	rOne can think of a timing wheel as a set of alarms.  Here are various container
      functions along those lines.@@@@@@@@@@@@���&length@@���$iter@@���.interval_start�  , ���5interval_start t time��	J returns the time at the start of the half-open interval
      containing ��$time��	., i.e. the largest time less than or equal to ��$time��; that is of the
      form ��?start t + k * alarm_precision t��#.  ��.interval_start��+ raises if ��.time < start t��*
      or ��$time��	' is too far in the future to represent.@@@@@@@@@@@@���-advance_clock�  , ���	"advance_clock t ~to_ ~handle_fired��* advances ��!t��,'s clock to ��#to_��	).  It fires and
      removes all alarms ��!a��$ in ��!t��& with ��	,Time.(<) (Alarm.at a) (interval_start t to_)��0
      applying ��,handle_fired��. to each such ��!a��!.�@��)      If ��,to_ <= now t��', then ��-advance_clock��. does nothing.�@��&      ��-advance_clock��* fails if ��#to_��	' is too far in the future to represent.�@��	!      Behavior is unspecified if ��,handle_fired��* accesses ��!t��= in any way other than
      ��%Alarm��+ functions.@@@@@@@@@@@@���1alarm_upper_bound�  , ���3alarm_upper_bound t��? returns the upper bound on an ��"at��? that can be supplied to
      ��#add��#.  ��3alarm_upper_bound t��	) is not constant; its value increases as ��%now t��1
      increases.@@@@@@@@@@@@���#add�  , ���+add t ~at a��2 adds a new value ��!a��$ to ��!t��	: and returns an alarm that can later be
      supplied to ��&remove��0 the alarm from ��!t��#.  ��#add��+ raises if ��	-at < now t || at >=
      alarm_upper_bound t��!.@@@@@@@@@@@@���&remove�  , ���.remove t alarm��) removes ��%alarm��& from ��!t��5.  It is an error to ��&remove��? an alarm
      that is not in ��!t��!.@@@@@@@@@@@@���3next_alarm_fires_at�  , ���5next_alarm_fires_at t��	d returns the minimum time to which the clock can be advanced
      such that an alarm will fire, or ��$None��$ if ��!t��: has no alarms.  If
      ��	!next_alarm_fires_at t = Some next��	", then for the minimum alarm time ��#min��6 that
      occurs in ��!t��9, it is guaranteed that: ��	&next - alarm_precision t <= min < next��!.@@@@@@@@@@@@���.Priority_queue����!t@@@���.priority_queue@@@���#Elt����!t@�  , ���#An ��%Elt.t��	8 represents an element that was added to a timing wheel.@@@@@@@@@@@@���)invariant@@���#key@@���%value@@���)sexp_of_t@@@@@����@@@���&create�  , ���<create ?level_bits ~dummy ()��	# creates a new empty timing wheel, ��!t��', with ��4length
        t = 0��% and ��5min_allowed_key t = 0��!.�@��(        ��%dummy��	� is a dummy value that will never be returned by any operation, but that
        allows the implementation to be more efficient.@@@@@@@@@@@@���&length�  , ���(length t��	4 returns the number of elements in the timing wheel.@@@@@@@@@@@@���(is_empty�  , ���*is_empty t��$ is ��,length t = 0@@@@@@@@@@@@���5max_representable_key�  , ���	eTo avoid issues with arithmetic overflow, the implementation restricts keys to
        being between ��!0��% and ��5max_representable_key��(, where:�@��(        ��	M
          max_representable_key = 1 lsl Level_bits.max_num_bits - 1
        �@��?        This is different from ��1max_allowed_key t��	F, which gives the maximum key that can
        currently be stored in ��!t��	j.  The maximum allowed key is never larger than the
        maximum representable key, but may be smaller.@@@@@@@@@@@@���/min_allowed_key�  , ���1min_allowed_key t��	* is the minimum key that can be stored in ��!t��	M.  This only
        indicates the possibility; there need not be an element ��#elt��$ in ��!t��& with ��	'Elt.key
        elt = min_allowed_key t��	W.  This is not the same as the "min_key" operation in a
        typical priority queue.�@��(        ��1min_allowed_key t��	. can increase over time, via calls to
        ��8increase_min_allowed_key��9.  It is guaranteed that ��	2min_allowed_key t <=
        max_representable_key��!.@@@@@@@@@@@@���/max_allowed_key�  , ���1max_allowed_key t��	2 is the maximum allowed key that can be stored in ��!t��..  As
        ��/min_allowed_key��4 increases, so does ��/max_allowed_key��	*; however it is not the case
        that ��	%max_allowed_key t - min_allowed_key t��	/ is a constant.  It is guaranteed that
        ��	Lmax_allowed_key t >= min (max_representable_key, min_allowed_key t + 2^B - 1��0,
        where ��!B��: is the sum of the b_i in ��*level_bits��	&.  It is also guaranteed that
        ��	*max_allowed_key t <= max_representable_key��!.@@@@@@@@@@@@���'min_elt�  , ���)min_elt t��7 returns an element in ��!t��> that has the minimum key, if ��!t��7 is
        nonempty.  ��'min_elt��	� takes time proportional to the size of the timing-wheel data
        structure in the worst case.  It is implemented via a linear search.�@��(        ��)min_key t��4 returns the key of ��)min_elt t��), if any.@@@@@@@@@@@@���'min_key@@���#add�  , ���0add t ~key value��5 adds a new value to ��!t��	> and returns an element that can later
        be supplied to ��&remove��2 the element from ��!t��#.  ��#add��+ raises if ��	:key <
        min_allowed_key t || key > max_allowed_key t��!.@@@@@@@@@@@@���&remove�  , ���,remove t elt��) removes ��#elt��& from ��!t��5.  It is an error if ��#elt��= is not currently
        in ��!t��	,, and this error may or may not be detected.@@@@@@@@@@@@���8increase_min_allowed_key�  , ���	/increase_min_allowed_key t ~key ~handle_removed��	. increases the minimum allowed
        key in ��!t��$ to ��#key��	/, and removes all elements with keys less than ��#key��3, applying
        ��.handle_removed��	& to each element that is removed.  If ��8key <= min_allowed_key t��/,
        then ��8increase_min_allowed_key��	& does nothing.  Otherwise, if
        ��8increase_min_allowed_key��7 returns successfully, ��7min_allowed_key t = key��!.�@��(        ��8increase_min_allowed_key��+ raises if ��;key > max_representable_key��!.�@��(        ��8increase_min_allowed_key��< takes time proportional to ��7key - min_allowed_key t��	&,
        although possibly less time.�@��	#        Behavior is unspecified if ��.handle_removed��* accesses ��!t��? in any way other than
        ��#Elt��+ functions.@@@@@@@@@@@@���$iter@@���)sexp_of_t@@��A�  , ���#An ��%Elt.t��	8 represents an element that was added to a timing wheel.@@@@@@@@@@@@��A�  , ���<create ?level_bits ~dummy ()��	# creates a new empty timing wheel, ��!t��', with ��4length
        t = 0��% and ��5min_allowed_key t = 0��!.�@��(        ��%dummy��	� is a dummy value that will never be returned by any operation, but that
        allows the implementation to be more efficient.@@@@@@@@@@@@��A�  , ���(length t��	4 returns the number of elements in the timing wheel.@@@@@@@@@@@@��A�  , ���*is_empty t��$ is ��,length t = 0@@@@@@@@@@@@��A�  , ���	eTo avoid issues with arithmetic overflow, the implementation restricts keys to
        being between ��!0��% and ��5max_representable_key��(, where:�@��(        ��	M
          max_representable_key = 1 lsl Level_bits.max_num_bits - 1
        �@��?        This is different from ��1max_allowed_key t��	F, which gives the maximum key that can
        currently be stored in ��!t��	j.  The maximum allowed key is never larger than the
        maximum representable key, but may be smaller.@@@@@@@@@@@@��A�  , ���1min_allowed_key t��	* is the minimum key that can be stored in ��!t��	M.  This only
        indicates the possibility; there need not be an element ��#elt��$ in ��!t��& with ��	'Elt.key
        elt = min_allowed_key t��	W.  This is not the same as the "min_key" operation in a
        typical priority queue.�@��(        ��1min_allowed_key t��	. can increase over time, via calls to
        ��8increase_min_allowed_key��9.  It is guaranteed that ��	2min_allowed_key t <=
        max_representable_key��!.@@@@@@@@@@@@��A�  , ���1max_allowed_key t��	2 is the maximum allowed key that can be stored in ��!t��..  As
        ��/min_allowed_key��4 increases, so does ��/max_allowed_key��	*; however it is not the case
        that ��	%max_allowed_key t - min_allowed_key t��	/ is a constant.  It is guaranteed that
        ��	Lmax_allowed_key t >= min (max_representable_key, min_allowed_key t + 2^B - 1��0,
        where ��!B��: is the sum of the b_i in ��*level_bits��	&.  It is also guaranteed that
        ��	*max_allowed_key t <= max_representable_key��!.@@@@@@@@@@@@��A�  , ���)min_elt t��7 returns an element in ��!t��> that has the minimum key, if ��!t��7 is
        nonempty.  ��'min_elt��	� takes time proportional to the size of the timing-wheel data
        structure in the worst case.  It is implemented via a linear search.�@��(        ��)min_key t��4 returns the key of ��)min_elt t��), if any.@@@@@@@@@@@@��A�  , ���0add t ~key value��5 adds a new value to ��!t��	> and returns an element that can later
        be supplied to ��&remove��2 the element from ��!t��#.  ��#add��+ raises if ��	:key <
        min_allowed_key t || key > max_allowed_key t��!.@@@@@@@@@@@@��A�  , ���,remove t elt��) removes ��#elt��& from ��!t��5.  It is an error if ��#elt��= is not currently
        in ��!t��	,, and this error may or may not be detected.@@@@@@@@@@@@��A�  , ���	/increase_min_allowed_key t ~key ~handle_removed��	. increases the minimum allowed
        key in ��!t��$ to ��#key��	/, and removes all elements with keys less than ��#key��3, applying
        ��.handle_removed��	& to each element that is removed.  If ��8key <= min_allowed_key t��/,
        then ��8increase_min_allowed_key��	& does nothing.  Otherwise, if
        ��8increase_min_allowed_key��7 returns successfully, ��7min_allowed_key t = key��!.�@��(        ��8increase_min_allowed_key��+ raises if ��;key > max_representable_key��!.�@��(        ��8increase_min_allowed_key��< takes time proportional to ��7key - min_allowed_key t��	&,
        although possibly less time.�@��	#        Behavior is unspecified if ��.handle_removed��* accesses ��!t��? in any way other than
        ��#Elt��+ functions.@@@@@@@@@@@@@�  , ���
  bTiming wheel is implemented as a priority queue in which the keys are
      non-negative integers corresponding to the intervals of time.  The priority queue is
      unlike a typical priority queue in that rather than having a "delete min" operation,
      it has a nondecreasing minimum allowed key, which corresponds to the current time,
      and an ��8increase_min_allowed_key��= operation, which implements ��-advance_clock��(.
      ��8increase_min_allowed_key��	� as a side effect removes all elements from the timing
      wheel whose key is smaller than the new minimum, which implements firing the alarms
      whose time has expired.�@��	�      Adding elements to and removing elements from a timing wheel takes constant time,
      unlike a heap-based priority queue which takes log(N), where N is the number of
      elements in the heap.  ��8increase_min_allowed_key��
  � takes time proportional to the
      amount of increase in the min-allowed key, as compared to log(N) for a heap.  It is
      these performance differences that motivate the existence of timing wheels and make
      them a good choice for maintaing a set of alarms.  With a timing wheel, one can
      support any number of alarms paying constant overhead per alarm, while paying a
      small constant overhead per unit of time passed.�@��	�      As the minimum allowed key increases, the timing wheel does a lazy radix sort of the
      element keys, with level 0 handling the least significant ��#b_0��	0 bits in a key, and
      each subsequent level ��!i��	$ handling the next most significant ��#b_i��	� bits.  The levels
      hold increasingly larger ranges of keys, where the union of all the levels can hold
      any key from ��1min_allowed_key t��$ to ��1max_allowed_key t��
  .  When a key is added to the
      timing wheel, it is added at the lowest possible level that can store the key.  As
      the minimum allowed key increases, timing-wheel elements move down levels until they
      reach level 0, and then are eventually removed.@@@@@@@@@@@@���)sexp_of_t@@��A�  , ���'In all ��%Alarm��	H functions, one must supply the timing wheel that the alarm was
        ��#add��	:ed to.  It is an error to supply a different timing wheel.@@@@@@@@@@@@��A�  , ���	GThe timing-wheel implementation uses an array of "levels", where level ��!i��? is an
        array of length ��%2^b_i��,, where the ��#b_i��	, are the "level bits" specified via
        ��	%Level_bits.create_exn [b_0, b_1; ...]��!.�@��	0        A timing wheel can handle approximately ��/2 ** num_bits t��	C intervals/keys beyond
        the current minimum time/key, where ��<num_bits t = b_0 + b_1 + ...��!.�@��6        One can use a ��,Level_bits.t��	O to trade off run time and space usage of a timing
        wheel.  For a fixed ��(num_bits��	�, as the number of levels increases, the length of
        the levels decreases and the timing wheel uses less space, but the constant factor
        for the running time of ��#add��% and ��8increase_min_allowed_key��+ increases.@@@@@@@@@@@@��A�  , ���#In ��/create_exn bits��?, it is an error if any of the ��#b_i��$ in ��$bits��% has ��(b_i <= 0��?,
        or if the sum of the ��#b_i��$ in ��$bits��1 is greater than ��,max_num_bits��!.@@@@@@@@@@@@��A�  , ���'default��> returns the default value of ��*level_bits��) used by ��3Timing_wheel.create��-
        and ��	"Timing_wheel.Priority_queue.create��	�.  It varies based on the machine's word
        size.  Here are the the values and the amount of space used for the level arrays.�@��	�        | word | bits used | level_bits               | space used  |
        |------+-----------+--------------------------+-------------|
        |   32 |        29 | ��)10; 10; 9��	;              | < 4k words  |
        |   64 |        61 | ��611; 10; 10; 10; 10; 10��0 | < 10k words |@@@@@@@@@@@@��A�  , ���*num_bits t��3 is the sum of the ��#b_i��$ in ��!t��!.@@@@@@@@@@@@��A�  , ���<durations t ~alarm_precision��	( returns the durations of the levels in ��!t��	3,
        assuming that each interval has duration ��/alarm_precision��!.@@@@@@@@@@@@��A�  , ���	(create ~start ~alarm_precision ~dummy ()��	4 creates a new timing wheel with current
      time ��%start��'.  The ��%dummy��	d value is a performance optimization; it would be a bug if
      the timing wheel ever returned the ��%dummy��6 value to client code.�@��2      For a fixed ��*level_bits��	 , a smaller (i.e. more precise) ��/alarm_precision��	c decreases
      the representable range of times/keys and increases the constant factor for
      ��-advance_clock��!.�@��&      ��&create��+ raises if ��4alarm_precision <= 0��!.@@@@@@@@@@@@��A�  , ���)Accessors@@@@@@@@@@@@��A�  , ���	rOne can think of a timing wheel as a set of alarms.  Here are various container
      functions along those lines.@@@@@@@@@@@@��A�  , ���5interval_start t time��	J returns the time at the start of the half-open interval
      containing ��$time��	., i.e. the largest time less than or equal to ��$time��; that is of the
      form ��?start t + k * alarm_precision t��#.  ��.interval_start��+ raises if ��.time < start t��*
      or ��$time��	' is too far in the future to represent.@@@@@@@@@@@@��A�  , ���	"advance_clock t ~to_ ~handle_fired��* advances ��!t��,'s clock to ��#to_��	).  It fires and
      removes all alarms ��!a��$ in ��!t��& with ��	,Time.(<) (Alarm.at a) (interval_start t to_)��0
      applying ��,handle_fired��. to each such ��!a��!.�@��)      If ��,to_ <= now t��', then ��-advance_clock��. does nothing.�@��&      ��-advance_clock��* fails if ��#to_��	' is too far in the future to represent.�@��	!      Behavior is unspecified if ��,handle_fired��* accesses ��!t��= in any way other than
      ��%Alarm��+ functions.@@@@@@@@@@@@��A�  , ���3alarm_upper_bound t��? returns the upper bound on an ��"at��? that can be supplied to
      ��#add��#.  ��3alarm_upper_bound t��	) is not constant; its value increases as ��%now t��1
      increases.@@@@@@@@@@@@��A�  , ���+add t ~at a��2 adds a new value ��!a��$ to ��!t��	: and returns an alarm that can later be
      supplied to ��&remove��0 the alarm from ��!t��#.  ��#add��+ raises if ��	-at < now t || at >=
      alarm_upper_bound t��!.@@@@@@@@@@@@��A�  , ���.remove t alarm��) removes ��%alarm��& from ��!t��5.  It is an error to ��&remove��? an alarm
      that is not in ��!t��!.@@@@@@@@@@@@��A�  , ���5next_alarm_fires_at t��	d returns the minimum time to which the clock can be advanced
      such that an alarm will fire, or ��$None��$ if ��!t��: has no alarms.  If
      ��	!next_alarm_fires_at t = Some next��	", then for the minimum alarm time ��#min��6 that
      occurs in ��!t��9, it is guaranteed that: ��	&next - alarm_precision t <= min < next��!.@@@@@@@@@@@@��A�  , ���
  bTiming wheel is implemented as a priority queue in which the keys are
      non-negative integers corresponding to the intervals of time.  The priority queue is
      unlike a typical priority queue in that rather than having a "delete min" operation,
      it has a nondecreasing minimum allowed key, which corresponds to the current time,
      and an ��8increase_min_allowed_key��= operation, which implements ��-advance_clock��(.
      ��8increase_min_allowed_key��	� as a side effect removes all elements from the timing
      wheel whose key is smaller than the new minimum, which implements firing the alarms
      whose time has expired.�@��	�      Adding elements to and removing elements from a timing wheel takes constant time,
      unlike a heap-based priority queue which takes log(N), where N is the number of
      elements in the heap.  ��8increase_min_allowed_key��
  � takes time proportional to the
      amount of increase in the min-allowed key, as compared to log(N) for a heap.  It is
      these performance differences that motivate the existence of timing wheels and make
      them a good choice for maintaing a set of alarms.  With a timing wheel, one can
      support any number of alarms paying constant overhead per alarm, while paying a
      small constant overhead per unit of time passed.�@��	�      As the minimum allowed key increases, the timing wheel does a lazy radix sort of the
      element keys, with level 0 handling the least significant ��#b_0��	0 bits in a key, and
      each subsequent level ��!i��	$ handling the next most significant ��#b_i��	� bits.  The levels
      hold increasingly larger ranges of keys, where the union of all the levels can hold
      any key from ��1min_allowed_key t��$ to ��1max_allowed_key t��
  .  When a key is added to the
      timing wheel, it is added at the lowest possible level that can store the key.  As
      the minimum allowed key increases, timing-wheel elements move down levels until they
      reach level 0, and then are eventually removed.@@@@@@@@@@@@��A�  , ���#An ��%Elt.t��	8 represents an element that was added to a timing wheel.@@@@@@@@@@@@��A�  , ���<create ?level_bits ~dummy ()��	# creates a new empty timing wheel, ��!t��', with ��4length
        t = 0��% and ��5min_allowed_key t = 0��!.�@��(        ��%dummy��	� is a dummy value that will never be returned by any operation, but that
        allows the implementation to be more efficient.@@@@@@@@@@@@��A�  , ���(length t��	4 returns the number of elements in the timing wheel.@@@@@@@@@@@@��A�  , ���*is_empty t��$ is ��,length t = 0@@@@@@@@@@@@��A�  , ���	eTo avoid issues with arithmetic overflow, the implementation restricts keys to
        being between ��!0��% and ��5max_representable_key��(, where:�@��(        ��	M
          max_representable_key = 1 lsl Level_bits.max_num_bits - 1
        �@��?        This is different from ��1max_allowed_key t��	F, which gives the maximum key that can
        currently be stored in ��!t��	j.  The maximum allowed key is never larger than the
        maximum representable key, but may be smaller.@@@@@@@@@@@@��A�  , ���1min_allowed_key t��	* is the minimum key that can be stored in ��!t��	M.  This only
        indicates the possibility; there need not be an element ��#elt��$ in ��!t��& with ��	'Elt.key
        elt = min_allowed_key t��	W.  This is not the same as the "min_key" operation in a
        typical priority queue.�@��(        ��1min_allowed_key t��	. can increase over time, via calls to
        ��8increase_min_allowed_key��9.  It is guaranteed that ��	2min_allowed_key t <=
        max_representable_key��!.@@@@@@@@@@@@��A�  , ���1max_allowed_key t��	2 is the maximum allowed key that can be stored in ��!t��..  As
        ��/min_allowed_key��4 increases, so does ��/max_allowed_key��	*; however it is not the case
        that ��	%max_allowed_key t - min_allowed_key t��	/ is a constant.  It is guaranteed that
        ��	Lmax_allowed_key t >= min (max_representable_key, min_allowed_key t + 2^B - 1��0,
        where ��!B��: is the sum of the b_i in ��*level_bits��	&.  It is also guaranteed that
        ��	*max_allowed_key t <= max_representable_key��!.@@@@@@@@@@@@��A�  , ���)min_elt t��7 returns an element in ��!t��> that has the minimum key, if ��!t��7 is
        nonempty.  ��'min_elt��	� takes time proportional to the size of the timing-wheel data
        structure in the worst case.  It is implemented via a linear search.�@��(        ��)min_key t��4 returns the key of ��)min_elt t��), if any.@@@@@@@@@@@@��A�  , ���0add t ~key value��5 adds a new value to ��!t��	> and returns an element that can later
        be supplied to ��&remove��2 the element from ��!t��#.  ��#add��+ raises if ��	:key <
        min_allowed_key t || key > max_allowed_key t��!.@@@@@@@@@@@@��A�  , ���,remove t elt��) removes ��#elt��& from ��!t��5.  It is an error if ��#elt��= is not currently
        in ��!t��	,, and this error may or may not be detected.@@@@@@@@@@@@��A�  , ���	/increase_min_allowed_key t ~key ~handle_removed��	. increases the minimum allowed
        key in ��!t��$ to ��#key��	/, and removes all elements with keys less than ��#key��3, applying
        ��.handle_removed��	& to each element that is removed.  If ��8key <= min_allowed_key t��/,
        then ��8increase_min_allowed_key��	& does nothing.  Otherwise, if
        ��8increase_min_allowed_key��7 returns successfully, ��7min_allowed_key t = key��!.�@��(        ��8increase_min_allowed_key��+ raises if ��;key > max_representable_key��!.�@��(        ��8increase_min_allowed_key��< takes time proportional to ��7key - min_allowed_key t��	&,
        although possibly less time.�@��	#        Behavior is unspecified if ��.handle_removed��* accesses ��!t��? in any way other than
        ��#Elt��+ functions.@@@@@@@@@@@@@@�����,Timing_wheel����!S�@@@���@@@���%Debug�@����@@@���/check_invariant@@���-show_messages@@@@@@@����B�  , ���	<A specialized priority queue for a set of time-based alarms.�@��
  =    A timing wheel is a data structure that maintains a clock with the current time and a
    set of alarms scheduled to fire in the future.  One can add and remove alarms, and
    advance the clock to cause alarms to fire.  There is nothing asynchronous about a
    timing wheel.  Alarms only fire in response to an ��-advance_clock��& call.�@��-    When one ��&create��	0s a timing wheel, one supplies an initial time, ��%start��-, and an
    ��/alarm_precision��	).  The timing wheel breaks all time from ��%start��	. onwards into
    half-open intervals of size ��/alarm_precision��	�, with the bottom half of each interval
    closed, and the top half open.  Alarms in the same interval fire in the same call to
    ��-advance_clock��-, as soon as ��%now t��	B is greater than all the times in the interval.
    When an alarm ��!a��9 fires on a timing wheel ��!t��	%, the implementation guarantees that:�@��$    ��>
      Alarm.at a < now t
    �@��	�    That is, alarms never fire early.  Furthermore, the implementation guarantees that
    alarms don't go off too late.  More precisely, for all alarms ��!a��$ in ��!t��!:�@��$    ��	E
      interval_start t (Alarm.at a) >= interval_start t (now t)
    �@��	%    This implies that for all alarms ��!a��$ in ��!t��!:�@��$    ��	3
      Alarm.at a >= now t - alarm_precision t
    �@��	2    One would like to have the strict inequality, ��	*Alarm.at a > now t - alarm_precision
    t��	;, but that does not hold due to floating-point imprecision.�@��2    Of course, an ��-advance_clock��	� call can advance the clock to an arbitrary time in the
    future, and thus alarms may fire at a clock time arbitrarily far beyond the time for
    which they were set.  But the implementation has no control over the times supplied to
    ��-advance_clock��	3; it can only guarantee that alarms will fire when ��-advance_clock��	$ is
    called with a time at least ��/alarm_precision��	# greater than their scheduled time.�@��$    ��A@��.Implementation@��	�
    ==================
    A timing wheel is implemented using a specialized priority queue in which the
    half-open intervals from ��%start��
  Z onwards are numbered 0, 1, 2, etc.  Each time is
    stored in the priority queue with the key of its interval number.  Thus all alarms
    with a time in the same interval get the same key, and hence fire at the same time.
    More specifically, an alarm is fired when the clock reaches or passes the time at the
    start of the next interval.�@��
  l    The priority queue is implemented with an array of levels of decreasing precision,
    with the lowest level having the most precision and storing the closest upcoming
    alarms, while the highest level has the least precision and stores the alarms farthest
    in the future.  As time increases, the timing wheel does a lazy radix sort of the
    alarm keys.�@��>    This implementation makes ��)add_alarm��% and ��,remove_alarm��: constant time, while
    ��-advance_clock��	� takes time proportional to the amount of time the clock is advanced.
    With a sufficient number of alarms, this is more efficient than a log(N) heap
    implementation of a priority queue.�@��$    ��A@��3Representable times@��	0
    =======================
    A timing wheel ��!t��	c can only handle a (typically large) bounded range of times as
    determined by the current time, ��%now t��*, and the ��*level_bits��% and ��/alarm_precision��;
    arguments supplied to ��&create��	H.  Various functions raise if they are supplied a time
    smaller than ��%now t��$ or ��6>= alarm_upper_bound t��	A.  This situation likely indicates a
    misconfiguration of the ��*level_bits��( and/or ��/alarm_precision��	..  Here are some examples
    of the duration ��;alarm_upper_bound t - now t��	6 for 32-bit and 64-bit machines using the
    default ��*level_bits��!.�@��$    ��
         | word size | # intervals | alarm_precision | duration |
      |-----------+-------------+-----------------+----------|
      |        32 |        2^29 | millisecond     | 7 days   |
      |        64 |        2^61 | nanosecond      | 73 years |
    @@@@@@@@@@@��B�  , ���'In all ��%Alarm��	H functions, one must supply the timing wheel that the alarm was
        ��#add��	:ed to.  It is an error to supply a different timing wheel.@@@@@@@@@@@��B�  , ���	GThe timing-wheel implementation uses an array of "levels", where level ��!i��? is an
        array of length ��%2^b_i��,, where the ��#b_i��	, are the "level bits" specified via
        ��	%Level_bits.create_exn [b_0, b_1; ...]��!.�@��	0        A timing wheel can handle approximately ��/2 ** num_bits t��	C intervals/keys beyond
        the current minimum time/key, where ��<num_bits t = b_0 + b_1 + ...��!.�@��6        One can use a ��,Level_bits.t��	O to trade off run time and space usage of a timing
        wheel.  For a fixed ��(num_bits��	�, as the number of levels increases, the length of
        the levels decreases and the timing wheel uses less space, but the constant factor
        for the running time of ��#add��% and ��8increase_min_allowed_key��+ increases.@@@@@@@@@@@��B�  , ���#In ��/create_exn bits��?, it is an error if any of the ��#b_i��$ in ��$bits��% has ��(b_i <= 0��?,
        or if the sum of the ��#b_i��$ in ��$bits��1 is greater than ��,max_num_bits��!.@@@@@@@@@@@��B�  , ���'default��> returns the default value of ��*level_bits��) used by ��3Timing_wheel.create��-
        and ��	"Timing_wheel.Priority_queue.create��	�.  It varies based on the machine's word
        size.  Here are the the values and the amount of space used for the level arrays.�@��	�        | word | bits used | level_bits               | space used  |
        |------+-----------+--------------------------+-------------|
        |   32 |        29 | ��)10; 10; 9��	;              | < 4k words  |
        |   64 |        61 | ��611; 10; 10; 10; 10; 10��0 | < 10k words |@@@@@@@@@@@��B�  , ���*num_bits t��3 is the sum of the ��#b_i��$ in ��!t��!.@@@@@@@@@@@��B�  , ���<durations t ~alarm_precision��	( returns the durations of the levels in ��!t��	3,
        assuming that each interval has duration ��/alarm_precision��!.@@@@@@@@@@@��B�  , ���	(create ~start ~alarm_precision ~dummy ()��	4 creates a new timing wheel with current
      time ��%start��'.  The ��%dummy��	d value is a performance optimization; it would be a bug if
      the timing wheel ever returned the ��%dummy��6 value to client code.�@��2      For a fixed ��*level_bits��	 , a smaller (i.e. more precise) ��/alarm_precision��	c decreases
      the representable range of times/keys and increases the constant factor for
      ��-advance_clock��!.�@��&      ��&create��+ raises if ��4alarm_precision <= 0��!.@@@@@@@@@@@��B�  , ���)Accessors@@@@@@@@@@@��B�  , ���	rOne can think of a timing wheel as a set of alarms.  Here are various container
      functions along those lines.@@@@@@@@@@@��B�  , ���5interval_start t time��	J returns the time at the start of the half-open interval
      containing ��$time��	., i.e. the largest time less than or equal to ��$time��; that is of the
      form ��?start t + k * alarm_precision t��#.  ��.interval_start��+ raises if ��.time < start t��*
      or ��$time��	' is too far in the future to represent.@@@@@@@@@@@��B�  , ���	"advance_clock t ~to_ ~handle_fired��* advances ��!t��,'s clock to ��#to_��	).  It fires and
      removes all alarms ��!a��$ in ��!t��& with ��	,Time.(<) (Alarm.at a) (interval_start t to_)��0
      applying ��,handle_fired��. to each such ��!a��!.�@��)      If ��,to_ <= now t��', then ��-advance_clock��. does nothing.�@��&      ��-advance_clock��* fails if ��#to_��	' is too far in the future to represent.�@��	!      Behavior is unspecified if ��,handle_fired��* accesses ��!t��= in any way other than
      ��%Alarm��+ functions.@@@@@@@@@@@��B�  , ���3alarm_upper_bound t��? returns the upper bound on an ��"at��? that can be supplied to
      ��#add��#.  ��3alarm_upper_bound t��	) is not constant; its value increases as ��%now t��1
      increases.@@@@@@@@@@@��B�  , ���+add t ~at a��2 adds a new value ��!a��$ to ��!t��	: and returns an alarm that can later be
      supplied to ��&remove��0 the alarm from ��!t��#.  ��#add��+ raises if ��	-at < now t || at >=
      alarm_upper_bound t��!.@@@@@@@@@@@��B�  , ���.remove t alarm��) removes ��%alarm��& from ��!t��5.  It is an error to ��&remove��? an alarm
      that is not in ��!t��!.@@@@@@@@@@@��B�  , ���5next_alarm_fires_at t��	d returns the minimum time to which the clock can be advanced
      such that an alarm will fire, or ��$None��$ if ��!t��: has no alarms.  If
      ��	!next_alarm_fires_at t = Some next��	", then for the minimum alarm time ��#min��6 that
      occurs in ��!t��9, it is guaranteed that: ��	&next - alarm_precision t <= min < next��!.@@@@@@@@@@@��B�  , ���
  bTiming wheel is implemented as a priority queue in which the keys are
      non-negative integers corresponding to the intervals of time.  The priority queue is
      unlike a typical priority queue in that rather than having a "delete min" operation,
      it has a nondecreasing minimum allowed key, which corresponds to the current time,
      and an ��8increase_min_allowed_key��= operation, which implements ��-advance_clock��(.
      ��8increase_min_allowed_key��	� as a side effect removes all elements from the timing
      wheel whose key is smaller than the new minimum, which implements firing the alarms
      whose time has expired.�@��	�      Adding elements to and removing elements from a timing wheel takes constant time,
      unlike a heap-based priority queue which takes log(N), where N is the number of
      elements in the heap.  ��8increase_min_allowed_key��
  � takes time proportional to the
      amount of increase in the min-allowed key, as compared to log(N) for a heap.  It is
      these performance differences that motivate the existence of timing wheels and make
      them a good choice for maintaing a set of alarms.  With a timing wheel, one can
      support any number of alarms paying constant overhead per alarm, while paying a
      small constant overhead per unit of time passed.�@��	�      As the minimum allowed key increases, the timing wheel does a lazy radix sort of the
      element keys, with level 0 handling the least significant ��#b_0��	0 bits in a key, and
      each subsequent level ��!i��	$ handling the next most significant ��#b_i��	� bits.  The levels
      hold increasingly larger ranges of keys, where the union of all the levels can hold
      any key from ��1min_allowed_key t��$ to ��1max_allowed_key t��
  .  When a key is added to the
      timing wheel, it is added at the lowest possible level that can store the key.  As
      the minimum allowed key increases, timing-wheel elements move down levels until they
      reach level 0, and then are eventually removed.@@@@@@@@@@@��B�  , ���#An ��%Elt.t��	8 represents an element that was added to a timing wheel.@@@@@@@@@@@��B�  , ���<create ?level_bits ~dummy ()��	# creates a new empty timing wheel, ��!t��', with ��4length
        t = 0��% and ��5min_allowed_key t = 0��!.�@��(        ��%dummy��	� is a dummy value that will never be returned by any operation, but that
        allows the implementation to be more efficient.@@@@@@@@@@@��B�  , ���(length t��	4 returns the number of elements in the timing wheel.@@@@@@@@@@@��B�  , ���*is_empty t��$ is ��,length t = 0@@@@@@@@@@@��B�  , ���	eTo avoid issues with arithmetic overflow, the implementation restricts keys to
        being between ��!0��% and ��5max_representable_key��(, where:�@��(        ��	M
          max_representable_key = 1 lsl Level_bits.max_num_bits - 1
        �@��?        This is different from ��1max_allowed_key t��	F, which gives the maximum key that can
        currently be stored in ��!t��	j.  The maximum allowed key is never larger than the
        maximum representable key, but may be smaller.@@@@@@@@@@@��B�  , ���1min_allowed_key t��	* is the minimum key that can be stored in ��!t��	M.  This only
        indicates the possibility; there need not be an element ��#elt��$ in ��!t��& with ��	'Elt.key
        elt = min_allowed_key t��	W.  This is not the same as the "min_key" operation in a
        typical priority queue.�@��(        ��1min_allowed_key t��	. can increase over time, via calls to
        ��8increase_min_allowed_key��9.  It is guaranteed that ��	2min_allowed_key t <=
        max_representable_key��!.@@@@@@@@@@@��B�  , ���1max_allowed_key t��	2 is the maximum allowed key that can be stored in ��!t��..  As
        ��/min_allowed_key��4 increases, so does ��/max_allowed_key��	*; however it is not the case
        that ��	%max_allowed_key t - min_allowed_key t��	/ is a constant.  It is guaranteed that
        ��	Lmax_allowed_key t >= min (max_representable_key, min_allowed_key t + 2^B - 1��0,
        where ��!B��: is the sum of the b_i in ��*level_bits��	&.  It is also guaranteed that
        ��	*max_allowed_key t <= max_representable_key��!.@@@@@@@@@@@��B�  , ���)min_elt t��7 returns an element in ��!t��> that has the minimum key, if ��!t��7 is
        nonempty.  ��'min_elt��	� takes time proportional to the size of the timing-wheel data
        structure in the worst case.  It is implemented via a linear search.�@��(        ��)min_key t��4 returns the key of ��)min_elt t��), if any.@@@@@@@@@@@��B�  , ���0add t ~key value��5 adds a new value to ��!t��	> and returns an element that can later
        be supplied to ��&remove��2 the element from ��!t��#.  ��#add��+ raises if ��	:key <
        min_allowed_key t || key > max_allowed_key t��!.@@@@@@@@@@@��B�  , ���,remove t elt��) removes ��#elt��& from ��!t��5.  It is an error if ��#elt��= is not currently
        in ��!t��	,, and this error may or may not be detected.@@@@@@@@@@@��B�  , ���	/increase_min_allowed_key t ~key ~handle_removed��	. increases the minimum allowed
        key in ��!t��$ to ��#key��	/, and removes all elements with keys less than ��#key��3, applying
        ��.handle_removed��	& to each element that is removed.  If ��8key <= min_allowed_key t��/,
        then ��8increase_min_allowed_key��	& does nothing.  Otherwise, if
        ��8increase_min_allowed_key��7 returns successfully, ��7min_allowed_key t = key��!.�@��(        ��8increase_min_allowed_key��+ raises if ��;key > max_representable_key��!.�@��(        ��8increase_min_allowed_key��< takes time proportional to ��7key - min_allowed_key t��	&,
        although possibly less time.�@��	#        Behavior is unspecified if ��.handle_removed��* accesses ��!t��? in any way other than
        ��#Elt��+ functions.@@@@@@@@@@@@@