{-

This file contains:
  -- The basic inductive definition of James.

-}
{-# OPTIONS --safe #-}
module Cubical.HITs.James.Inductive.Base where

open import Cubical.Foundations.Prelude
open import Cubical.Foundations.Pointed
open import Cubical.Data.Nat

private
  variable
    ℓ : Level
module _
  ((X , x₀) : Pointed ℓ) where

  data 𝕁ames : ℕ → Type ℓ where
    [] : 𝕁ames 0
    _∷_   : {n : ℕ} → X → 𝕁ames n → 𝕁ames (1 + n)
    incl  : {n : ℕ} → 𝕁ames n → 𝕁ames (1 + n)
    incl∷ : {n : ℕ} → (x : X)(xs : 𝕁ames n) → incl (x ∷ xs) ≡ x ∷ incl xs
    unit  : {n : ℕ} → (xs : 𝕁ames n) → incl xs ≡ x₀ ∷ xs
    coh   : {n : ℕ} → (xs : 𝕁ames n) → PathP (λ i → incl (unit xs i) ≡ x₀ ∷ incl xs) (unit (incl xs)) (incl∷ x₀ xs)

  data 𝕁ames∞ : Type ℓ where
    inl : {n : ℕ} → 𝕁ames n → 𝕁ames∞
    push : {n : ℕ}(xs : 𝕁ames n) → inl xs ≡ inl (incl xs)
