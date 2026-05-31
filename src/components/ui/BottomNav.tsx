import React from 'react';
import { NavLink, useLocation } from 'react-router-dom';
import { Clapperboard, Search, MapPin, User } from 'lucide-react';
import { cn } from '../../lib/utils';

const navItems = [
  { to: '/feed', label: 'Films', icon: Clapperboard },
  { to: '/search', label: 'Recherche', icon: Search },
  { to: '/map', label: 'Carte', icon: MapPin },
  { to: '/profile', label: 'Profil', icon: User },
];

export const BottomNav: React.FC = () => {
  const location = useLocation();

  return (
    <nav className="lg:hidden fixed bottom-0 left-0 right-0 h-[58px] bg-polar-surface border-t border-polar-border flex items-center justify-around z-50 pb-[env(safe-area-inset-bottom,0px)]">
      {navItems.map((item) => {
        const isActive = location.pathname === item.to || (item.to !== '/profile' && location.pathname.startsWith(item.to));
        return (
          <NavLink
            key={item.to}
            to={item.to}
            className={cn(
              "flex flex-col items-center justify-center gap-0.5 flex-1 h-full transition-colors",
              isActive ? "text-polar-ink" : "text-polar-ink-3"
            )}
          >
            <item.icon className="w-5 h-5" strokeWidth={isActive ? 2.5 : 1.5} />
            <span className="text-[9px] uppercase tracking-wider font-medium">{item.label}</span>
          </NavLink>
        );
      })}
    </nav>
  );
};
