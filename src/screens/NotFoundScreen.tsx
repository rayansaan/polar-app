import React from 'react';
import { Link } from 'react-router-dom';
import { Button } from '../components/ui/button';
import { Film } from 'lucide-react';

export const NotFoundScreen: React.FC = () => {
  return (
    <div className="min-h-screen flex flex-col items-center justify-center px-6 text-center">
      <Film className="w-12 h-12 text-polar-ink-3 mb-4" aria-hidden="true" />
      <h1 className="text-3xl font-bold text-polar-ink mb-2">404</h1>
      <p className="text-sm text-polar-ink-3 mb-6 max-w-xs">
        Cette page n'existe pas ou a été déplacée.
      </p>
      <Link to="/feed">
        <Button>Retour à l'accueil</Button>
      </Link>
    </div>
  );
};
