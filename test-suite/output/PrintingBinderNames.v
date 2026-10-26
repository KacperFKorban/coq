(* Existing names are hidden by default, including with Printing All. *)
Axiom demo : forall (n : nat) (H : n = n), True.
Definition named (n : nat) (H : n = n) : True := I.
About demo.
Print named.
Set Printing All.
About demo.
Unset Printing All.

Set Printing Binder Names.
About demo.
Print demo.
Print named.

(* Keep named binders of independent types too; do not name arrows. *)
Check forall (left right : nat), nat -> nat.
Check forall (n : nat) (_ : n = n), True.
Check fun (unused : nat) => 0.
Check fun (_ : nat) => 0.

(* Existing renaming must still avoid capture and shadowing. *)
Check forall (n : nat) (H : n = n), forall (n : nat), n = n.
Section Shadowing.
  Variable H : nat.
  Check forall (H : nat), H = H.
  Check forall (H : nat), True.
End Shadowing.

(* Implicit arguments and nested products retain their names. *)
Axiom implicit_demo : forall {A : Type} [x : A] (H : x = x), True.
About implicit_demo.
Check (forall (H : True), True) -> True.

(* Goal printing uses the same setting. *)
Goal forall (n : nat) (H : n = n), True.
  Show.
Abort.

(* Printing All keeps the explicitly selected name setting. *)
Set Printing All.
About demo.
Unset Printing All.

(* Unsetting the flag restores the usual display. *)
Unset Printing Binder Names.
About demo.
Print named.

(* The option follows ordinary local option scope. *)
Section LocalOption.
  Local Set Printing Binder Names.
  About demo.
End LocalOption.
About demo.

(* Fast name generation remains compatible with the new flag. *)
Set Fast Name Printing.
Set Printing Binder Names.
About demo.
Unset Printing Binder Names.
About demo.
Unset Fast Name Printing.
