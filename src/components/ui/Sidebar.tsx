import React from 'react';
import { NavLink, useLocation } from 'react-router-dom';
import { Clapperboard, Search, MapPin, User, Film } from 'lucide-react';
import { cn } from '../../lib/utils';

const navItems = [
  { to: '/feed', label: 'Films', icon: Clapperboard },
  { to: '/search', label: 'Recherche', icon: Search },
  { to: '/map', label: 'Carte', icon: MapPin },
  { to: '/profile', label: 'Profil', icon: User },
];

export const Sidebar: React.FC = () => {
  const location = useLocation();

  return (
    <aside className="hidden lg:flex flex-col w-[220px] fixed left-0 top-0 h-screen bg-polar-surface border-r border-polar-border z-50">
      <div className="p-6">
        <NavLink to="/feed" className="flex items-center gap-2 text-polar-ink">
          <Film className="w-5 h-5" />
          <span className="text-lg font-bold tracking-tight">PōLAR</span>
        </NavLink>
      </div>

      <nav className="flex-1 px-3 py-2">
        <ul className="space-y-1">
          {navItems.map((item) => {
            const isActive = location.pathname === item.to || (item.to !== '/profile' && location.pathname.startsWith(item.to));
            return (
              <li key={item.to}>
                <NavLink
                  to={item.to}
                  className={cn(
                    "flex items-center gap-3 px-3 py-2.5 text-sm font-medium transition-colors",
                    isActive
                      ? "bg-polar-ink text-polar-white"
                      : "text-polar-ink-2 hover:bg-polar-white hover:text-polar-ink"
                  )}
                >
                  <item.icon className="w-4 h-4" />
                  {item.label}
                </NavLink>
              </li>
            );
          })}
        </ul>
      </nav>

      <div className="p-4 border-t border-polar-border">
        <p className="text-[10px] uppercase tracking-wider text-polar-ink-3">
          Analyses cinématographiques
        </p>
      </div>
    </aside>
  );
};
