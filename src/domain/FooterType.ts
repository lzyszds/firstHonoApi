export interface Footer {
  footer_id: number;
  footer_type: string;
  footer_content: string;
  footer_url: string;
  footer_order: string;
  created_at: Date;
  is_enable: number;
}

export interface FooterSecondary {
  footer_id: number
  footer_content: string
  footer_order: string
  is_enable: number;
  children: Footer[]
}

export interface FooterPrincipal {
  footer_id: number
  footer_content: string
  footer_order: number
  children: FooterSecondary[]
}
