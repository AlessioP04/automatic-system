PROGRAM program0
  VAR
    boxWeight AT %QW0 : INT;
    boxType AT %QW1 : INT;
    toAddA AT %QW2 : INT;
    toAddB AT %QW3 : INT;
    toAddC AT %QW4 : INT;
    turbineWeight AT %QW5 : INT;
    turbineValidity AT %QX0.0 : BOOL;
  END_VAR
  VAR
    _TMP_GT5_OUT : BOOL;
    _TMP_LT8_OUT : BOOL;
    _TMP_AND10_OUT : BOOL;
    _TMP_GT13_OUT : BOOL;
    _TMP_LT16_OUT : BOOL;
    _TMP_AND2_OUT : BOOL;
  END_VAR

  INITIAL_STEP Step0:
    COMPUTE_FUNCTION_BLOCKS(S);
  END_STEP

  ACTION COMPUTE_FUNCTION_BLOCKS:
    _TMP_GT5_OUT := GT(boxWeight, 920);
    _TMP_LT8_OUT := LT(boxWeight, 1080);
    _TMP_AND10_OUT := AND(_TMP_GT5_OUT, _TMP_LT8_OUT);
    _TMP_GT13_OUT := GT(boxWeight, 1280);
    _TMP_LT16_OUT := LT(boxWeight, 1520);
    _TMP_AND2_OUT := AND(_TMP_GT13_OUT, _TMP_LT16_OUT);
  END_ACTION

  TRANSITION FROM Step0 TO boxA
    := _TMP_AND10_OUT;
  END_TRANSITION

  INITIAL_STEP boxA:
    BOXA_INLINE1(N);
  END_STEP

  ACTION BOXA_INLINE1:
    boxType:=1;
  END_ACTION

  TRANSITION FROM boxA TO Step0
    := true;
  END_TRANSITION

  TRANSITION FROM Step0 TO boxB
    := _TMP_AND2_OUT;
  END_TRANSITION

  STEP boxB:
    BOXB_INLINE2(N);
  END_STEP

  ACTION BOXB_INLINE2:
    boxType:=2;
  END_ACTION

  TRANSITION FROM boxB TO Step0
    := true;
  END_TRANSITION

END_PROGRAM


