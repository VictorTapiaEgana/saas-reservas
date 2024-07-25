import React from 'react'
import ReactDOM from 'react-dom/client'
import App from './App.jsx'
import './index.css'

import TemplateEmpresa from './pages/empresas/TemplateEmpresa.jsx';
import { createBrowserRouter, RouterProvider } from "react-router-dom";

import{ QueryClientProvider, QueryClient } from '@tanstack/react-query' 

const queryClient = new QueryClient;
const router = createBrowserRouter([
  {
     path: "/",
     element: (<App/>),
  },
  {
   // CAPTAR EL ERROR EN CASO QUE NO VENGA UN ID DE EMPRESA (INVALIDO O NULO)
     path:'/empresa/:idEmpresa',
     element:(<TemplateEmpresa/>)
  },
  {
     path: "about",
     element: <div>About</div>,
  },

]);

ReactDOM.createRoot(document.getElementById('root')).render(

  <React.StrictMode>   
     <QueryClientProvider client = { queryClient }>
          <RouterProvider router={router} />
      </QueryClientProvider>
  </React.StrictMode>,
  
)
