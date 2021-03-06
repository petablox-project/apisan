(*===-- llvm_passmgr_builder.mli - LLVM OCaml Interface -------*- OCaml -*-===*
 *
 *                     The LLVM Compiler Infrastructure
 *
 * This file is distributed under the University of Illinois Open Source
 * License. See LICENSE.TXT for details.
 *
 *===----------------------------------------------------------------------===*)

(** Pass Manager Builder.

    This interface provides an OCaml API for LLVM pass manager builder
    from the [LLVMCore] library. *)

type t

(** See the [llvm::PassManagerBuilder] function. *)
external create : unit -> t
  = "llvm_pmbuilder_create"

(** See the [llvm::PassManagerBuilder::OptLevel] function. *)
external set_opt_level : int -> t -> unit
  = "llvm_pmbuilder_set_opt_level"

(** See the [llvm::PassManagerBuilder::SizeLevel] function. *)
external set_size_level : int -> t -> unit
  = "llvm_pmbuilder_set_size_level"

(** See the [llvm::PassManagerBuilder::DisableUnitAtATime] function. *)
external set_disable_unit_at_a_time : bool -> t -> unit
  = "llvm_pmbuilder_set_disable_unit_at_a_time"

(** See the [llvm::PassManagerBuilder::DisableUnrollLoops] function. *)
external set_disable_unroll_loops : bool -> t -> unit
  = "llvm_pmbuilder_set_disable_unroll_loops"

(** See the [llvm::PassManagerBuilder::Inliner] function. *)
external use_inliner_with_threshold : int -> t -> unit
  = "llvm_pmbuilder_use_inliner_with_threshold"

(** See the [llvm::PassManagerBuilder::populateFunctionPassManager] function. *)
external populate_function_pass_manager
  : [ `Function ] Llvm.PassManager.t -> t -> unit
  = "llvm_pmbuilder_populate_function_pass_manager"

(** See the [llvm::PassManagerBuilder::populateModulePassManager] function. *)
external populate_module_pass_manager
  : [ `Module ] Llvm.PassManager.t -> t -> unit
  = "llvm_pmbuilder_populate_module_pass_manager"

(** See the [llvm::PassManagerBuilder::populateLTOPassManager] function. *)
external populate_lto_pass_manager
  : [ `Module ] Llvm.PassManager.t -> internalize:bool -> run_inliner:bool -> t -> unit
  = "llvm_pmbuilder_populate_lto_pass_manager"