CONFIGURATION Config0

  RESOURCE Res0 ON PLC
    TASK task0(INTERVAL := T#20ms,PRIORITY := 0);
    PROGRAM instance0 WITH task0 : program0;
  END_RESOURCE
END_CONFIGURATION

(*DBG:char md5[] = "5c166dcffb0ec71485429c4b82ae5bcb";*)
(*DBG:/**)
(*DBG: * This file is part of OpenPLC Runtime*)
(*DBG: **)
(*DBG: * Copyright (C) 2023 Autonomy, GP Orcullo*)
(*DBG: * Based on the work by GP Orcullo on Beremiz for uC*)
(*DBG: **)
(*DBG: * This program is free software; you can redistribute it and/or*)
(*DBG: * modify it under the terms of the GNU General Public License*)
(*DBG: * as published by the Free Software Foundation; either version 2*)
(*DBG: * of the License, or (at your option) any later version.*)
(*DBG: **)
(*DBG: * This program is distributed in the hope that it will be useful,*)
(*DBG: * but WITHOUT ANY WARRANTY; without even the implied warranty of*)
(*DBG: * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the*)
(*DBG: * GNU General Public License for more details.*)
(*DBG: **)
(*DBG: * You should have received a copy of the GNU General Public License*)
(*DBG: * along with this program; If not, see <http://www.gnu.org/licenses/>.*)
(*DBG: **)
(*DBG: */*)
(*DBG:*)
(*DBG:#include <stdbool.h>*)
(*DBG:*)
(*DBG:#include "iec_types_all.h"*)
(*DBG:#include "POUS.h"*)
(*DBG:*)
(*DBG:#define SAME_ENDIANNESS      0*)
(*DBG:#define REVERSE_ENDIANNESS   1*)
(*DBG:*)
(*DBG:uint8_t endianness;*)
(*DBG:*)
(*DBG:*)
(*DBG:extern PROGRAM0 RES0__INSTANCE0;*)
(*DBG:*)
(*DBG:static const struct {*)
(*DBG:    void *ptr;*)
(*DBG:    __IEC_types_enum type;*)
(*DBG:} debug_vars[] = {*)
(*DBG:    {&(RES0__INSTANCE0.BOXWEIGHT), INT_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.BOXTYPE), INT_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.TOADDA), INT_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.TOADDB), INT_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.TOADDC), INT_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.TURBINEWEIGHT), INT_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.TURBINEVALIDITY), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0._TMP_GT5_OUT), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0._TMP_LT8_OUT), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0._TMP_AND10_OUT), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0._TMP_GT13_OUT), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0._TMP_LT16_OUT), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0._TMP_AND2_OUT), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.__step_list[0].X), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.__action_list[0].state), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.__debug_transition_list[0]), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.__step_list[1].X), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.__action_list[1].state), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.__debug_transition_list[1]), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.__debug_transition_list[2]), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.__step_list[2].X), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.__action_list[2].state), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.__debug_transition_list[3]), BOOL_ENUM},*)
(*DBG:};*)
(*DBG:*)
(*DBG:#define VAR_COUNT               23*)
(*DBG:*)
(*DBG:uint16_t get_var_count(void)*)
(*DBG:{*)
(*DBG:    return VAR_COUNT;*)
(*DBG:}*)
(*DBG:*)
(*DBG:size_t get_var_size(size_t idx)*)
(*DBG:{*)
(*DBG:    if (idx >= VAR_COUNT)*)
(*DBG:    {*)
(*DBG:        return 0;*)
(*DBG:    }*)
(*DBG:    switch (debug_vars[idx].type) {*)
(*DBG:    case BOOL_ENUM:*)
(*DBG:        return sizeof(BOOL);*)
(*DBG:    case INT_ENUM:*)
(*DBG:        return sizeof(INT);*)
(*DBG:    default:*)
(*DBG:        return 0;*)
(*DBG:    }*)
(*DBG:}*)
(*DBG:*)
(*DBG:void *get_var_addr(size_t idx)*)
(*DBG:{*)
(*DBG:    void *ptr = debug_vars[idx].ptr;*)
(*DBG:*)
(*DBG:    switch (debug_vars[idx].type) {*)
(*DBG:    case BOOL_ENUM:*)
(*DBG:        return (void *)&((__IEC_BOOL_t *) ptr)->value;*)
(*DBG:    case INT_ENUM:*)
(*DBG:        return (void *)&((__IEC_INT_t *) ptr)->value;*)
(*DBG:    default:*)
(*DBG:        return 0;*)
(*DBG:    }*)
(*DBG:}*)
(*DBG:*)
(*DBG:void force_var(size_t idx, bool forced, void *val)*)
(*DBG:{*)
(*DBG:    void *ptr = debug_vars[idx].ptr;*)
(*DBG:*)
(*DBG:    if (forced) {*)
(*DBG:        size_t var_size = get_var_size(idx);*)
(*DBG:        switch (debug_vars[idx].type) {*)
(*DBG:        case BOOL_ENUM: {*)
(*DBG:            memcpy(&((__IEC_BOOL_t *) ptr)->value, val, var_size);*)
(*DBG:            //((__IEC_BOOL_t *) ptr)->value = *((BOOL *) val);*)
(*DBG:            ((__IEC_BOOL_t *) ptr)->flags |= __IEC_FORCE_FLAG;*)
(*DBG:            break;*)
(*DBG:        }*)
(*DBG:        case INT_ENUM: {*)
(*DBG:            memcpy(&((__IEC_INT_t *) ptr)->value, val, var_size);*)
(*DBG:            //((__IEC_INT_t *) ptr)->value = *((INT *) val);*)
(*DBG:            ((__IEC_INT_t *) ptr)->flags |= __IEC_FORCE_FLAG;*)
(*DBG:            break;*)
(*DBG:        }*)
(*DBG:        default:*)
(*DBG:            break;*)
(*DBG:        }*)
(*DBG:    } else {*)
(*DBG:        switch (debug_vars[idx].type) {*)
(*DBG:        case BOOL_ENUM:*)
(*DBG:            ((__IEC_BOOL_t *) ptr)->flags &= ~__IEC_FORCE_FLAG;*)
(*DBG:            break;*)
(*DBG:        case INT_ENUM:*)
(*DBG:            ((__IEC_INT_t *) ptr)->flags &= ~__IEC_FORCE_FLAG;*)
(*DBG:            break;*)
(*DBG:        default:*)
(*DBG:            break;*)
(*DBG:        }*)
(*DBG:    }*)
(*DBG:}*)
(*DBG:*)
(*DBG:void swap_bytes(void *ptr, size_t size) *)
(*DBG:{*)
(*DBG:    uint8_t *bytePtr = (uint8_t *)ptr;*)
(*DBG:    size_t i;*)
(*DBG:    for (i = 0; i < size / 2; ++i) *)
(*DBG:    {*)
(*DBG:        uint8_t temp = bytePtr[i];*)
(*DBG:        bytePtr[i] = bytePtr[size - 1 - i];*)
(*DBG:        bytePtr[size - 1 - i] = temp;*)
(*DBG:    }*)
(*DBG:}*)
(*DBG:*)
(*DBG:void trace_reset(void)*)
(*DBG:{*)
(*DBG:    for (size_t i=0; i < VAR_COUNT; i++) *)
(*DBG:    {*)
(*DBG:        force_var(i, false, 0);*)
(*DBG:    }*)
(*DBG:}*)
(*DBG:*)
(*DBG:void set_trace(size_t idx, bool forced, void *val)*)
(*DBG:{*)
(*DBG:    if (idx >= 0 && idx < VAR_COUNT) *)
(*DBG:    {*)
(*DBG:        if (endianness == REVERSE_ENDIANNESS)*)
(*DBG:        {*)
(*DBG:            // Aaaaarghhhh... Stupid AVR is Big Endian.*)
(*DBG:            swap_bytes(val, get_var_size(idx));*)
(*DBG:        }*)
(*DBG:*)
(*DBG:        force_var(idx, forced, val);*)
(*DBG:    }*)
(*DBG:}*)
(*DBG:*)
(*DBG:void set_endianness(uint8_t value)*)
(*DBG:{*)
(*DBG:    if (value == SAME_ENDIANNESS || value == REVERSE_ENDIANNESS)*)
(*DBG:    {*)
(*DBG:        endianness = value;*)
(*DBG:    }*)
(*DBG:}*)
(*DBG:*)