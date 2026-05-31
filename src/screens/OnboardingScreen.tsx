import React from 'react';
import { useNavigate } from 'react-router-dom';
import { Button } from '../components/ui/button';
import { Film } from 'lucide-react';

export const OnboardingScreen: React.FC<{ onComplete: () => void }> = ({ onComplete }) => {
  const navigate = useNavigate();

  const handleStart = () => {
    onComplete();
    navigate('/feed');
  };

  return (
    <div className="fixed inset-0 z-[200] bg-polar-bg flex flex-col items-center justify-center px-6">
      {/* Decorative grid */}
      <div
        className="absolute inset-0 opacity-[0.04]"
        style={{
          backgroundImage: `linear-gradient(var(--polar-ink) 1px, transparent 1px), linear-gradient(90deg, var(--polar-ink) 1px, transparent 1px)`,
          backgroundSize: '40px 40px',
        }}
      />

      {/* Corner brackets */}
      <div className="absolute top-6 left-6 w-8 h-8 border-l-2 border-t-2 border-polar-ink-3 rounded-tl-md" />
      <div className="absolute top-6 right-6 w-8 h-8 border-r-2 border-t-2 border-polar-ink-3 rounded-tr-md" />
      <div className="absolute bottom-6 left-6 w-8 h-8 border-l-2 border-b-2 border-polar-ink-3 rounded-bl-md" />
      <div className="absolute bottom-6 right-6 w-8 h-8 border-r-2 border-b-2 border-polar-ink-3 rounded-br-md" />

      <div className="relative z-10 flex flex-col items-center text-center">
        <div className="mb-8 flex items-center justify-center w-20 h-20 bg-polar-ink text-polar-white">
          <Film className="w-8 h-8" />
        </div>

        <h1 className="text-4xl lg:text-5xl font-bold tracking-tight text-polar-ink mb-3">
          PōLAR
        </h1>
        <p className="text-sm lg:text-base text-polar-ink-3 max-w-xs leading-relaxed mb-8">
          L'analyse cinématographique en profondeur. Découvrez, explorez et partagez votre passion du cinéma.
        </p>

        <Button
          onClick={handleStart}
          className="px-10 py-3 text-sm uppercase tracking-widest"
        >
          Entrer
        </Button>
      </div>
    </div>
  );
};
